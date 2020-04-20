# cloud-systems-assignment2

## Screencast
  
  https://www.youtube.com/watch?v=Stz_FGBxtgo
  
## Files

| File                               | Purpose                                                                                         |
| -----------------------------------| ----------------------------------------------------------------------------------------------- |
| Assignment-Report.pdf              | Report on the approach and results of the assignment                                            |
| CURL-Commands.sh                   | Shell script containing CURL commands to enable firewall and add rules to permit access         |
| Create-Organisation-Topology.py    | Python script to create the organisation's topology using Mininet                               |
| Organisation-Network-Diagram.png   | Diagram of the organisation from a network perspective                                          |
| Output-blocked-packet.JPG          | Ouput of the console log for a blocked packet                                                   |
| Output-mininam.jpg                 | Image displaying MiniNAM view of network after creating the topology                            |
| Output-pingall-initial.jpg         | Image displaying results of pingall after network and controller with NO rules                  |
| Output-pingall-final.jpg           | Image displaying results of pingall after network and controller with rules                     |
| Start-Services.py                  | Python script to start the sshd on all servers for clients to connect to test connectivity      |


## Environment preparation

1. Download and install the latest version of VirtualBox

2. Download the latest version of Ubuntu

3. Install Ubuntu as a guest operating system on VirtualBox

4. Download mininet, ryu a few other python modules (you will be prompted for them as and when you need them)

## Steps

1. From terminal (Open mininet console and MiniNAM and creates topology)

     `sudo python MiniNAM.py --custom Create-Organisation-Topology.py --topo organisationtopo --controller remote`

2. From mininet console, start controller terminal

     `xterm c0`

3. From controller terminal, start ryu "firewall" controller

    `ryu-manager ryu.app.rest_firewall`

4. From mininet console, start SSH daemons

    `source py Start-Services.py`

5. From terminal, configure firewall rules

    `./CURL-Commands.sh`

6. From mininet console, verify connectivety between nodes

     `pingall`

7. From mininet console, verify SSH connectivity

     `ssh XXX@YYYYYYYYYYY`
