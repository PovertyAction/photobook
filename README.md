# photobook
Stata program to create a nicely formatted photobook from a list of image files

Installation
------------
To always ensure you have the most up-to-date version, you can install the `photobook` command directly from GitHub by using either of the two methods mentioned below in the Stata console window. 

```Stata
* method 1 - use Stata's net install command
net install photobook, ///
    from("https://raw.githubusercontent.com/PovertyAction/photobook/master") ///
    replace 
    
* method 2 - use haghish's github command
github install PovertyAction/photobook
```

If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/PovertyAction/photobook/issues). For questions and other discussion, please email us at [researchsupport@poverty-action.org](mailto:researchsupport@poverty-action.org).

Examples
----------
The `photobook` command is designed to work directly on data as exported by SurveyCTO. To run it you simply load your dataset into Stata and run `photobook` on the media variable where photos were collected (e.g. if you programmed an image variable named `respondent_photo` in your survey you would run photobook on this variable in the exported data). See below for example syntax.

```Stata

* simple example with default settings
photobook respondent_photo using "myphotobook.pdf", replace

* add formatting 
photobook respondent_photo using "myphotobook.pdf", ncol(5) bold allcaps landscape replace

```

Certification script
--------------------

The [certification script](http://www.stata.com/help.cgi?cscript) of `photobook` is [`cscript/test.do`](/cscript/test.do). If you are new to certification scripts, you may find [this](http://www.stata-journal.com/sjpdf.html?articlenum=pr0001) Stata Journal article helpful.

Stata help file
---------------

<pre>
 <b><u>Title</u></b>
<p>
    <b>photobook</b> -- Create a nicely formatted photobook from a list of image
        files
<p>
<p>
<a name="syntax"></a><b><u>Syntax</u></b>
<p>
        <b>photobook</b> <i>varname</i><b> using</b> <i>filename</i> [<i>if</i>] [<i>in</i>] [<b>,</b> <i>options</i>]
<p>
    <i>options</i>                       Description
    -------------------------------------------------------------------------
    Document
      <b><u>page</u></b><b>size(</b><i>psize</i><b>)</b>             set page size of document
      <b><u>land</u></b><b>scape</b>                   set document orientation to landscape
      <b>font(</b><i>fspec</i><b>)</b>                 set font, font size, and font color
      <b>margin(</b><i>type</i><b>,</b> <i>#</i>[<i>unit</i>]<b>)</b>       set page margins of document
      <b>bgcolor(</b><i>color</i><b>)</b>              set background color
      <b>replace</b>                     specifies to overwrite <i>filename</i>, if it
                                    exists
<p>
    Table
    * <b>ncol(</b><i>#</i><b>)</b>                     number of columns on a page
      <b><u>bord</u></b><b>er(</b><i>bspec</i><b>)</b>               set pattern and color for border
      <b>title(</b><i>string</i><b>)</b>               add a title to the table
      <b>note(</b><i>string</i><b>)</b>                add notes to the table
<p>
    Caption
    * <b><u>cap</u></b><b>tion(</b><i>varlist</i><b>)</b>            list of variables to use to create caption
      <b><u>sep</u></b><b>arator(</b><i>string</i><b>)</b>           character to use as a separator when
                                    combining caption variables
      <b>halign(</b><i>hvalue</i><b>)</b>              set horizontal alignment
      <b>valign(</b><i>vvalue</i><b>)</b>              set vertical alignment
      <b>bold</b>                        format text as bold
      <b>italic</b>                      format text as italic
      <b>script(sub</b>|<b>super)</b>           set subscript or superscript formatting of
                                    text
      <b><u>strike</u></b><b>out</b>                   strikeout text
      <b><u>underl</u></b><b>ine</b>                   underline text
      <b><u>allc</u></b><b>aps</b>                     format text as all caps
<p>
    Image
      <b><u>w</u></b><b>idth(</b><i>#</i><b>)</b>                    set image width
      <b><u>h</u></b><b>eight(</b><i>#</i><b>)</b>                   set image height
      <b>linebreak</b>[<b>(</b><i>#</i><b>)</b>]              add line breaks after image
<p>
    -------------------------------------------------------------------------
    * Most commonly used options.
    <b>by</b> is allowed; see <b>[D] by</b>.
<p>
<a name="fspec"></a>    <i>fspec</i> is
<p>
        <i>fontname</i> [<b>,</b> <i>size</i> [<b>,</b> <i>color</i>]]
<p>
<a name="fontname"></a>            <i>fontname</i> may be any supported font installed on the user's
            computer.  Base 14 fonts, Type 1 fonts, and TrueType fonts with
            an extension of <b>.ttf</b> and <b>.ttc</b> are supported. TrueType fonts that
            cannot be embedded may not used.  If <i>fontname</i> includes spaces,
            then it must be enclosed in double quotes.  The default font is
            <b>Helvetica</b>.
<p>
<a name="size"></a>            <i>size</i> is a numeric value that represents font size measured in
            points.  The default is <b>11</b>.
<p>
            <i>color</i> sets the text color.
<p>
<a name="bspec"></a>    <i>bspec</i> is
<p>
        <i>bordername</i>[<b>,</b> <i>bpattern</i> [<b>,</b> <i>bcolor</i>]]
<p>
            <i>bordername</i> specifies the location of the border.
<p>
            <i>bpattern</i> is a keyword specifying the look of the border.
            Possible patterns are <b>nil</b> and <b>single</b>.  The default is <b>single</b>.  To
            remove an existing border, specify <b>nil</b> as the <i>bpattern</i>.
<p>
            <i>bcolor</i> specifies the border color.
<p>
<a name="unit"></a>    <i>unit</i> may be <b>in</b> (inch), <b>pt</b> (point), <b>cm</b> (centimeter), or <b>twip</b> (twentieth of
        a point).  An inch is equivalent to 72 points, 2.54 centimeters, or
        1440 twips.  The default is <b>in</b>.
<p>
<a name="color"></a>    <i>color</i> and <i>bcolor</i> may be one of the colors listed in the table of colors
        in the <i>Appendix</i>; a valid RGB value in the form <i>### ### ###</i>, for
        example, <b>171 248 103</b>; or a valid RRGGBB hex value in the form <i>######</i>,
        for example, <b>ABF867</b>.
<p>
<p>
<a name="description"></a><b><u>Description</u></b>
<p>
    <b>photobook</b> creates a nicely formatted photobook from a list of image files
    stored in <i>varname</i> and saves them as a PDF.
<p>
    With the revolution in mobile device technology and the growth of digital
    data collection software, it is increasingly easy for research projects
    to collect digital images. At IPA we often collect photos of respondents
    in order to facilitate tracking and to confirming their identity during
    subsuquent survey waves or during the administration of different
    interventions.  However, we've found that processing large batches of
    image files into something usable by the field team is an arduous and
    time-consuming task.
<p>
    <b>photobook</b> attempts to fill this need by making it easy to quickly create
    nicely-formatted PDFs of images arrayed in a tidy table with captions
    while also providing a suite of options to fully for power users to
    customize the look and feel. At IPA, we often use<b> photobook</b> to create
    tracking books with photos of participants as well as some of their basic
    demographic information. Enumerators use these during follow ups to help
    them find and verify respondents. However, the use of<b> photobook</b> is not
    necessarily restricted to this particular application. In theory it could
    be used in any application that involves merging a list of image files
    into a single PDF, e.g. creating inventories books from photo databases
    of store products.
<p>
<a name="options"></a><b><u>Options</u></b>
<p>
        +----------+
    ----+ Document +---------------------------------------------------------
<p>
<a name="doc_psize"></a>    <b>pagesize(</b><i>psize</i><b>)</b> sets the page size of the document. <i>psize</i> may be <b>letter</b>,
        <b>legal</b>, <b>A3</b>, <b>A4</b>, <b>A5</b>, <b>B4</b>, or <b>B5</b>. The default is <b>pagesize(letter)</b>.
<p>
    <b>landscape</b> changes the document orientation from portrait to landscape.
<p>
    <b>font(</b><i>fontname</i>[<b>,</b> <i>size</i>[<b>,</b> <i>color</i>]]<b>)</b> sets the font, font size, and font color
        for the document.  Note that the font size and font color may be
        specified individually without specifying <i>fontname</i>.  Use <b>font("",</b>
        <i>size</i><b>)</b> to specify font size only.  Use <b>font("", "",</b> <i>color</i><b>)</b> to specify
        font color only.  For both cases, the default font will be used.
<p>
<a name="doc_marg_type"></a>    <b>margin(</b><i>type</i><b>,</b> <i>#</i>[<i>unit</i>]<b>)</b> sets the page margins of the document.  <i>type</i> may be
        <b>top</b>, <b>left</b>, <b>bottom</b>, or <b>right</b>, which identify the location of the
        margin inside the document.  The margin value <i>#</i> is measured in inches
        unless another <i>unit</i> is specified.  This option may be specified
        multiple times in a single command to account for different margin
        settings.
<p>
    <b>bgcolor(</b><i>color</i><b>)</b> sets the background color for the document.
<p>
    <b>replace</b> specifies to overwrite <i>filename</i>, if it exists, by the contents of
        the document in memory.
<p>
        +-------+
    ----+ Table +------------------------------------------------------------
<p>
    <b>ncol(</b><i>#</i><b>)</b> sets the number of columns of images per page in the output
        photobook. By default this is set to 4 columns. Note that<b> photobook</b>
        attempts to resize all images appropriately but it is not always
        perfect. In these circumstances you may have to play with the<b> width()</b>
        and<b> height()</b> settings, the page size and margins, an the font sizes
        to get it right.
<p>
    <b>border(</b><i>bordername</i> [<b>,</b> <i>bpattern</i> [<b>,</b> <i>bcolor</i>]]<b>)</b> adds a single border in the
        location specified by <i>bordername</i>, which may be <b>start</b>, <b>end</b>, <b>top</b>,
        <b>bottom</b>, <b>insideH</b> (inside horizontal borders), <b>insideV</b> (inside vertical
        borders), or <b>all</b>. Optionally, you may change the pattern and color
        for the border by specifying <i>bpattern</i> and <i>bcolor</i>.
<p>
        This option may be specified multiple times in a single command to
        accommodate different border settings. If multiple <b>border()</b> options
        are specified, they are applied in the order specified from left to
        right.
<p>
    <b>title(</b><i>string</i><b>)</b> inserts a row without borders above the current table.  The
        added row spans all the columns of the table and contains <i>string</i> as
        text.  The added row shifts all other table contents down by one row.
        You should account for this when referencing table cells in
        subsequent commands.
<p>
    <b>note(</b><i>string</i><b>)</b> inserts a row without borders to the bottom of the table.
        The added row spans all the columns of the table.  This option may be
        specified multiple times in a single command to add notes on new
        lines within the same cell.  Note text is inserted in the order it
        was specified from left to right.
<p>
        +---------+
    ----+ Caption +----------------------------------------------------------
<p>
    <b><u>cap</u></b><b>tion(</b><i>varlist</i><b>)</b> specifies a list of variables whose contents are used to
        create a caption for each image. If no variables are specified no
        caption will be displayed.
<p>
    <b><u>sep</u></b><b>arator(</b><i>string</i><b>)</b> sets the character to be used to separate values of 
        <i>varlist</i> when creating a caption using the<b> caption(varlist)</b> option.
        By default values will be separated by ",".
<p>
<a name="cell_hvalue"></a>    <b>halign(</b><i>hvalue</i><b>)</b> sets the horizontal alignment of the cells in row <i>i</i> or
        column <i>j</i>.  <i>hvalue</i> may be <b>left</b>, <b>right</b>, or <b>center</b>.  The default is
        <b>halign(left)</b>.
<p>
<a name="cell_vvalue"></a>    <b>valign(</b><i>vvalue</i><b>)</b> sets the vertical alignment of the cells in row <i>i</i> or
        column <i>j</i>.  <i>vvalue</i> may be <b>top</b>, <b>bottom</b>, or <b>center</b>.  The default is
        <b>valign(top)</b>.
<p>
    <b>bold</b> specifies that the new text in the active paragraph be formatted as
        bold.
<p>
    <b>italic</b> specifies that the new text in the active paragraph be formatted
        as italic.
<p>
    <b>script(sub</b>|<b>super)</b> changes the script style of the new text.  <b>script(sub)</b>
        makes the text a subscript.  <b>script(super)</b> makes the text a
        superscript.
<p>
    <b>strikeout</b> specifies that the new text in the active paragraph have a
        strikeout mark.
<p>
    <b>underline</b> specifies that the new text in the active paragraph be
        underlined.
<p>
    <b>bgcolor(</b><i>color</i><b>)</b> sets the background color for the active paragraph.
<p>
        Specifying <b>bgcolor()</b> with <b>photobook</b> <b>text</b> overrides background color
        specifications from <b>photobook begin</b> and <b>photobook paragraph</b>.
<p>
    <b>linebreak</b>[<b>(</b><i>#</i><b>)</b>] specifies that one or <i>#</i> line breaks be added after the new
        text.
<p>
    <b>allcaps</b> specifies that all letters of the new text in the active
        paragraph be capitalized.
<p>
        +-------+
    ----+ Image +------------------------------------------------------------
<p>
    <b>width(</b><i>#</i><b>)</b> sets the width of the image in pixels.  If the width is larger
        than the body width of the document, then the body width is used.  If
        <b>width()</b> is not specified, then the default size is used; the default
        is determined by the image information and the body width of the
        document.
<p>
    <b>height(</b><i>#</i><b>)</b> sets the height of the image in pixels.  If <b>height()</b> is not
        specified, then the height of the image is determined by the width
        and the aspect ratio of the image.
<p>
    <b>linebreak</b>[<b>(</b><i>#</i><b>)</b>] specifies that one or <i>#</i> line breaks be added after the new
        image.
<p>
<p>
<a name="examples"></a><b><u>Examples</u></b>
<p>
    Create a simple photobook (without captions)
        <b>. use lfw_reduced</b>
        <b>. photobook file using "01/test01.pdf", replace</b>
<p>
    Same as the previous, but adds a caption using <b>caption</b> option
        <b>. photobook file using "03/test03.pdf", cap(id name) replace</b>
<p>
<p>
<a name="authors"></a><b><u>Authors</u></b>
<p>
    Christopher Boyer, Innovations for Poverty Action
<p>
    For questions or suggestions, submit a GitHub issue or e-mail
    researchsupport@poverty-action.org.
<p>
<p>
<b><u>Also see</u></b>
<p>
    Help:  <b>[D] putpdf</b>
<p>
</pre>
