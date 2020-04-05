#RESOURCE VERSIONINFO

#IF %DEF(%BETAVERSION)
    #RESOURCE FILEFLAGS %VS_FF_PRERELEASE
#ELSE
    #RESOURCE FILEFLAGS 0
#ENDIF

#RESOURCE FILEVERSION 1, 0, 1, 0
#RESOURCE PRODUCTVERSION 1, 0, 1, 0

#RESOURCE STRINGINFO "0409", "04B0"

#RESOURCE VERSION$ "CompanyName",      "Erich Kohl"
#RESOURCE VERSION$ "FileDescription",  "Fern Fractal Graphics Demo"
#RESOURCE VERSION$ "FileVersion",      "01.01.0000"
#RESOURCE VERSION$ "InternalName",     "FERN"
#RESOURCE VERSION$ "OriginalFilename", "FERN.EXE"
#RESOURCE VERSION$ "LegalCopyright",   "Copyleft 2020 by Erich Kohl"
#RESOURCE VERSION$ "ProductName",      "Fern Fractal Graphics Demo"
#RESOURCE VERSION$ "ProductVersion",   "01.01.0000"
#RESOURCE VERSION$ "Comments",         "Enjoy this little demo."
