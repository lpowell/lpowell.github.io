MsgBox " Auto Sort  Copyright (C) 2018  Liam Powell" & vbCrlf & "This program comes with ABSOLUTELY NO WARRANTY." &vbCrlf& "This is free software, and you are welcome to redistribute it under certain conditions."
ShowFolderList("D:\Anime\Series\Genres - WiP\00-All") 	'Identify parent folder
Sub ShowFolderList(folderspec)							'Start ShowFolderList Sub
Dim fs, f, f1, fc, SubFolderLocation(), x				'Variable setup with SubFolderLocation Array
Set fs = CreateObject("Scripting.FileSystemObject")		'Create FSO
Set f = fs.GetFolder(folderspec)						'Get the folder in variable folderspec
Set fc = f.SubFolders									'Find subfolders in folderspec
    x = 0												'Initialize iteration
For Each f1 in fc										'For every name in subfolder
	x = x + 1											'Iterate iteration
	ReDim SubFolderLocation(x)							'Redefine Array with proper number
	SubFolderLocation(x) = SubFolderLocation(x) & "D:\Anime\Series\Genres - WiP\00-All\" & f1.name	'Addend the name of the folder to the file path
		GetGenre(SubFolderLocation(x))					'Call Sub GetGenre
	Next												'Move to next object(Next Sub)
End Sub													'End Sub
'Works Perfectly ^ 1/11/2018 @ 3:08 AM

Sub GetGenre(FolderPath)								'Start GetGenre Sub
MsgBox FolderPath
Dim FilePath, fso										'Variable Setup
Set fso = CreateObject("Scripting.FileSystemObject")	'Initialize fso
FilePath = FolderPath & "/Genre.txt"					'Set FilePath equal to FolderPath + /Genre in order to locate the genre text identifier
MsgBox FilePath
Set dict = CreateObject("Scripting.Dictionary")			'Create Scripting Dictionary
Set file = fso.OpenTextFile (FilePath, 1)				'Open E:\Anime\Series\Genres - WiP\00-All\ + Sub Folder Name\Genre.txt
row = 0													'Initialize row variable
Do Until file.AtEndOfStream								'Start Reading loop
	line = file.ReadLine								'Read first line of file - Identifies the first genre
	dict.Add row, line									'Add the line to variable dict
	row = row + 1										'Iterate row
Loop													'Loop
file.Close												'Close Open Text File
For Each line in dict.Items								'Read every line in dict
	Call CreateShortcut(line, FolderPath)				'Call CreateShortcut Sub
Next													'Open Next Genre text
End Sub													'End Sub

Sub CreateShortcut(Genre, FolderPath)					'Start CreateShortcut Sub
Dim FileName, UploadStac								'Setup Variables
UploadStac = "Stac Upload"								'IDK what this is for, but it needs to be here
FileName = Replace(FolderPath,"D:\Anime\Series\Genres - WiP\00-All\","")	'Example, E:\Anime\Series\Genres - WiP\00-All\Gurren Lagann -> Gurren Lagann
set shortcut = CreateObject("Wscript.Shell").CreateShortcut(CreateObject("Wscript.Shell").SpecialFolders(Genre) & + "D:\Anime\Series\Genres - WiP\" + Genre + "\" + FileName + ".lnk")	'Create the shortcut in folder *Genre* with name FileName.lnk
MsgBox Genre
MSgBox shortcut
shortcut.Description = FileName							'Description for lnk
shortcut.TargetPath = "D:\Anime\Series\" & Genre		'Location for shortcut
shortcut.Arguments = "/Arguments:Shortcut"				'Arguments for lnk
shortcut.Save											'Finish shortcut setup
End Sub													'End Sub
