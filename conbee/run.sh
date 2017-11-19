# Start with resetting the zigbee module (this cannot be executed from this container)
# /usr/bin/GCFFlasher -r
# Start deCONZ
# List all devices
/usr/bin/GCFFlasher -l
/usr/bin/deCONZ --auto-connect=1 -platform minimal --http-port=80 --ws-port=8080 --dbg-info=3