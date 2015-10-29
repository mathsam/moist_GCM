#!/bin/tcsh -f
# Checkout Script for Experiment 'idealized_moist'
# ------------------------------------------------------------------------------
# The script created at 2015-09-19T15:23:45 via:
# /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/fremake --link --ncores=8 --platform=ncrc2.default --target=openmp --walltime=120 --xmlfile=/autofs/mnt/ncrc-svm1_home2/Junyi.Chai/xml_git/xml/idealized.xml idealized_moist
# ------------------------------------------------------------------------------

source $MODULESHOME/init/csh
echo Using source directory = /lustre/f1/unswept/Junyi.Chai/ulm/idealized_moist/src...
cd /lustre/f1/unswept/Junyi.Chai/ulm/idealized_moist/src

module avail git >& .git_avail
if (! -z .git_avail) then
    module load git
endif

unalias *

# ---------------- component 'fms_idealized_moist'
setenv CVSROOT :ext:cvs.princeton.rdhpcs.noaa.gov:/home/fms/cvs
cvs co -r ulm fms_idealized_moist
 
      cvs co -r ulm atmos_solo
      cvs co -r ulm atmos_param/tke_turb
       

# ---------------- component 'coupler'
git clone --recursive -b ulm http://gitlab.gfdl.noaa.gov/fms/coupler.git
 
          /bin/rm -r coupler/{coupler_main.F90,flux_exchange.F90}
           

exit 0
