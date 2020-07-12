# Read csv file 
# open connection to database using bulkcopy
# convert array to data table
# bulkload data into table
# note: column sequence and data types should match

# ============================================
#
#   Cast powershell types to our csv object
#
# ============================================
function Get-Type 
{ 
    param($type) 
 
$types = @( 
'System.Boolean', 
'System.Byte[]', 
'System.Byte', 
'System.Char', 
'System.Datetime', 
'System.Decimal', 
'System.Double', 
'System.Guid', 
'System.Int16', 
'System.Int32', 
'System.Int64', 
'System.Single', 
'System.UInt16', 
'System.UInt32', 
'System.UInt64'
) 
 
    if ( $types -contains $type ) { 
        Write-Output "$type" 
    } 
    else { 
        Write-Output 'System.String' 
         
    } 
}


# ============================================
#
#   Save csv file to PowerShell object
#   to insert to database
#
# ============================================
function Out-DataTable 
{ 
    [CmdletBinding()] 
    param([Parameter(Position=0, Mandatory=$true, ValueFromPipeline = $true)] [PSObject[]]$InputObject) 
 
    Begin 
    { 
        $dt = new-object Data.datatable   
        $First = $true  
    } 
    Process 
    { 
        foreach ($object in $InputObject) 
        {
            $DR = $DT.NewRow()   
            foreach($property in $object.PsObject.get_properties()) 
            {   
                if ($first) 
                {   
                    $Col = new-object Data.DataColumn   
                    $Col.ColumnName = $property.Name.ToString()   
                    if ($property.value) 
                    { 
                        if ($property.value -isnot [System.DBNull]) { 
                            $Col.DataType = [System.Type]::GetType("$(Get-Type $property.TypeNameOfValue)") 
                        }
                    } 
                    $DT.Columns.Add($Col) 
                }   
                if ($property.Gettype().IsArray) { 
                    $DR.Item($property.Name) = $property.value | ConvertTo-XML -AS String -NoTypeInformation -Depth 1 
                } else {
                    if($property.value -eq "") {
                        $DR.Item($property.Name) = $null
                    } else {
                        $DR.Item($property.Name) = $property.value 
                    }
                } 
            }   
            $DT.Rows.Add($DR)   
            $First = $false 
        } 
    }  
      
    End 
    { 
        Write-Output @(,($dt)) 
    } 
 
}

# ============================================
#
#   Catch parameters in variables
#
# ============================================
$file = $args[0] # Path to csv e.g. "C:\Users\ctr_semenium\Downloads\Report_AP - Formated.csv"
$dbserver = $args[1] # Name of server e.g. "development.amazonaws.com"
$database = $args[2] # Name of database e.g. "CatalogDEV"
$table = $args[3] # Name of table e.g. "MyTable"

# ============================================
#
#   Open connection with database
#
# ============================================
$cn = new-object System.Data.SqlClient.SqlConnection("Data Source=$dbserver;Integrated Security=SSPI;Initial Catalog=$database");
$cn.Open()
$bc = new-object ("System.Data.SqlClient.SqlBulkCopy") $cn
$bc.BatchSize = 10000;
$bc.BulkCopyTimeout = 10000;
$bc.DestinationTableName = "[AutomationDEV].[SNCORP\ctr_semenium].[$table]" # full name database + table

# ============================================
#
#   Import csv to database by using
#   Out-DataTable function
#
#   Remove -Delimiter ";" if you would
#   like to upload csv separeted by ","
#   instead of ";"
#
# ============================================
$data = Import-Csv $file -Delimiter ";" | Out-DataTable
$bc.WriteToServer($data)
