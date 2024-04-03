# add alias
alias=(\
"alias cdws='cd /root/autodl-tmp'" \
)

for ((i=0; i<${#alias[@]}; i++)); do
    sed -i "2i\\${alias[i]}" ~/.bashrc
done

# add common packages
apt update
apt install -y lrzsz
