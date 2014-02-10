/*
 * Convert norm-conserving pseudopotentials created with 
 * the fhi98PP package into the native CPMD format.
 *
 * Copyright (c)2004 by axel.kohlmeyer at rub.de
 * $Id$
 *
 * No warranties. Use at your own risk.
 * If you notice a bug, please let me know.
 */

#include <stdio.h>
#include <errno.h>
#include <string.h>

/* periodic table of elements for translation of ordinal to atom type */
static const char *pte[] = {
    "X",  "H",  "He", "Li", "Be", "B",  "C",  "N",  "O",  "F",  "Ne",
    "Na", "Mg", "Al", "Si", "P" , "S",  "Cl", "Ar", "K",  "Ca", "Sc",
    "Ti", "V",  "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "Ga", "Ge",
    "As", "Se", "Br", "Kr", "Rb", "Sr", "Y",  "Zr", "Nb", "Mo", "Tc",
    "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn", "Sb", "Te", "I",  "Xe",
    "Cs", "Ba", "La", "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb",
    "Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", "Ta", "W",  "Re", "Os",
    "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Po", "At", "Rn", "Fr",
    "Ra", "Ac", "Th", "Pa", "U",  "Np", "Pu", "Am", "Cm", "Bk", "Cf",
    "Es", "Fm", "Md", "No", "Lr"
 };
static const int nr_pte = sizeof(pte) / sizeof(char *);

/* labels for l quantum number */
static const char llabel[] = { 's', 'p', 'd', 'f' };
static const int nr_llabel = sizeof(llabel) / sizeof(char);

/* tables for translating the functionals */
/* list from the fhi98PP package:
  c         1  LDA   Wigner
  c         2  LDA   Hedin/Lundqvist
  c         3  LDA   Ceperley/Alder Perdew/Zunger (1980)
  c         4 SGGA   Perdew/Wang (1991)
  c         5 SGGA   Becke (1988) X, Perdew (1986) C
  c         6 SGGA   Perdew/Burke/Ernzerhof (1996)
  c         7  LDA   Zhao/Parr
  c         8 SLDA   Ceperley/Alder Perdew/Wang (1991)
  c         9  GGA   Becke (1988) X, Lee/Yang/Parr (1988) C
  c        10  GGA   Perdew/Wang (1991) X, Lee/Yang/Parr (1988) C
  c        11  LDA   exchange only
  c        12  KLI   excact Kohn-Sham exchange in the Krieger et al.
  c                  approximation
  c        13  KLI   KLI+effective core potential
  c        14  GGA   Hammer/Norskov revised PBE GGA (RPBE)
  c        15  GGA   Zhang/Wang revised PBE GGA (revPBE)
  c        16  MGGA  Perdew/Kurth/Zupan/Blaha MetaGGA (1999)
  c        17  GGA   GGA exchange + LDA correlation, PBE X, LDA C
  c        18  KLI   exact exchange + LDA correlation
  c        19  KLI   exact exchange + PBE GGA correlation
  c        default is 8
*/
/* translation table for cpmd functionals. -1 means unsupported. */
static const int xctrans[] = { -1, 1500, 1600, 1100, 1422, 1111, 1434, 
                               -1, 1400, 1312, 1342, 1000, -1, -1, -1, 
                               1144, -1, -1, -1, -1, -1, -1};
static const int nr_xctrans = sizeof(xctrans) / sizeof(int);
/* corresponding functional labels */
static const char *xclabel[] = { "(unknown)", "LDA / Wigner", 
                               "LDA / Hedin/Lundqvist",
                               "LDA / CA/PZ", "GGA / PW91",
                               "GGA / BP", "GGA / PBE",
                               "LDA / Zhao/Parr", "LDA / CA/PW",
                               "GGA / BLYP", "GGA / PW/LYP",
                               "LDA / exch only", "KLI", "KLI + ecp",
                               "GGA / RPBE", "GGA / revPBE",
                               "MGGA / PKZB", "GGA / PBE X + LDA C",
                               "KLI + LDA C", "KLI + PBE C" };


#define MAX_LINE 200
#define MAX_POT 5

