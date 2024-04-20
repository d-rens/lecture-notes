#!/bin/sh

name=$(dmenu -p "Input the figure name here")
dir="$HOME/lecture-notes/assets"
tex_dir="~/lecture-notes/assets"
key="$1"


figure_code() {
    echo "Value of \$name: $name"

    line1="\\begin{figure}"
    line2="\\centering"
    line3="\\includegraphics[width=\\linewidth]{assets/$name.png}"
    line4="\\caption{$name}"
    line5="\\end{figure}"

    temp_file=$(mktemp /tmp/type_message.XXXXXX)

    echo "$line1" >> "$temp_file"
    echo "$line2" >> "$temp_file"
    echo "$line3" >> "$temp_file"
    echo "$line4" >> "$temp_file"
    echo "$line5" >> "$temp_file"

    xdotool type "i"
    xdotool type --file "$temp_file"

    rm "$temp_file"
}


open_xournalpp () {
    cd $dir; 
    if [ -f "$name.xopp" ]; then
        cp temp.xopp $name.XXX.xopp;
        xournalpp $name.xopp;
    else 
        cp temp.xopp $name.xopp;
        xournalpp $name.xopp;
    fi
}


convert () {
    cd $dir;
    xournalpp $name.xopp -i $name.png
}

all() {
    figure_code &
    open_xournalpp &
    convert
}

case $key in 
    f ) figure_code ;;
    o ) open_xournalpp ;;
    c ) convert ;;
    a ) all ;;
esac
