#!/bin/bash
## inspired by http://programmaticallyspeaking.com/git-diffing-excel-files.html
## to be used as this:
## [diff "excel"]
## command = "(path)/gitdiff_excel.sh"
## GIT_EXTERNAL_DIFF is called with 7 parameters:
## path old-file old-hex old-mode new-file new-hex new-mode
## old xlsx = "$2"
## new xlsx = "$5"

analyze_workbook(){
	unzip -p "$1" "xl/workbook.xml" \
	| sed "s/></>\n</g" \
	| egrep -v "uidLastSave|windowHeight" 
}

analyze_content(){
	unzip -p "$1" \
	| sed "s/></>\n</g" \
	| sed "s#<[^>]*>##g" \
	| grep -Ev "^$"
}


echo "## -------- gitdiff_excel --------------"

echo "## -------- SHEETS"
diff <(analyze_workbook "$2") <(analyze_workbook "$5")

echo "## -------- CONTENT"
diff <(analyze_content "$2") <(analyze_content "$5")

echo "## -------------------------------------"

exit 0