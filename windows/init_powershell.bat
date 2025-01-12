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

function do_gproxy {
    param( [string]$state ) 
    if ($state -eq "--off") {
        git config --global --unset http.proxy
        git config --global --unset https.proxy
        echo "proxy off"
    }
    elseif ($state -eq "--on")  {
        git config --global http.proxy 127.0.0.1:7890
        git config --global https.proxy 127.0.0.1:7890
        echo "proxy on"
    }else{
    echo "To enable gproxy, the '--on' flag is required. The '--off' flag is used for disabling it."
  }
}
Set-Alias gproxy do_gproxy

function do_dmirror{
    param([string]$pattern)
    if ($pattern -eq "--pip") {
        echo "-i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
    }
    elseif ($pattern -eq "--mvn")  {
        echo "<mirror> 
  <id>alimaven2</id> 
  <mirrorOf>central</mirrorOf> 
  <name>aliyun maven</name> 
  <url>http://maven.aliyun.com/nexus/content/repositories/central/</url> 
</mirror>"
    }elseif ($pattern -eq "--npm")  {
        echo "--registry=https://registry.npmmirror.com"
    }
  elseif ($pattern -eq "--help")  {
        echo "to list the pip mirrors the '--pip' flag is required, the flag '--mvn' is used for listing mvn mirrors, and the flag '--npm' flag is for listing npm mirrors"
    }
    else{
    echo "pip mirror:"
        echo "-i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
    echo ""
        echo "mvn mirror:"
        echo "<mirror> 
  <id>alimaven2</id> 
  <mirrorOf>central</mirrorOf> 
  <name>aliyun maven</name> 
  <url>http://maven.aliyun.com/nexus/content/repositories/central/</url> 
</mirror>"
    echo ""
        echo "npm mirror:"
        echo "--registry=https://registry.npmmirror.com"
  }
}
Set-Alias dmirror do_dmirror


function do_lscpu(){
	Get-CimInstance Win32_Processor | Format-List *
}
Set-Alias lscpu do_lscpu
" >> $profile