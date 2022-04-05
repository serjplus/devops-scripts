#!/bin/bash
echo "Deploing #speedtest tools"

 apt install python3-pip -y
pip install speedtest-cli
echo "List All Servers"
speedtest-cli --list
echo "List USA Servers"
speedtest-cli --list | grep USA
echo "List UK Servers"
speedtest-cli --list | grep London

#echo "Test to London"
# speedtest-cli --server 17245
 
# speedtest-cli --list | grep Armenia
# echo "Test to Beeline" 
# speedtest-cli --server 1638
 
# echo "Test to Ucom"
#  speedtest-cli --server 8649
