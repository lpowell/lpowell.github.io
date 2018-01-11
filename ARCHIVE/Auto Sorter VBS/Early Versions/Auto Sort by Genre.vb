Dim Genre, FileName, UploadStac, SubFolderLocation()
'First open and acquire the subfolders in the Anime\Series folder
ShowFolderList("E:\Anime\Series")
'This Sub stores the subfolder locations in an array
Set dict = CreateObject("Scripting.Dictionary")
Set file = fso.OpenTextFile (ParentFolder"\GENRE.txt", 1)
row = 0
Do Until file.AtEndOfStream
	line = file.ReadLine
	dict.Add row, line
	row = row + 1
Loop

file.Close

For Each line in dict.Items
	Genre = line
	
'SUB ShowFolderList
Sub ShowFolderList(folderspec)
Dim fs, f, f1, fc, SubFolderLocation, x
Set fs = CreateObject("Scripting.FileSystemObject")
Set f = fs.GetFolder(folderspec)
Set fc = f.SubFolders
set x = 0
For Each f1 in fc
	x = x + 1
	SubFolderLocation(x) = SubFolderLocation(x) & "E:\Anime\Series\" & f1.name
	Next
End Sub
