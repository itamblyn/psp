  �$  g   k820309              10.1        H��M                                                                                                           
       fpmd2upf.f90 FPMD2UPF_MODULE              TOLMESH                      @                      
       DP                                            
                            @                      
       NDMX                                                                                                                                                                           �              3500                                                                                           3                  @                        '��                  #PSD    #POTTYP 	   #TMIX 
   #TNLCC    #IGAU    #LLOC    #NBETA    #LLL    #NCHAN    #MESH    #ZV    #DX    #RAB    #RW    #VNL    #VLOC    #VRPS    #WGV    #RC    #WRC    #RCL    #AL    #BL    #NRPS    #LRPS     #OC !   #RPS "   #RHOC #                �                                                              �                      	                                       �                       
                               �                                                      �                                                       �                            $                          �                            (                         �                                   ,                   p          p            p                                       �                            <       	                   �                            @       
                   �                           H          
                �                           P          
                �                           �      X                 
  p          p �          p �                                    �                           �      �m                
  p          p �          p �                                    �                           �6      �                
  p �        p �        p            p �        p                                       �                           �      ��               
  p          p �          p �                                     �                           �6      ��               
  p �        p �        p            p �        p                                       �                                  x�               
  p          p            p                                       �                                  ��               
  p          p            p                                       �                                  ��               
  p          p            p                                       �                           	       ��               
  p          p          p            p          p                                       �                           	        �               
  p          p          p            p          p                                       �                           	       H�               
  p          p          p            p          p                                       �                            ��                        �                                    ��                 p          p            p                                      �                      !            ��               
  p          p            p                                      �                      "     �6      ȴ               
  p �        p �        p            p �        p                                       �                      #     �      Hj               
  p          p �          p �                        #         @                          $                  #READ_PSEUDO_FPMD%ABS %   #READ_PSEUDO_FPMD%TRIM &   #AP '   #PSFILE (                                      %     ABS                                    &     TRIM           D @                       '     ��             #PSEUDO_NCPP                                      (                            #         @                         )                  #READ_HEAD_PP%MIN *   #READ_HEAD_PP%SIZE +   #IUNIT ,   #AP -   #ERR_MSG .   #IERR /                                      *     MIN                                    +     SIZE           
                          ,                     
D                         -     ��             #PSEUDO_NCPP              D                        .                     1           D                         /            #         @                         0                  #READ_GIANNOZ%MINVAL 1   #READ_GIANNOZ%EXP 2   #READ_GIANNOZ%DBLE 3   #READ_GIANNOZ%SIZE 4   #UNI 5   #AP 6   #IERR 7                                      1     MINVAL                                    2     EXP                                    3     DBLE                                    4     SIZE           
                          5                     
D                         6     ��             #PSEUDO_NCPP              D                         7            #         @                         8                  #READ_NUMERIC_PP%MINVAL 9   #READ_NUMERIC_PP%SIZE :   #IUNIT ;   #AP <   #ERR_MSG =   #IERR >                                      9     MINVAL                                    :     SIZE           
  @                       ;                     
D @                       <     ��             #PSEUDO_NCPP              D @                      =                     1           D @                       >            #         @                         ?                   #IUNIT @   #AP A   #ERR_MSG B   #IERR C             
  @                       @                     
D @                       A     ��             #PSEUDO_NCPP              D @                      B                     1           D @                       C            #         @                          D                   #IUNIT E   #INFO F             
                          E                     D                         F            #         @                         G                  #ANALYTIC_TO_NUMERIC%SQRT H   #ANALYTIC_TO_NUMERIC%EXP I   #ANALYTIC_TO_NUMERIC%DBLE J   #ANALYTIC_TO_NUMERIC%SIZE K   #AP L                                      H     SQRT                                    I     EXP                                    J     DBLE                                    K     SIZE           
D                         L     ��             #PSEUDO_NCPP    #         @                          M                   #AP N             
                          N     ��            #PSEUDO_NCPP    %         @                      O                  
       #CALCULATE_DX%LOG P   #CALCULATE_DX%MIN Q   #CALCULATE_DX%DBLE R   #CALCULATE_DX%SIZE S   #A T   #M U                                      P     LOG                                    Q     MIN                                    R     DBLE                                    S     SIZE           
 @                      T                   
              &                                                     
  @                       U           #         @                         V                  #READ_ATOMIC_WF%LEN_TRIM W   #READ_ATOMIC_WF%MIN X   #READ_ATOMIC_WF%SIZE Y   #READ_ATOMIC_WF%ABS Z   #IUNIT [   #AP \   #ERR_MSG ]   #IERR ^                                      W     LEN_TRIM                                    X     MIN                                    Y     SIZE                                    Z     ABS           
                          [                     
D                         \     ��             #PSEUDO_NCPP              D                        ]                     1           D                         ^            #         @                         _                  #READ_ATOMIC_CC%SIZE `   #READ_ATOMIC_CC%ABS a   #IUNIT b   #AP c   #ERR_MSG d   #IERR e                                      `     SIZE                                    a     ABS           
                          b                     
D                         c     ��             #PSEUDO_NCPP              D                        d                     1           D                         e               �   %      fn#fn %   �      b   uapp(FPMD2UPF_MODULE    �   ;   J  KINDS      8   J   PARAMETERS    P  =   J  RADIAL_GRIDS    �  h       DP+KINDS "   �  l       NDMX+RADIAL_GRIDS !   a  i       LMAXX+PARAMETERS    �  O      PSEUDO_NCPP       H   a   PSEUDO_NCPP%PSD #   a  H   a   PSEUDO_NCPP%POTTYP !   �  @   a   PSEUDO_NCPP%TMIX "   �  @   a   PSEUDO_NCPP%TNLCC !   )  @   a   PSEUDO_NCPP%IGAU !   i  @   a   PSEUDO_NCPP%LLOC "   �  @   a   PSEUDO_NCPP%NBETA     �  �   a   PSEUDO_NCPP%LLL "   }  @   a   PSEUDO_NCPP%NCHAN !   �  @   a   PSEUDO_NCPP%MESH    �  @   a   PSEUDO_NCPP%ZV    =  @   a   PSEUDO_NCPP%DX     }  �   a   PSEUDO_NCPP%RAB      �   a   PSEUDO_NCPP%RW     �  �   a   PSEUDO_NCPP%VNL !   Y	  �   a   PSEUDO_NCPP%VLOC !   �	  �   a   PSEUDO_NCPP%VRPS     �
  �   a   PSEUDO_NCPP%WGV    5  �   a   PSEUDO_NCPP%RC     �  �   a   PSEUDO_NCPP%WRC     ]  �   a   PSEUDO_NCPP%RCL      �   a   PSEUDO_NCPP%AL    �  �   a   PSEUDO_NCPP%BL !   y  @   a   PSEUDO_NCPP%NRPS !   �  �   a   PSEUDO_NCPP%LRPS    M  �   a   PSEUDO_NCPP%OC     �  �   a   PSEUDO_NCPP%RPS !   �  �   a   PSEUDO_NCPP%RHOC !   )  �       READ_PSEUDO_FPMD %   �  4      READ_PSEUDO_FPMD%ABS &   �  5      READ_PSEUDO_FPMD%TRIM $     Q   a   READ_PSEUDO_FPMD%AP (   l  H   a   READ_PSEUDO_FPMD%PSFILE    �  �       READ_HEAD_PP !   K  4      READ_HEAD_PP%MIN "     5      READ_HEAD_PP%SIZE #   �  8   a   READ_HEAD_PP%IUNIT     �  Q   a   READ_HEAD_PP%AP %   =  D   a   READ_HEAD_PP%ERR_MSG "   �  8   a   READ_HEAD_PP%IERR    �  �       READ_GIANNOZ $   q  7      READ_GIANNOZ%MINVAL !   �  4      READ_GIANNOZ%EXP "   �  5      READ_GIANNOZ%DBLE "     5      READ_GIANNOZ%SIZE !   F  8   a   READ_GIANNOZ%UNI     ~  Q   a   READ_GIANNOZ%AP "   �  8   a   READ_GIANNOZ%IERR       �       READ_NUMERIC_PP '   �  7      READ_NUMERIC_PP%MINVAL %   �  5      READ_NUMERIC_PP%SIZE &     8   a   READ_NUMERIC_PP%IUNIT #   K  Q   a   READ_NUMERIC_PP%AP (   �  D   a   READ_NUMERIC_PP%ERR_MSG %   �  8   a   READ_NUMERIC_PP%IERR !     j       READ_ANALYTIC_PP '   �  8   a   READ_ANALYTIC_PP%IUNIT $   �  Q   a   READ_ANALYTIC_PP%AP )     D   a   READ_ANALYTIC_PP%ERR_MSG &   O  8   a   READ_ANALYTIC_PP%IERR     �  U       CHECK_FILE_TYPE &   �  8   a   CHECK_FILE_TYPE%IUNIT %     8   a   CHECK_FILE_TYPE%INFO $   L  �       ANALYTIC_TO_NUMERIC )     5      ANALYTIC_TO_NUMERIC%SQRT (   @  4      ANALYTIC_TO_NUMERIC%EXP )   t  5      ANALYTIC_TO_NUMERIC%DBLE )   �  5      ANALYTIC_TO_NUMERIC%SIZE '   �  Q   a   ANALYTIC_TO_NUMERIC%AP    /  H       AP_INFO    w  Q   a   AP_INFO%AP    �  �       CALCULATE_DX !   x  4      CALCULATE_DX%LOG !   �  4      CALCULATE_DX%MIN "   �  5      CALCULATE_DX%DBLE "     5      CALCULATE_DX%SIZE    J  �   a   CALCULATE_DX%A    �  8   a   CALCULATE_DX%M       �       READ_ATOMIC_WF (   �   9      READ_ATOMIC_WF%LEN_TRIM #   !  4      READ_ATOMIC_WF%MIN $   C!  5      READ_ATOMIC_WF%SIZE #   x!  4      READ_ATOMIC_WF%ABS %   �!  8   a   READ_ATOMIC_WF%IUNIT "   �!  Q   a   READ_ATOMIC_WF%AP '   5"  D   a   READ_ATOMIC_WF%ERR_MSG $   y"  8   a   READ_ATOMIC_WF%IERR    �"  �       READ_ATOMIC_CC $   L#  5      READ_ATOMIC_CC%SIZE #   �#  4      READ_ATOMIC_CC%ABS %   �#  8   a   READ_ATOMIC_CC%IUNIT "   �#  Q   a   READ_ATOMIC_CC%AP '   >$  D   a   READ_ATOMIC_CC%ERR_MSG $   �$  8   a   READ_ATOMIC_CC%IERR 