############ edit .bashrc ############

# add alias
alias=(\
"alias cdws='cd /root/autodl-tmp'" \
)

for ((i=0; i<${#alias[@]}; i++)); do
    sed -i "2i\\${alias[i]}" ~/.bashrc
done

# config shell editing mode to vi style
# -i: edit file in place, 
# 2i: 2 specifies the lien number, i:stand for insert mode, 
# -o: option
sed -i "2i\\set -o vi" ~/.bashrc



############ edit .vimrc ############

# config vim
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc # 创建文件
fi
sed -i "1i\\:set nu" ~/.vimrc # -i: 表示直接修改文件而不是输出到终端 1i: 表示在第1行进行插入操作  \\进行转义


############ install independence ############

# add common packages
apt update
apt install -y lrzsz
