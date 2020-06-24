
$ProjectName = 'Test'

$ProjectNameExt = '.csproj'

dotnet new sln --name $ProjectName

dotnet new mvc --name $ProjectName'.Web'

dotnet new api --name $ProjectName'.Api'

dotnet sln add $ProjectName'.Web/'$ProjectName'.Web'$ProjectNameExt $ProjectName'.Api/'$ProjectName'.Api'$ProjectNameExt

dotnet new gitignore

#change ports in launch settings file

#$ProjectName = 'Test'
$currentFilePath = Get-Location
$currentWebUrl = 'https://localhost:5001;http://localhost:5000'
$newWebUrl = 'https://localhost:3001;http://localhost:3000'

$currentApiUrl = 'https://localhost:5001;http://localhost:5000'
$newApiUrl = 'https://localhost:4001;http://localhost:4000'

#change api ports
(Get-Content -path $currentFilePath'\'$ProjectName'.Api\Properties\launchSettings.json' -Raw) -replace $currentApiUrl,$newApiUrl | Set-Content -Path $currentFilePath'\'$ProjectName'.Api\Properties\launchSettings.json'


#change web ports
(Get-Content -path $currentFilePath'\'$ProjectName'.Web\Properties\launchSettings.json' -Raw) -replace $currentWebUrl,$newWebUrl | Set-Content -Path $currentFilePath'\'$ProjectName'.Web\Properties\launchSettings.json'

# Run in different terminals
cd $ProjectName'.Api/'

start-process dotnet run 

cd ..

cd $ProjectName'.Web/'

start-process dotnet run 

