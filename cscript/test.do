/*----------------------------------------*
 |file:    test.do                        | 
 |project: photobook                      |
 |author:  christopher boyer              |
 |         innovations for poverty action |
 |date:    2018-08-01                     |
 *----------------------------------------*/

net install photobook, ///
	from("/Users/christopherboyer/Dropbox/Github/photobook") ///
	replace 

clear
clear matrix
clear mata
set more off
pause off

use "lfw_reduced.dta", clear



*** BASIC TESTS ***

* -------------------------------------------------------------------------- */
* Test 01

* create a simple photobook with no captions
photobook file using "01/test01.pdf", replace

* -------------------------------------------------------------------------- */
* Test 02

* add simple caption
photobook file using "02/test02.pdf", cap(name) replace

* -------------------------------------------------------------------------- */
* Test 03

* use multiple caption variables
photobook file using "03/test03.pdf", cap(id name) replace

* -------------------------------------------------------------------------- */
* Test 04

* change separator
photobook file using "04/test04.pdf", cap(id name) sep(",") replace



*** DOCUMENT PROPERTIES ***

* -------------------------------------------------------------------------- */
* Test 05

* flip orientation
photobook file using "05/test05.pdf", cap(id name) sep(",") landscape replace 

* -------------------------------------------------------------------------- */
* Test 06

* change page size
photobook file using "06/test06.pdf", cap(id name) sep(",") landscape ///
	pagesize(legal) replace

* -------------------------------------------------------------------------- */
* Test 07

* change page margins
cap photobook file using "07/test07.pdf", cap(id name) sep(",") landscape ///
	pagesize(legal) margin(top 0.5) replace

* -------------------------------------------------------------------------- */
* Test 08

* change font
photobook file using "08/test08.pdf", cap(id name) sep(",") landscape ///
	pagesize(legal) font("Courier", 20) replace

* -------------------------------------------------------------------------- */
* Test 09

* change background color
photobook file using "09/test09.pdf", cap(id name) sep(",") landscape ///
	bgcolor("gray") replace



*** TABLE PROPERTIES ***

* -------------------------------------------------------------------------- */
* Test 10

* change number of columns per sheet
photobook file using "10/test10.pdf", cap(id name) sep(",") ncol(5) replace 

* -------------------------------------------------------------------------- */
* Test 11

* add indentation
photobook file using "11/test11.pdf", cap(id name) sep(",") ncol(5) ///
	indent(2 in) replace 

* -------------------------------------------------------------------------- */
* Test 12

* add title
photobook file using "12/test12.pdf", cap(id name) sep(",") ncol(5) ///
	title("Photobook for my project") replace 

* -------------------------------------------------------------------------- */
* Test 13

* add notes
photobook file using "13/test13.pdf", cap(id name) sep(",") ncol(5) ///
	title("Photobook for my project") note("This is a note") replace 



*** CAPTION PROPERTIES ***

* -------------------------------------------------------------------------- */
* Test 14

* set horizontal and vertical alignment
photobook file using "14/test14.pdf", cap(id name) sep(",")  ///
	halign(center) valign(center) replace 

* -------------------------------------------------------------------------- */
* Test 15

* add text formatting
photobook file using "15/test15.pdf", cap(id name) sep(",")  ///
	halign(center) valign(center) bold italic underline allcaps replace 

/*

*** IMAGE PROPERTIES ***

* -------------------------------------------------------------------------- */
* Test 16

* adjust image size
photobook file using "16/test16.pdf", cap(id name) sep(",")  ///
	width(100) height(200) replace 

* -------------------------------------------------------------------------- */
* Test 17

* adjust only width
photobook file using "17/test17.pdf", cap(id name) sep(",")  ///
	width(200) replace 

* -------------------------------------------------------------------------- */
* Test 18

* adjust only height
photobook file using "18/test18.pdf", cap(id name) sep(",")  ///
	height(200) replace 


