*! version 1.0 Christopher Boyer 01aug2018

program photobook, rclass
    /* This program creates a PDF photobook from a list of images and 
       optionally adds a caption for each image. It assumes that the data in
       memory contains a variable where each observation corresponds with 
       the name of an image file. The caption */

    version 15
    syntax varname using/ [if] [in], ///
        /* document options */  ///
        [PAGEsize(passthru)]    /// set page size (letter, A4, A5, etc)
        [LANDscape]             /// flag for page orientation
        [FONT(passthru)]        /// define font settings
        [MARGIN(passthru)]      /// define page margins
        [BGCOLOR(passthru)]     /// set background color
        [REPLACE]               /// replace the document, if existing
        /* table options */     ///
        [NCOL(integer 4)]       /// number of columns        
        [INDENT(passthru)]      /// set the table indentation
        [BORDer(passthru)]      /// border specifications
        [TITLE(passthru)]       /// add a title to the table
        [NOTE(passthru)]        /// add notes to the table
        /* caption options */   ///
        [CAPtion(varlist)]      /// list of variables to use for the caption
        [SEParator(string)]     /// specify the separator for caption variables
        [HALIGN(passthru)]      /// horizontal alignment
        [VALIGN(passthru)]      /// vertical alignment
        [BOLD]                  /// flag to make text bold
        [ITALIC]                /// flag to make text italic
        [SCRIPT(passthru)]      /// flag to make text super or sub script
        [STRIKEout]             /// flag to strikeout text
        [UNDERLine]             /// flag to underline text
        [ALLCaps]               /// flag to convert text to all caps
        /* image options */     ///
        [Width(integer -999)]   /// width to standarize photos to
        [Height(integer -999)]  /// height to standarize photos to
        [LINEBREAK(passthru)]   //  add # linebreaks after image


    qui { 
    
    marksample touse, strok

    preserve 

    keep if `touse'

    * set default values for certain options that are not required
    if mi("`pagesize'") {
        local pagesize = "pagesize(letter)"
    }
    
    if mi("`border'") {
        local border = "border(all, nil)"
    }

    if mi("`separator") {
        local separator = ","
    }

    local resize = cond(`width' != -999  | `height' != -999, 1, 0) // flag to resize images

    tempvar photo_exists

    g `photo_exists' = 0 // a flag that photo exists

    forval i = 1 / `=_N' {
        local photo = `varlist'[`i']

        cap confirm file "`photo'"
        if _rc {
            nois di "Warning: file `photo' does not exist."
        }
        else {
            replace `photo_exists' = 1 in `i'
        }
    }
    
    count if `photo_exists'
    if `r(N)' == 0 {
        nois di as error "Error: No photos found!"
        error 111
    }

    nois di "Found `r(N)' photos."

    if `r(N)' != `=_N' {
        nois di "Skipping `=_N - `r(N)'' photos which could not be found."
    }

    keep if `photo_exists'

    local N = `=_N'

    * calculate the number of rows and columns
    local nrow = 2 * ceil(`N' / `ncol') 

    * initialize PDF 
    putpdf clear
    putpdf begin, `landscape' `pagesize' `font' `margin' `bgcolor'

    putpdf table photobook = (`nrow', `ncol'), `indent' `border' `title' `note'

    forval i = 1 / `N' {
        local photo = `varlist'[`i'] 

        * calculate row and col
        local row = 2 * floor((`i' - 1) / `ncol') + 1
        local col = cond(mod(`i', `ncol'), mod(`i', `ncol'), `ncol')

        * skip header row if there's a title
        if !mi("`title'") {
            local ++row
        }

        * resize the image if desired using java
        if `resize' {
            mata : st_local("tmp", "./.tmp_`i'" + pathsuffix("`photo'"))

            resize "`photo'" "`tmp'", width(`width') height(`height')

            local resized `"`resized' "`tmp'""'
            local photo "`tmp'"
        }

        * add photos and captions to PDF
        putpdf table photobook(`row', `col') = image("`photo'"), `linebreaks'

        gettoken first rest : caption
        putpdf table photobook(`=`row' + 1', `col') = ("`=`first'[`i']'"), ///
            `halign' `valign' `bold' `italic' `script' `strikeout' `underline' `allcaps'

        foreach var in `rest' {
            putpdf table photobook(`=`row' + 1', `col') = ("`separator' `=`var'[`i']'"), ///
                append `halign' `valign' `bold' `italic' `script' `strikeout' `underline' `allcaps'
        }


    }                 

    putpdf save "`using'", `replace'
    
    * delete the temporary resized photos if applicable
    if `resize' {
        foreach file in `resized' {
            erase "`file'"
        }
    }

    restore
    }
    
    * create clickable link to open file
    if "`c(os)'" == "Windows" {
        nois di as txt `"Photobook saved to {stata winexec cmd /c start "" "`using'":`using'}."'
    }
    else {
        nois di as txt `"Photobook saved to {stata shell open "`using'":`using'}."'
    }
    
end

program resize
    version 15
    syntax anything, Width(integer) Height(integer)

    gettoken oldfile anything : anything
    gettoken newfile anything : anything

    javacall org.poverty_action.cboyer.StataThumbnailator resize, ///
        args("`oldfile'" "`newfile'" "`width'" "`height'") ///
        jars(stata_thumbnailator.jar;thumbnailator-0.4.8.jar)
end

