#!/bin/sh
#
# main.sh c, calls the name feature via dmenu and then inserts the TeX 
# code for the figure with the given name and filename.
#
# the case function will be removed once it is no longer needed for debugging
#

name=$(dmenu -p "Input the figure name here")
key="$1"

figure_code() {
    echo "Value of \$name: $name"

    line1="\\begin{figure}"
    line2="\\centering"
    line3="\\includegraphics[width=\\linewidth]{$name.png}"
    line4="\\caption{$name}"
    line5="\\end{figure}"

    temp_file=$(mktemp /tmp/type_message.XXXXXX)

    echo "$line1" >> "$temp_file"
    echo "$line2" >> "$temp_file"
    echo "$line3" >> "$temp_file"
    echo "$line4" >> "$temp_file"
    echo "$line5" >> "$temp_file"

    xdotool type --file "$temp_file"

    rm "$temp_file"
}

case $key in 
    c ) figure_code
esac
