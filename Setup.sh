# Get the current directory
$directoryPath = Get-Location

# Get all .fdm_material files in the current directory
$files = Get-ChildItem -Path $directoryPath -Filter *.fdm_material

# Filter out files that do not start with "generic_"
$filesToRemove = $files | Where-Object { $_.Name -notmatch '^generic_' }

# Remove the filtered files
$filesToRemove | Remove-Item -Force

Write-Output "Removed $($filesToRemove.Count) .fdm_material files that do not start with 'generic_'"

conan create . fdm_materials/5.7.4@go3d/stable --build=missing --update
conan editable add . fdm_materials/5.7.4@go3d/stable