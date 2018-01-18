# gitdiff_for_excel
Tools to create a "git diff" for XLSX files

## Scope

	(work in progress)

* will try to give human-interpretable changes between version of an .XLSX file
* will do the comparison completely in bash / with bash tools (grep/sed/...)
* this should work for Linux, MacOS and Windows (via [http://gitforwindows.org/](http://gitforwindows.org/) )

## Background

* git allows for custom git diff tools

### git diff textconv

* `textconv` will convert 1 file to a text representation
* so git diff will do this for both files (old and new version) and then do a simple `diff` to compare both


### git diff command

* `command` will take both filenames and then use custom methods of comparison
* usable when a simple diff of two text files is not clear enough

## Setup

1.	define git diff method

add this to `~/.gitconfig` file

	[diff "excel1"]
	textconv = "(path to gitdiff_excel)/gitconv_excel.sh"

	[diff "excel2"]
	command = "(path to gitdiff_excel)/gitdiff_excel.sh"


2.	attach this method to .xlsx files

add this to `<GITREPO>/.gitattributes` file

	*.xlsx diff=excel2
