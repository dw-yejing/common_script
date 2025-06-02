"

function do_touch {
    param([string]$Path)
    New-Item -ItemType File -Path $Path
}
Set-Alias touch do_touch

Set-Alias vim notepad

function do_tail {
    param(
        [Parameter(Mandatory=$false, ValueFromPipeline=$true)]
        [string[]]$InputObject,

        [Parameter(Position=0)]
        [int]$n = 10,

        [switch]$f  # -f 参数表示实时跟踪文件更新
    )

    # 如果启用 -f，则实时监控文件
    if ($f) {
        if ($InputObject) {
            # 从管道或参数读取文件路径
            $file = $InputObject[0]
            Get-Content $file -Wait -Tail $n
        }
        else {
            Write-Error "必须指定文件路径（例如: tail -f -n 20 a.txt）"
        }
    }
    # 普通模式（仅显示最后 N 行）
    else {
        if ($InputObject) {
            $InputObject | Select-Object -Last $n
        }
        else {
            Write-Error "必须提供输入（例如: Get-Content a.txt | tail -n 5）"
        }
    }
}
Set-Alias tail do_tail

function do_head {
    param(
        [Parameter(ValueFromPipeline=$true)]$InputObject,
        [Parameter(Position=0)][int]$n = 10,
        [Parameter(Position=1)][string]$file
    )
    if ($file) { Get-Content $file | Select-Object -First $n }
    else { $InputObject | Select-Object -First $n }
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

Set-Alias profile show_profile
function show_profile(){
    code "C:\Users\Lenovo\Documents\WindowsPowerShell\profile.ps1"
}


Set-Alias uvact do_uvactivate
function do_uvactivate(){
    .venv\Scripts\activate
}

Set-Alias whereis do_whereis
function do_whereis(){
    param([string]$pattern)
    Get-Command -Name *$pattern* | Select-Object Source
}
" >> $profile