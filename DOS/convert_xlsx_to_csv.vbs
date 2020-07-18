
excel_file_to_convert = Wscript.Arguments.Item(0)
csv_file_converted = Wscript.Arguments.Item(1)

Dim oExcel 
Set oExcel = CreateObject("Excel.Application") 
oExcel.DisplayAlerts = FALSE
Dim oBook, local
Set oBook = oExcel.Workbooks.Open(excel_file_to_convert)
local = true 
call oBook.SaveAs(csv_file_converted, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, local)
oBook.Close False 
oExcel.Quit  

Set fso = CreateObject("Scripting.FileSystemObject")
Set txt = fso.OpenTextFile(csv_file_converted)

formated = ""

Do Until txt.AtEndOfStream
  line = txt.ReadLine
  line = Replace(line, ";", Chr(34) & ";" & Chr(34))
  line = Chr(34) & line & Chr(34) & ";"
  formated = formated & line & vbNewLine
Loop

Set objFile = fso.CreateTextFile(csv_file_converted, True)
objFile.Write formated
objFile.Close
