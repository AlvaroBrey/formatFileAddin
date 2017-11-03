# formatFileAddin

This is an addin for RStudio that allows formatting the currently selected R file with only a keyboard shortcut.
No need to do `Ctrl+A, Ctrl+Shift+A` anymore!

Also, this uses [formatR](https://github.com/yihui/formatR) which is a superior formatter to the RStudio built-in.

## Installation

First install formatR and devtools:

```R
> install.packages(c("devtools", "formatR"))
```

And then install this package:

```R
> devtools::install_github("ontherunvaro/formatFileAddin")
```

## Usage

You can:

 * Bind it to a keyboard shortcut (`Tools > Addins > Keyboard Shortcuts`), or
 * Use it directly from the `Addins` dropdown toolbar

In any case the focus needs to be in the sources editor, and a R file has to be the selected tab. Otherwise you'll get an error message.
