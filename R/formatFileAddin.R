#' Reformat current file with formatR
#'
#' Call this as an addin to reformat the current file open in Sources.
#'
reformatFileAddin <- function() {
    # Get the document data
    context <- rstudioapi::getSourceEditorContext()
    docId <- context$id

    # If there's a selection, format that
    selection <- rstudioapi::primary_selection(context)
    selectionText <- selection$text
    if (nchar(selectionText) > 0) {
        output <- paste(capture.output(formatR::tidy_source(text = selectionText)), collapse = "\n")
        rstudioapi::modifyRange(location = selection$range, text = output, id = docId)
    } else {
        # If not, try to format the whole file. Check if it's a R file
        docPath <- context$path
        sp <- strsplit(x = docPath, split = ".", fixed = TRUE)
        t <- sp[[1]]
        ext <- t[length(t)]
        if (length(ext) && tolower(ext) == "r") {
            docContents <- context$contents
            # Reformat it
            output <- paste(capture.output(formatR::tidy_source(text = docContents)), collapse = "\n")
            rstudioapi::setDocumentContents(output, docId)
        } else {
            rstudioapi::showDialog("formatFileAddin error", "Only R files are supported. Please focus on an editor with a R file open.", "")
        }
    }
}
