#!/bin/sh

# Makes this script executable
sudo chmod +x manpagetopdf.sh

# Creates a folder called Converted-man-Pages-PDF inside the home directory
sudo mkdir /home/Converted-man-Pages-PDF
cd /home/Converted-man-Pages-PDF

# Takes every entry from listed man pages and saves just the names into manpagelist.csv 
man -k .|awk '{$0=$1};1' > manpagelist.csv

# Here we use the data inside the manpagelist.csv file to generate the PDFs using the names sotred in the manpagelist.csv file
filename="manpagelist.csv"
# Reads till no trailing space, saves entry as the manpagename variable, executes the conversion to PDF file, 
# moves to the next line and repeats till the end of the manpagelist.csv file
while IFS=""; read -r manpagename; do
	man -t $manpagename|ps2pdf - $manpagename.pdf
done < $filename

# We let the user know where the PDFs were saved
echo "Done... PDFs locaded in $pwd"

