version 14.2
cap log close

*****************************************************
* First created by Matthew Naven on November 10, 2016 *
*****************************************************

if c(machine_type)=="Macintosh (Intel 64-bit)" & c(username)=="Naven" {
	local home "/Users/Naven/Documents/research/data/ipeds"
}
if c(hostname)=="sapper" {
	global S_ADO BASE;.;PERSONAL;PLUS;SITE;OLDPLACE
	local home "/home/users/navenm.AD3/research/data/ipeds"
}
cd `home'

log using log_files/append_directory_information.log, replace

clear all
graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color


***************
* Description *
***************
/*
This file appends all of the individual years of the directory information
datasets from IPEDS and then cleans the resulting dataset.
*/


**********
* Macros *
**********
#delimit ;
local esttab_options `"
	b(%9.3g) se(%9.3g)
	star(* 0.1 ** 0.05 *** 0.01)
	noobs
	compress
	label interaction(\times) nomtitles
	booktabs
	replace
	substitute(\_ _)
	"' ;
local esttab_scalars `"
	scalars(
	"N Observations"
	"r2_a Adjusted $ R^2 $"
	)
	sfmt(
	%9.3gc
	%9.3g
	)
	"' ;
local estab_mgroups `"
	mgroups(""
	, pattern()
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span}))
	"' ;
local esttab_keep `"
	keep(
	
	)
	order(
	
	)
	"' ;
#delimit cr


timer on 1
*****************
* Begin Do File *
*****************
**************** Append individual years of data
* 1980
use clean_data/1980/dct_ic1980.dta, clear
tostring zip, replace
gen year = 1980
label variable year "Year of Fall Semester"
tempfile hd_1980
save `hd_1980'

* 1984
use clean_data/1984/dct_ic1984.dta, clear
tostring zip, replace
tostring gentele, replace
tostring fdgrmoyr, replace
gen year = 1984
label variable year "Year of Fall Semester"
tempfile hd_1984
save `hd_1984'

* 1985 (no data by race)
use clean_data/1985/dct_ic1985.dta, clear
tostring gentele, replace
tostring zip, replace
decode sequen, gen(temp_sequen)
drop sequen
rename temp_sequen sequen
tostring fdgrmoyr, replace
gen year = 1985
label variable year "Year of Fall Semester"
tempfile hd_1985
save `hd_1985'

* 1986
use clean_data/1986/dct_ic1986_a.dta, clear
drop if unitid == 247719
tostring zip, replace
decode sequen, gen(temp_sequen)
drop sequen
rename temp_sequen sequen
decode fdgrmoyr, gen(temp_fdgrmoyr)
drop fdgrmoyr
rename temp_fdgrmoyr fdgrmoyr
gen year = 1986
label variable year "Year of Fall Semester"
tempfile hd_1986
save `hd_1986'

* 1987 (no data by race)
use clean_data/1987/dct_ic1987_a.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring gentele, replace
gen year = 1987
label variable year "Year of Fall Semester"
tempfile hd_1987
save `hd_1987'

* 1988
use clean_data/1988/dct_ic1988_a.dta, clear
tostring gentele, replace
gen year = 1988
label variable year "Year of Fall Semester"
tempfile hd_1988
save `hd_1988'

* 1989 (no data by race)
use clean_data/1989/dct_ic1989_a.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring zip, replace
tostring gentele, replace
gen year = 1989
label variable year "Year of Fall Semester"
tempfile hd_1989
save `hd_1989'

* 1990
use clean_data/1990/dct_ic90hd.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring zip, replace
tostring gentele, replace
gen year = 1990
label variable year "Year of Fall Semester"
tempfile hd_1990
save `hd_1990'

* 1991
use clean_data/1991/dct_ic1991_hdr.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring gentele, replace
gen year = 1991
label variable year "Year of Fall Semester"
tempfile hd_1991
save `hd_1991'

* 1992
use clean_data/1992/dct_ic1992_a.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring zip, replace
tostring agenname, replace
tostring agenstrt, replace
tostring agenplce, replace
tostring agenst, replace
gen year = 1992
label variable year "Year of Fall Semester"
tempfile hd_1992
save `hd_1992'

* 1993
use clean_data/1993/dct_ic1993_a.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring zip, replace
tostring gentele, replace
gen year = 1993
label variable year "Year of Fall Semester"
tempfile hd_1993
save `hd_1993'

* 1994
use clean_data/1994/dct_ic1994_a.dta, clear
decode formrt, gen(temp_formrt)
drop formrt
rename temp_formrt formrt
tostring zip, replace
tostring gentele, replace
gen year = 1994
label variable year "Year of Fall Semester"
tempfile hd_1994
save `hd_1994'

* 1995
use clean_data/1995/dct_ic9596_a.dta, clear
tostring opeid, replace
tostring zip, replace
tostring gentele, replace
gen year = 1995
label variable year "Year of Fall Semester"
tempfile hd_1995
save `hd_1995'

