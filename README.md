vim connect.cfg
chmod +x database.sh
./database.sh

chmod +x main.sh
./main.sh

if you use as server 
please run
sed -i '/s/bash cwflash.sh.bak/#bash cwflash.sh.bak/' main.sh
p
chmod +x server.sh
./server.sh
