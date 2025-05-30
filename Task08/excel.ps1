$user = $env:USERNAME
$comp = $env:COMPUTERNAME

$filename = "${user}_${comp}.xlsx"
$filepath = Join-Path -Path $PWD -ChildPath $filename

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false

$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Worksheets.Item(1)

$cell = $worksheet.Cells.Item(2, 2)
$cell.Value2 = "Привет от PowerShell"
$cell.Font.Size = 12
$cell.Font.Italic = $true

$workbook.SaveAs($filepath)

$workbook.Close($false)
$excel.Quit()
