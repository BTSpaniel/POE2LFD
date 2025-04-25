@echo off

:: Configuration - Set to TRUE to automatically open the filter directory when done
set "OPEN_FILTER_DIR=TRUE"

title Path of Exile 2 Filter Downloader
color 0A
cls

echo Path of Exile 2 Filter Downloader
echo ===============================
echo.
echo Launching filter downloader...
echo.

:: Create a temporary PowerShell script
set "TEMP_PS1=%TEMP%\poe2filters.ps1"

:: Write the PowerShell script content to a temporary file
echo # Path of Exile 2 Filter Downloader > "%TEMP_PS1%"
echo $host.UI.RawUI.WindowTitle = "Path of Exile 2 Filter Downloader" >> "%TEMP_PS1%"
echo $host.UI.RawUI.BackgroundColor = "Black" >> "%TEMP_PS1%"
echo $host.UI.RawUI.ForegroundColor = "Green" >> "%TEMP_PS1%"
echo Clear-Host >> "%TEMP_PS1%"
echo Write-Host "Path of Exile 2 Filter Downloader" -ForegroundColor Cyan >> "%TEMP_PS1%"
echo Write-Host "===============================" -ForegroundColor Cyan >> "%TEMP_PS1%"
echo Write-Host >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo # Find filter directory >> "%TEMP_PS1%"
echo $filterDir = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\My Games\Path of Exile 2\Filters" >> "%TEMP_PS1%"
echo if (-not (Test-Path -Path $filterDir)) { >> "%TEMP_PS1%"
echo     try { >> "%TEMP_PS1%"
echo         New-Item -Path $filterDir -ItemType Directory -Force -ErrorAction Stop ^| Out-Null >> "%TEMP_PS1%"
echo         Write-Host "Created filter directory: $filterDir" -ForegroundColor Green >> "%TEMP_PS1%"
echo     } catch { >> "%TEMP_PS1%"
echo         Write-Host "Failed to create filter directory: $($_.Exception.Message)" -ForegroundColor Red >> "%TEMP_PS1%"
echo         exit 1 >> "%TEMP_PS1%"
echo     } >> "%TEMP_PS1%"
echo } else { >> "%TEMP_PS1%"
echo     Write-Host "Found filter directory: $filterDir" -ForegroundColor Green >> "%TEMP_PS1%"
echo } >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo # Define filter presets >> "%TEMP_PS1%"
echo $filterPresets = @( >> "%TEMP_PS1%"
echo     @{Name = "SOFT"; Number = "0"}, >> "%TEMP_PS1%"
echo     @{Name = "REGULAR"; Number = "1"}, >> "%TEMP_PS1%"
echo     @{Name = "SEMI-STRICT"; Number = "2"}, >> "%TEMP_PS1%"
echo     @{Name = "STRICT"; Number = "3"}, >> "%TEMP_PS1%"
echo     @{Name = "VERY-STRICT"; Number = "4"}, >> "%TEMP_PS1%"
echo     @{Name = "UBER-STRICT"; Number = "5"}, >> "%TEMP_PS1%"
echo     @{Name = "UBER-PLUS-STRICT"; Number = "6"} >> "%TEMP_PS1%"
echo ) >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo Write-Host "Downloading filter presets from GitHub..." -ForegroundColor Yellow >> "%TEMP_PS1%"
echo Write-Host >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo $headers = @{ 'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' } >> "%TEMP_PS1%"
echo $baseUrl = "https://raw.githubusercontent.com/NeverSinkDev/NeverSink-Filter-for-PoE2/main/" >> "%TEMP_PS1%"
echo $successCount = 0 >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo # Download each preset >> "%TEMP_PS1%"
echo foreach ($preset in $filterPresets) { >> "%TEMP_PS1%"
echo     Write-Host "Downloading $($preset.Name) filter..." -NoNewline >> "%TEMP_PS1%"
echo     $fileName = "NeverSink's filter 2 - $($preset.Number)-$($preset.Name).filter" >> "%TEMP_PS1%"
echo     $encodedFileName = [uri]::EscapeDataString($fileName) >> "%TEMP_PS1%"
echo     $url = "$baseUrl$encodedFileName" >> "%TEMP_PS1%"
echo     $outputFile = Join-Path -Path $filterDir -ChildPath "NeverSink's $($preset.Name) (POE2).filter" >> "%TEMP_PS1%"
echo     try { >> "%TEMP_PS1%"
echo         Invoke-WebRequest -Uri $url -OutFile $outputFile -Headers $headers -ErrorAction Stop >> "%TEMP_PS1%"
echo         Write-Host " Success!" -ForegroundColor Green >> "%TEMP_PS1%"
echo         $successCount++ >> "%TEMP_PS1%"
echo     } catch { >> "%TEMP_PS1%"
echo         Write-Host " Failed!" -ForegroundColor Red >> "%TEMP_PS1%"
echo         Write-Host "  Error: $($_.Exception.Message)" -ForegroundColor Red >> "%TEMP_PS1%"
echo     } >> "%TEMP_PS1%"
echo } >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo Write-Host >> "%TEMP_PS1%"
echo if ($successCount -gt 0) { >> "%TEMP_PS1%"
echo     Write-Host "Successfully downloaded $successCount out of $($filterPresets.Count) filters!" -ForegroundColor Green >> "%TEMP_PS1%"
echo } else { >> "%TEMP_PS1%"
echo     Write-Host "All downloads failed." -ForegroundColor Red >> "%TEMP_PS1%"
echo     Write-Host "Please check your internet connection and try again." -ForegroundColor Yellow >> "%TEMP_PS1%"
echo } >> "%TEMP_PS1%"
echo. >> "%TEMP_PS1%"
echo Write-Host "Filter directory: $filterDir" -ForegroundColor Cyan >> "%TEMP_PS1%"

:: Add code to open filter directory if configured
if /i "%OPEN_FILTER_DIR%"=="TRUE" (
    echo # Open the filter directory >> "%TEMP_PS1%"
    echo Write-Host "Opening filter directory..." -ForegroundColor Yellow >> "%TEMP_PS1%"
    echo Start-Process $filterDir >> "%TEMP_PS1%"
)

echo Write-Host >> "%TEMP_PS1%"
echo Write-Host "Press any key to exit..." -ForegroundColor Cyan >> "%TEMP_PS1%"
echo $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") >> "%TEMP_PS1%"

:: Run the PowerShell script
powershell -ExecutionPolicy Bypass -File "%TEMP_PS1%"

:: Clean up
del "%TEMP_PS1%" >nul 2>&1

exit /b
