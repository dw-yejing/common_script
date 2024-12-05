"

function do_touch {
    param([string]$Path)
    New-Item -ItemType File -Path $Path
}
Set-Alias touch do_touch

Set-Alias vim notepad

function do_tail {
    param([int]$N, [string]$Path)
    Get-Content -Tail $N $Path
}
Set-Alias tail do_tail

function do_head {
    param([int]$N, [string]$Path)
    Get-Content -Path $Path | Select-Object -First $N
}
Set-Alias head do_head

function do_wc {
    param([string]$Path)
    Get-Content -Path $Path | Measure-Object -line  -word -character
}
Set-Alias wc do_wc

Set-Alias grep Select-String

Set-Alias ifconfig Get-NetIPAddress

function do_proxy{
  Start-Process ms-settings:network-proxy
}
Set-Alias proxy do_proxy
" >> $profile