* 1996
use clean_data/1996/dct_ic9697_a.dta, clear
tostring zip, replace
tostring gentele, replace
gen year = 1996
label variable year "Year of Fall Semester"
tempfile hd_1996
save `hd_1996'

* 1997
use clean_data/1997/dct_ic9798_hdr.dta, clear
tostring zip, replace
tostring gentele, replace
tostring ein, replace
gen year = 1997
label variable year "Year of Fall Semester"
tempfile hd_1997
save `hd_1997'

* 1998
use clean_data/1998/dct_ic98hdac.dta, clear
tostring closedat, replace
tostring zip, replace
tostring gentele, replace
tostring fintele, replace
tostring admtele, replace
tostring ein, replace
gen year = 1998
label variable year "Year of Fall Semester"
tempfile hd_1998
save `hd_1998'

* 1999
use clean_data/1999/dct_ic99_hd.dta, clear
tostring zip, replace
*replace gentele = . if inlist(gentele, -1)
label values gentele .
tostring gentele, replace format(%15.0f)
*replace fintele = . if inlist(fintele, -1)
label values fintele .
tostring fintele, replace format(%15.0f)
*replace admtele = . if inlist(admtele, -1)
label values admtele .
tostring admtele, replace format(%15.0f)
tostring ein, replace
gen year = 1999
label variable year "Year of Fall Semester"
tempfile hd_1999
save `hd_1999'

* 2000
use clean_data/2000/dct_fa2000hd.dta, clear
tostring zip, replace
*replace gentele = . if inlist(gentele, -1)
label values gentele .
tostring gentele, replace format(%15.0f)
*replace admtele = . if inlist(admtele, -1)
label values admtele .
tostring admtele, replace format(%15.0f)
tostring ein, replace
*replace closedat = . if inlist(closedat, -2)
label values closedat .
tostring closedat, replace
tostring fybeg, replace
tostring fyend, replace
gen year = 2000
label variable year "Year of Fall Semester"
tempfile hd_2000
save `hd_2000'

* 2001
use clean_data/2001/dct_fa2001hd.dta, clear
tostring zip, replace
*replace gentele = . if inlist(gentele, -3, -1)
label values gentele .
tostring gentele, replace format(%15.0f)
*replace fintele = . if inlist(fintele, -3, -1)
label values fintele .
tostring fintele, replace format(%15.0f)
*replace admtele = . if inlist(admtele, -3, -1)
label values admtele .
tostring admtele, replace format(%15.0f)
tostring ein, replace
*replace closedat = . if inlist(closedat, -3, -2)
label values closedat .
tostring closedat, replace
gen year = 2001
label variable year "Year of Fall Semester"
tempfile hd_2001
save `hd_2001'

* 2002
use clean_data/2002/dct_hd2002.dta, clear
tostring ein, replace
tostring fybeg, replace
tostring fyend, replace
gen year = 2002
label variable year "Year of Fall Semester"
tempfile hd_2002
save `hd_2002'

* 2003
use clean_data/2003/dct_hd2003.dta, clear
tostring ein, replace
*replace fybeg = . if inlist(fybeg, -2, -1)
label values fybeg .
tostring fybeg, replace
*replace fyend = . if inlist(fyend, -2, -1)
label values fyend .
tostring fyend, replace
gen year = 2003
label variable year "Year of Fall Semester"
tempfile hd_2003
save `hd_2003'

* 2004
use clean_data/2004/dct_hd2004.dta, clear
tostring ein, replace
gen year = 2004
label variable year "Year of Fall Semester"
tempfile hd_2004
save `hd_2004'

* 2005
use clean_data/2005/dct_hd2005.dta, clear
tostring ein, replace
gen year = 2005
label variable year "Year of Fall Semester"
tempfile hd_2005
save `hd_2005'

* 2006
use clean_data/2006/dct_hd2006.dta, clear
tostring gentele, replace format(%16.0f)
tostring fintele, replace format(%16.0f)
tostring admtele, replace format(%16.0f)
gen year = 2006
label variable year "Year of Fall Semester"
tempfile hd_2006
save `hd_2006'

* 2007
use clean_data/2007/dct_hd2007.dta, clear
tostring gentele, replace format(%16.0f)
gen year = 2007
label variable year "Year of Fall Semester"
tempfile hd_2007
save `hd_2007'

* 2008
use clean_data/2008/dct_hd2008.dta, clear
gen year = 2008
label variable year "Year of Fall Semester"
tempfile hd_2008
save `hd_2008'

* 2009
use clean_data/2009/dct_hd2009.dta, clear
gen year = 2009
label variable year "Year of Fall Semester"
tempfile hd_2009
save `hd_2009'

* 2010
use clean_data/2010/dct_hd2010.dta, clear
gen year = 2010
label variable year "Year of Fall Semester"
tempfile hd_2010
save `hd_2010'

* 2011
use clean_data/2011/dct_hd2011.dta, clear
tostring gentele, replace format(%16.0f)
tostring ein, replace
tostring opeid, replace
gen year = 2011
label variable year "Year of Fall Semester"
tempfile hd_2011
save `hd_2011'

