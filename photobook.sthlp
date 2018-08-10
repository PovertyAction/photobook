{smcl}
{* *! version 1.2.1  07mar2013}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "photobook##syntax"}{...}
{viewerjumpto "Description" "photobook##description"}{...}
{viewerjumpto "Options" "photobook##options"}{...}
{viewerjumpto "Examples" "photobook##examples"}{...} 
{title:Title}

{phang}
{bf:photobook} {hline 2} Create a nicely formatted photobook from a list of image files


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:photobook}
{varname}
{cmd: using} {it:{help filename}}
{ifin}
[{cmd:,} {it:options}]

{synoptset 28 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Document}
{synopt :{opth page:size(photobook##doc_psize:psize)}}set page size of document{p_end}
{synopt :{opt land:scape}}set document orientation to landscape{p_end}
{synopt :{opth font:(photobook##fspec:fspec)}}set font, font size, and font color{p_end}
{synopt :{cmd:margin(}{it:{help photobook##doc_marg_type:type}}{cmd:,} {it:#}[{it:{help photobook##unit:unit}}]{cmd:)}}set page margins of document{p_end}
{synopt :{opth bgcolor:(photobook##color:color)}}set background color{p_end}
{synopt :{opt replace}}specifies to overwrite {it:filename}, if it exists{p_end}

{syntab: Table}
{p2coldent:* {cmd:ncol(}{it:#}{cmd:)}}number of columns on a page{p_end}
{synopt :{opth bord:er(photobook##bspec:bspec)}}set pattern and color for 
border{p_end}
{synopt :{opth title:(strings:string)}}add a title to the table{p_end}
{synopt :{opth note:(strings:string)}}add notes to the table{p_end}

{syntab: Caption}
{p2coldent:* {opth cap:tion(varlist)}}list of variables to use to create caption{p_end}
{synopt :{opth sep:arator(string)}}character to use as a separator when combining caption variables{p_end}
{synopt :{opth halign:(photobook##cell_hvalue:hvalue)}}set horizontal alignment{p_end}
{synopt :{opth valign:(photobook##cell_vvalue:vvalue)}}set vertical alignment{p_end}
{synopt :{opt bold}}format text as bold{p_end}
{synopt :{opt italic}}format text as italic{p_end}
{synopt :{cmd:script(sub}{c |}{cmd:super)}}set subscript or superscript
formatting of text{p_end}
{synopt :{opt strike:out}}strikeout text{p_end}
{synopt :{opt underl:ine}}underline text{p_end}
{synopt :{opt allc:aps}}format text as all caps{p_end}

{syntab: Image}
{synopt :{cmdab:w:idth(}{it:#}{cmd:)}}set image
width{p_end}
{synopt :{cmdab:h:eight(}{it:#}{cmd:)}}set
image height{p_end}
{synopt :{cmd:linebreak}[{cmd:(}{it:#}{cmd:)}]}add line breaks after image{p_end}

{synoptline}
{p2colreset}{...}
{p 4 6 2}
* Most commonly used options.{p_end}
{p 4 6 2}
{cmd:by} is allowed; see {manhelp by D}.{p_end}

{marker fspec}{...}
{phang}
{it:fspec} is 

{pmore}
{it:fontname} [{cmd:,} {it:size} [{cmd:,} {it:color}]]

{marker fontname}{...}
{pmore2}
{it:fontname} may be any supported font installed on the user's computer.  
Base 14 fonts, Type 1 fonts, and TrueType fonts with an extension of {cmd:.ttf}
and {cmd:.ttc} are supported. TrueType fonts that cannot be 
embedded may not used.  If 
{it:fontname} includes spaces, then it must be enclosed in double quotes.
The default font is {cmd:Helvetica}. 

{marker size}{...}
{pmore2}
{it:size} is a numeric value that represents font size measured in points.
The default is {cmd:11}.

{pmore2}
{it:color} sets the text color.

{marker bspec}{...}
{phang}
{it:bspec} is 

{pmore}
{it:bordername}[{cmd:,} {it:bpattern} [{cmd:,} {it:bcolor}]]

{pmore2}
{it:bordername} specifies the location of the border.

{pmore2}
{it:bpattern} is a keyword specifying the look of the border.
Possible patterns are {cmd:nil} and {cmd:single}.  The default is {cmd:single}.
To remove an existing border, specify {cmd:nil} as the {it:bpattern}.

{pmore2}
{it:bcolor} specifies the border color.

{marker unit}{...}
{phang}
{it:unit} may be {cmd:in} (inch), {cmd:pt} (point), {cmd:cm} (centimeter), or
{cmd:twip} (twentieth of a point).  An inch is equivalent to 72 points, 2.54
centimeters, or 1440 twips.  The default is {cmd:in}.

{marker color}{...}
{phang}
{it:color} and {it:bcolor} may be one of the
colors listed in the table of colors in the 
{help photobook##colors:{it:Appendix}};
a valid RGB value in the form {it:### ### ###}, for example,
{cmd:171 248 103}; or a valid RRGGBB hex value in the form {it:######},
for example, {cmd:ABF867}.


{marker description}{...}
{title:Description}

{pstd}
{cmd:photobook} creates a nicely formatted photobook from a list of image files stored 
in {varname} and saves them as a PDF.

{pstd}
With the revolution in mobile device technology and the growth of digital data collection 
software, it is increasingly easy for research projects to collect digital images. At IPA we
often collect photos of respondents in order to facilitate tracking and to confirming their 
identity during subsuquent survey waves or during the administration of different interventions.
However, we've found that processing large batches of image files into something usable by the 
field team is an arduous and time-consuming task. 

{pstd}
{cmd: photobook} attempts to fill this need by making it easy to quickly create nicely-formatted PDFs
of images arrayed in a tidy table with captions while also providing a suite of options to fully 
for power users to customize the look and feel. At IPA, we often use {cmd: photobook} to create tracking
books with photos of participants as well as some of their basic demographic information. Enumerators 
use these during follow ups to help them find and verify respondents. However, the use of {cmd: photobook} is 
not necessarily restricted to this particular application. In theory it could be used in any application that 
involves merging a list of image files into a single PDF, e.g. creating inventories books from photo databases 
of store products. 

{marker options}{...}
{title:Options}

{dlgtab:Document}

{marker doc_psize}{...}
{phang}
{opt pagesize(psize)} sets the page size of the document. {it:psize} may
be {cmd:letter}, {cmd:legal}, {cmd:A3}, {cmd:A4}, {cmd:A5}, {cmd:B4}, or
{cmd:B5}. The default is {cmd:pagesize(letter)}.

{phang}
{opt landscape} changes the document orientation from portrait to landscape.

{phang}
{cmd:font(}{it:{help photobook##fontname:fontname}}[{cmd:,} {it:{help photobook##size:size}}[{cmd:,} {it:{help photobook##color:color}}]]{cmd:)}
sets the font, font size, and font color for the document.  Note that the font
size and font color may be specified individually without specifying
{it:fontname}.  Use {cmd:font("",} {it:size}{cmd:)} to specify font size only.
Use {cmd:font("", "",} {it:color}{cmd:)} to specify font color only.  For both
cases, the default font will be used.

{marker doc_marg_type}{...}
{phang}
{cmd:margin(}{it:type}{cmd:,} {it:#}[{it:{help photobook##unit:unit}}]{cmd:)}
sets the page margins of the document.  {it:type}
may be {cmd:top}, {cmd:left}, {cmd:bottom}, or {cmd:right}, which identify 
the location of the margin inside the document.  The margin value {it:#} is
measured in inches unless another {it:unit} is specified.  This option may be
specified multiple times in a single command to account for different margin
settings.

{phang}
{opth bgcolor:(photobook##color:color)} sets the background color for the
document.

{phang}
{opt replace} specifies to overwrite {it:filename}, if it exists, by the
contents of the document in memory.

{dlgtab:Table}

{phang}
{cmd:ncol(}{it:#}{cmd:)} sets the number of columns of images per page in 
the output photobook. By default this is set to 4 columns. Note that 
{cmd: photobook} attempts to resize all images appropriately but it is 
not always perfect. In these circumstances you may have to play with the 
{cmd: width()} and {cmd: height()} settings, the page size and margins,
an the font sizes to get it right.

{phang}
{cmd:border(}{it:bordername} [{cmd:,} {it:{help photobook##bspec:bpattern}}
[{cmd:,} {it:{help photobook##color:bcolor}}]]{cmd:)}
adds a single border in the location specified by
{it:bordername}, which may be {cmd:start}, {cmd:end}, {cmd:top}, {cmd:bottom},
{cmd:insideH} (inside horizontal borders),
{cmd:insideV} (inside vertical borders),
or {cmd:all}. Optionally, you may change the pattern and color for the border
by specifying {it:bpattern} and {it:bcolor}.

{pmore}
This option may be specified multiple times in a single command to accommodate
different border settings. If multiple {cmd:border()} options are specified,
they are applied in the order specified from left to right.

{phang}
{opth title:(strings:string)} inserts a row without borders above the current
table.  The added row spans all the columns of the table and contains
{it:string} as text.  The added row shifts all other table contents down by
one row. You should account for this when referencing table cells in
subsequent commands.

{phang}
{opth note:(strings:string)} inserts a row without borders to the bottom of
the table.  The added row spans all the columns of the table.  This option may
be specified multiple times in a single command to add notes on new lines
within the same cell.  Note text is inserted in the order it was specified
from left to right.

{dlgtab:Caption}

{phang}
{opth cap:tion(varlist)} specifies a list of variables whose contents are used
to create a caption for each image. If no variables are specified no caption will
be displayed.    

{phang}
{opth sep:arator(string)} sets the character to be used to separate values of 
{varlist} when creating a caption using the {cmd: caption(varlist)} option. 
By default values will be separated by ",".

{marker cell_hvalue}{...}
{phang}
{opt halign(hvalue)} sets the horizontal alignment of the cells in row {it:i}
or column {it:j}.  {it:hvalue} may be {cmd:left}, {cmd:right}, or
{cmd:center}.  The default is {cmd:halign(left)}.

{marker cell_vvalue}{...}
{phang}
{opt valign(vvalue)} sets the vertical alignment of the cells in row {it:i}
or column {it:j}.  {it:vvalue} may be {cmd:top}, {cmd:bottom}, or
{cmd:center}.  The default is {cmd:valign(top)}.

{phang}
{opt bold} specifies that the new text in the active paragraph be formatted as
bold.

{phang}
{opt italic} specifies that the new text in the active paragraph be formatted
as italic.

{phang}
{cmd:script(sub}{c |}{cmd:super)} changes the script style of the new text.
{cmd:script(sub)} makes the text a subscript.
{cmd:script(super)} makes the text a superscript.

{phang}
{opt strikeout} specifies that the new text in the active paragraph have a
strikeout mark.

{phang}
{opt underline} specifies that the new text in the active paragraph be
underlined.

{phang}
{opth bgcolor:(photobook##color:color)} sets the background color for the
active paragraph.

{pmore}
Specifying {opt bgcolor()} with {cmd:photobook} {cmd:text}
overrides background color specifications from {cmd:photobook begin} and
{cmd:photobook paragraph}.

{phang}
{cmd:linebreak}[{cmd:(}{it:#}{cmd:)}] specifies that one or {it:#} line breaks
be added after the new text.

{phang}
{cmd:allcaps} specifies that all letters of the new text in the active
paragraph be capitalized.

{dlgtab:Image}

{phang}
{cmd:width(}{it:#}{cmd:)} sets the width of
the image in pixels.  If the width is larger than the body width of the document, then
the body width is used.  If {cmd:width()} is not specified, then the default
size is used; the default is determined by the image information and the body
width of the document.

{phang}
{cmd:height(}{it:#}{cmd:)} sets the height of
the image in pixels.  If {cmd:height()} is not specified, then the height of the image
is determined by the width and the aspect ratio of the image.

{phang}
{cmd:linebreak}[{cmd:(}{it:#}{cmd:)}] specifies that one or {it:#} line breaks
be added after the new image.


{marker examples}{...}
{title:Examples}

{pstd}
Create a simple photobook (without captions)
{p_end}{cmd}{...}
{phang2}. use lfw_reduced{p_end}
{phang2}. photobook file using "01/test01.pdf", replace{p_end}
{txt}{...}

{pstd}
Same as the previous, but adds a caption using {cmd:caption} option
{p_end}{cmd}{...}
{phang2}. photobook file using "03/test03.pdf", cap(id name) replace {p_end}
{txt}{...}


{marker authors}{...}
{title:Authors}

{pstd}Christopher Boyer, Innovations for Poverty Action{p_end}

{pstd}For questions or suggestions, submit a
{browse "https://github.com/PovertyAction/photobook/issues":GitHub issue}
or e-mail researchsupport@poverty-action.org.{p_end}


{title:Also see}

{psee}
Help:  {manhelp putpdf D}

