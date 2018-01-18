# gitdiff_for_excel
Tools to create a "git diff" for XLSX files

(work in progress)

# Setup

1.	define git diff method

add this to `~/.gitconfig` file

	[diff "excel1"]
	textconv = "O:/R_D/Public/tools/gitconv_excel.sh"

	[diff "excel2"]
	command = "O:/R_D/Public/tools/gitdiff_excel.sh"


2.	attach this method to .xlsx files

add this to `<GITREPO>/.gitattributes` file

	*.xlsx diff=excel2