* 2012
use clean_data/2012/dct_hd2012.dta, clear
tostring ein, replace
tostring opeid, replace
gen year = 2012
label variable year "Year of Fall Semester"
tempfile hd_2012
save `hd_2012'

* 2013
use clean_data/2013/dct_hd2013.dta, clear
tostring ein, replace
tostring opeid, replace
gen year = 2013
label variable year "Year of Fall Semester"
tempfile hd_2013
save `hd_2013'

* 2014
use clean_data/2014/dct_hd2014.dta, clear
tostring ein, replace
tostring opeid, replace
gen year = 2014
label variable year "Year of Fall Semester"
tempfile hd_2014
save `hd_2014'

* 2015
use clean_data/2015/dct_hd2015.dta, clear
tostring ein, replace
tostring opeid, replace
gen year = 2015
label variable year "Year of Fall Semester"
tempfile hd_2015
save `hd_2015'




**** Append all years of data
clear
forvalues data_year = 2015 (-1) 1984 {
	di `data_year'
	append using "`hd_`data_year''"
}
append using `hd_1980'

compress
order unitid instnm year sector iclevel control city stabbr fips countynm countycd ///
	obereg locale longitud latitude ein opeid landgrnt hbcu tribal affil ///
	hloffer ugoffer groffer fte enrtot instsize hdegofr1 deggrant medical ///
	cindon cinson cotson cindoff cinsoff cotsoff cindfam cinsfam cotsfam ///
	pctmin1 pctmin2 pctmin3 pctmin4 ptacipef
sort unitid year
xtset unitid year, yearly
label data "IPEDS Directory Information"
save clean_data/directory_information_appended.dta, replace








**************** Clean combined dataset
*codebook, all problems detail
sum

* Recode variables
recode control 0=. -3=.
recode sector 99=.

* Public/Private
label def public 1 "Public" 0 "Private"
gen public:public = (control==1)
replace public = . if mi(control)
label var public "Public Institution"

label def private_nfp 1 "Private NFP" 0 "Public/Private FP"
gen private_nfp:private_nfp = (control==2 & year>=1986)
replace private_nfp = . if mi(control)
replace private_nfp = . if year<=1985
label var private_nfp "Private Not-For-Profit Institution"

label def private_fp 1 "Private FP" 0 "Public/Private NFP"
gen private_fp:private_fp = (control==3 & year>=1986)
replace private_fp = . if mi(control)
replace private_fp = . if year<=1985
label var private_fp "Private For-Profit Institution"

label def private 1 "Private" 0 "Public", replace
gen private:private = (private_nfp==1 | private_fp==1 | (control==2 & year<=1985))
replace private = . if mi(private_nfp) & mi(private_fp) & (mi(control) & year<=1985 | year>=1986)
label var private "Private Institution"

* Create groups based on public/private
*egen owner = group(public private_nfp private_fp), lname(owner)
label def owner 1 "Public" 2 "Private NFP" 3 "Private FP"
gen owner:owner = 1 if public==1
replace owner = 2 if private_nfp==1
replace owner = 3 if private_fp==1

* Four-Year/Community College/Below Associates
label def university 1 "Four-Year University" 0 "Less than Four Years"
gen university:university = (iclevel==1)
replace university = . if mi(iclevel)
label var university "Four-Year University"

label def community_college 1 "Community College" 0 "University/Below Associates"
gen community_college:community_college = (iclevel==2)
replace community_college = . if mi(iclevel)
label var community_college "Two to Four-Year College"

label def below_associates 1 "Below Associates" 0 "Associates or Higher"
gen below_associates:below_associates = (iclevel==3)
replace below_associates = . if mi(iclevel)
label var below_associates "Less than Two Years (Below Associate)"

* Create groups by university/community college/below associates
*egen level = group(university community_college below_associates), lname(level)
label def level 1 "University" 2 "Community College" 3 "Below Associates"
gen level:level = 1 if university==1
replace level = 2 if community_college==1
replace level = 3 if below_associates==1

* Create groups by type and level
egen owner_level = group(owner level), lname(owner_level)
/*label def owner_level 11 "Public University" 12 "Public Community College" ///
	13 "Public Below Associates" 21 "Private NFP University" ///
	22 "Private NFP Community College" 23 "Private NFP Below Associates" ///
	31 "Private FP University" 32 "Private FP Communty College" ///
	33 "Private FP Below Associates"
gen owner_level:owner_level = 10 * type + level*/




compress
order unitid instnm year owner_level city stabbr fips countynm countycd ///
	obereg locale longitud latitude ein opeid landgrnt hbcu tribal affil ///
	hloffer ugoffer groffer fte enrtot instsize hdegofr1 deggrant medical ///
	cindon cinson cotson cindoff cinsoff cotsoff cindfam cinsfam cotsfam ///
	pctmin1 pctmin2 pctmin3 pctmin4 ptacipef
sort unitid year
xtset unitid year, yearly
label data "IPEDS Directory Information"
save clean_data/directory_information_clean.dta, replace


timer off 1
timer list
log close


if c(hostname)=="sapper" {
	exit, STATA clear
}
