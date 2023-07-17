# Use VI edit mode with PSReadLine
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
Set-PSReadLineOption -EditMode Vi
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}

# Use scoop-search to improve search speed: https://github.com/shilangyu/scoop-search
Invoke-Expression (&scoop-search --hook)

# Alias for kubernetes
New-Alias -Name k -Value kubectl