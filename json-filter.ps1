function Filter-Json-File
{
   param([string] $file_path, [int] $price)

   # Read in the json file - $file_path
   $fileData = Get-Content -Path $file_path | ConvertFrom-Json
   
   #Filter based on price
   $filteredData = $fileData.items | Where-Object -FilterScript {$_.price -GT $price}
   
   #Write output to $outFile
   $outFile = "output.json"
   $filteredData | ConvertTo-Json -depth 100 | Out-File $outFile
   return $outFile
}

$out_file = Filter-Json-File -file_path "input.json" -price 50
Write-Host $out_file


