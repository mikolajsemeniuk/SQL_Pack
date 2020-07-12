excel_file_to_convert = Wscript.Arguments.Item(0)
colums_to_delete = Wscript.Arguments.Item(1)

Set objexcel = CreateObject("Excel.Application")
Set wy = objexcel.Workbooks.Open(excel_file_to_convert)    
objexcel.Visible = True
wy.Worksheets("Sheet1").Range(colums_to_delete).EntireColumn.Delete ' "H:P"
wy.Save
wy.Close