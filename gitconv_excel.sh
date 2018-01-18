#!/bin/bash
## inspired by http://programmaticallyspeaking.com/git-diffing-excel-files.html
## will convert a binary Excel XLSX format to text in a way that can be compared to a different version aka 'diff'ed
# unzip -l "$1" xl/worksheets/*
# to be used as this:
## [diff "excel"]
## textconv = "O:/R_D/Public/tools/gitconv_excel.sh"

derive_temp_file(){
	# path="$1"
	bname=$(basename "$1" .xlsx | cut -c1-16)
	unique=$(echo "$1" | sha1sum | cut -c1-16)
	echo "$TMP/$bname.$unique.tmp"
}

derive_temp_dir(){
	# path="$1"
	bname=$(basename "$1" .xlsx | cut -c1-16)
	unique=$(echo "$1" | sha1sum | cut -c1-16)
	echo "$TMP/$bname.$unique"
}

tunzip=$(derive_temp_dir "$1")
if [ ! -d "$tunzip" ] ; then
	mkdir "$tunzip"
fi
unzip -u -d "$tunzip" -j "$1" >> /dev/null
for sheet in $tunzip/*.xml ; do
	bsheet=$(basename $sheet .xml)
	echo "SHEET [$bsheet]"
	/o/R_D/Public/tools/XmlSoft/bin/xmllint.exe --format $sheet
done