int main(int argc, char **argv)
{
    float z, zv, nlcc;
    int   iz, nc, nv, iexc, ltmx, mmax[MAX_POT], lmax;
    char  spptype;
    double amesh[MAX_POT], *rm[MAX_POT], *ups[MAX_POT], *vps[MAX_POT];
    double *rnl, *cnl;
    
    FILE *dat, *cpi, *psp;
    char linebuf[MAX_LINE + 1];
    int ierr, n, i, j;
    
    if (argc != 4) {
        printf("usage: fhi2cpmd <.dat file> <.cpi file> <.psp file>\n");
        return 1;
    }

    /* try to open the .dat file. 
       
       this contains the contents of the .ini file used to create the
       matching .cpi file, prefixed with '@' in the first column.
    */
    dat = fopen(argv[1], "r");
    if (dat == NULL) {
        ierr=errno;
        printf("could not open .dat file '%s': %s\n", 
               argv[1], strerror(ierr));
        return 2;
    }

    do {
        fgets(linebuf,MAX_LINE, dat);
    } while ((linebuf[0] != '@') && !feof(dat) && !ferror(dat));
        
    /* parse all-electron configuration from .dat file */
    n = sscanf(linebuf+1,"%f%d%d%d%f", &z, &nc, &nv, &iexc, &nlcc);
    if (n < 5) nlcc = 0.0; /* default is no NLCC */
    if (n < 4) iexc = 8;   /* default is LDA */
    if (n < 3) {
        printf("could not parse .ini file header in .dat file:\n%s", linebuf);
        return 3;
    }
    /* sanity checks */
    iz = (int) (z+0.5);
    if ((iz < 1) || (iz >= nr_pte)) {
        printf("element #%d not supported\n", iz);
        return 4;
    }
    
    if ((iexc < 0) || (iexc >= nr_xctrans) || (xctrans[iexc] < 0)) {
        printf("X-C functional #%d not supported\n", iexc);
        return 5;
    }
    
    if ((nlcc < 0.0) || (nlcc > 4.0)) {
        printf("NLCC=%6.2f is not supported\n", nlcc);
        return 6;
    }
    
    printf("Atom:       %s\n", pte[iz]);
    printf("States:     %d (%d core / %d valence)\n", nc+nv, nc, nv);
    printf("Functional: #%-2d = %s, CPMD code %d\n", 
           iexc, xclabel[iexc], xctrans[iexc]);
    printf("NLCC rc:  %6.2f\n", nlcc);

    fgets(linebuf,MAX_LINE, dat);
    n = sscanf(linebuf+1,"%d%c", &ltmx, &spptype);
    if (n != 2) {
        printf("could not parse pp generation flags: '%s'\n", linebuf);
        return 8;
    }

    /* try to open the .cpi file with the actual pseudopotential. */
    cpi = fopen(argv[2], "r");
    if (dat == NULL) {
        ierr=errno;
        printf("could not open .cpi file '%s': %s\n", 
               argv[2], strerror(ierr));
        return 2;
    }
    
    /* some read pseudo parameters from .cpi file ... */
    fgets(linebuf,MAX_LINE, cpi);
    n = sscanf(linebuf,"%f%d", &zv, &lmax);
    if (n != 2) {
        printf("could not parse pseudopotential header: '%s'\n", linebuf);
        return 8;
    }
    
    /* ... and skip over 10 unused lines */
    for (i = 0; i < 10; ++i) {
        fgets(linebuf,MAX_LINE, cpi);
    }

    printf("Z=:       %6.2f\nZV=:      %6.2f\n", z, zv);
    printf("LTMX=:      %d\nLMAX+1=:    %d\n", ltmx, lmax);
    
    /* open psp output */
    psp = fopen(argv[3], "w");
    if (psp == NULL) {
        ierr=errno;
        printf("could not open .psp file '%s': %s\n", 
               argv[3], strerror(ierr));
        return 10;
    }

    fprintf(psp, "&ATOM\n Z  =%5d\n ZV =%5d\n XC =%5d%15.6f\n",
            iz, (int)(zv+0.5), xctrans[iexc], 2.0/3.0);
    fprintf(psp, " TYPE=NORMCONSERVING NUMERIC\n&END\n");

    /* reposition .dat stream for copying data for &INFO section. */
    rewind(dat);
    fgets(linebuf,MAX_LINE, dat);
    fgets(linebuf,MAX_LINE, dat);
    fprintf(psp,"&INFO\n************************************************************\n");
    for (i = 0; i < 10; ++i) {
        fgets(linebuf,MAX_LINE, dat);
        fputs(linebuf,psp);
        fputs(linebuf,stdout);
    }

    /* proceed to pseudo atom generation info block */
    do {
        fgets(linebuf,MAX_LINE, dat);
    } while ((strstr(linebuf, "pseudo atom") == NULL) && !feof(dat) && !ferror(dat));
        
    for (i = 0; i < (lmax+3); ++i) {
        fgets(linebuf,MAX_LINE, dat);
        fputs(linebuf,psp);
        fputs(linebuf,stdout);
    }
    fprintf(psp,"************************************************************\n&END\n");
    
    /* read in pseudo potential blocks */
    for (i = 0; i < lmax; ++i) {
        printf("Reading l=%d\n", i);
        fgets(linebuf,MAX_LINE, cpi);
        n = sscanf(linebuf,"%d%lf", mmax + i, amesh + i);
        rm[i]  = (double *) malloc(sizeof(double) * mmax[i]);
        ups[i] = (double *) malloc(sizeof(double) * mmax[i]);
        vps[i] = (double *) malloc(sizeof(double) * mmax[i]);
        for (j = 0; j < mmax[i]; ++j) {
            fgets(linebuf,MAX_LINE, cpi);
            n = sscanf(linebuf,"%*d%lf%lf%lf", rm[i]+j, ups[i]+j, vps[i]+j);
            
            if (n != 3) {
                printf("could not parse mesh data for l=%d, index=%d: '%s'\n", 
                       i, j, linebuf);
                return 14;
            }
        }
    }

    /* read NLCC block, if available (nlcc = 0.0 means no nlcc). */
    if (nlcc > 0.001) { 
        rnl = (double *) malloc(sizeof(double) * mmax[0]);
        cnl = (double *) malloc(sizeof(double) * mmax[0]);
        printf("Reading nlcc for rc=%6.2f\n", nlcc);
        for (j = 0; j < mmax[0]; ++j) {
            fgets(linebuf,MAX_LINE, cpi);
            n = sscanf(linebuf,"%lf%lf", rnl+j, cnl+j);
            if (n != 2) {
                printf("could not parse nlcc data at mesh point %d: '%s'\n", 
                       j, linebuf);
                return 14;
            }
        }
    }
    
    /* write potential block */
    printf("writing potentials:");
    fprintf(psp, "&POTENTIAL\n%6d%16.8E\n",mmax[0],amesh[0]);
    for (i = 0; i < mmax[0]; ++i) {
        fprintf(psp, "%18.8E", rm[0][i]);
        for (j = 0; j < lmax; ++j) {
            fprintf(psp, "%18.8E", vps[j][i]);
        }
        fprintf(psp, "\n");
    }
    printf(" done\n");
    fprintf(psp, "&END\n");
    
    /* write wavefunction block */
    printf("writing wavefunctions:");
    fprintf(psp, "&WAVEFUNCTION\n%6d%16.8E\n",mmax[0],amesh[0]);
    for (i = 0; i < mmax[0]; ++i) {
        fprintf(psp, "%18.8E", rm[0][i]);
        for (j = 0; j < lmax; ++j) {
            fprintf(psp, "%18.8E", ups[j][i]);
        }
        fprintf(psp, "\n");
    }
    printf(" done\n");
    fprintf(psp, "&END\n");

    /* write NLCC block, if available (nlcc = 0.0 means no nlcc). */
    if (nlcc > 0.001) { 
        printf("writing nlcc density:");
        fprintf(psp, "&NLCC\n     NUMERIC\n%6d\n",mmax[0]);
        for (i = 0; i < mmax[0]; ++i) { /* divide by 4.0*Pi */
            fprintf(psp, "%18.8E%18.8E\n", rnl[i], cnl[i]/12.56637061435917295376);
        }
        printf(" done\n");
        fprintf(psp, "&END\n");
    }
    
    fclose(psp);
    fclose(cpi);
    fclose(dat);
    
    return 0;
}


/*
 * Local Variables:
 * compile-command: "cc -O fhi2cpmd.c   -o fhi2cpmd"
 * End:
 */
