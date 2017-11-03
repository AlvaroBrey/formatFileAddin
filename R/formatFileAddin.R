#' Reformat current file with formatR
#'
#' Call this as an addin to reformat the current file open in Sources.
#'
reformatFileAddin <- function() {
    # Get the document data
    context <- rstudioapi::getActiveDocumentContext()
    docId <- context$id
    docContents <- context$contents
    docPath <- context$path

    # Check if it's a R file
    sp <- strsplit(x = docPath, split = ".", fixed = TRUE)
    t = sp[[1]]
    ext = t[length(t)]
    if (length(ext) && tolower(ext) == "r") {
        # Reformat it
        output = paste(capture.output(formatR::tidy_source(text = docContents)), collapse = "\n")
        rstudioapi::setDocumentContents(output, docId)
    } else {
        print("formatFile: Only R files are supported. Please focus on an editor with a R file open.")
    }
}
