program drop _all
log close _all
set more off	

*cd "C:\Dropbox\Stata.Programs\ROBUMETA\"
cd "/Users/erichedberg/Dropbox/Stata.Programs/ROBUMETA/"
adopath + .

log using robumetatest, replace

use hedgesexample.dta, clear

****With Small Sample Correction

robumeta effectsize k1, study(study) uweights(vareffsize) weighttype(fixed)
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(hierarchical) 
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(random) rho(.8)
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(fixed)
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

exit

****Without Small Sample Correction

robumeta effectsize k1, study(study) uweights(vareffsize) weighttype(fixed) nosmall
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(hierarchical) nosmall
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(random) rho(.8) nosmall
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(fixed) nosmall
ereturn list
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

***Trigger warning

set seed 101
sample 10, count

robumeta effectsize k1, study(study) variance(vareffsize) weighttype(random) rho(.8)
matrix list e(b)
matrix list e(V)
matrix list e(dfs)

log close

translate robumetatest.smcl robumetatest.pdf, replace

exit


use "ma_africa.dta"

robumeta es inst if sample_robust_acad==1, study(id) variance(es_var) weighttype (random) rho(.8)

sdf


robumeta es, study(id) variance(es_var) weighttype (random) rho(.8) 

robumeta es inst if sample_robust_acad==1, study(id) variance(es_var) weighttype (random) rho(.8) 



