#' Reformat current file with formatR
#'
#' Call this as an addin to reformat the current file open in Sources.
#'
reformatFileAddin <- function() {
    # Get the document data
    context <- rstudioapi::getActiveDocumentContext()
    docId <- context$id
    docContents <- context$contents

    # Reformat it
    output = paste(capture.output(formatR::tidy_source(text = docContents)), collapse = "\n")
    rstudioapi::setDocumentContents(output, docId)
}
