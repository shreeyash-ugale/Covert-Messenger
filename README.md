# Covert Messenger

**Covert Messenger** is a secure chat application that uses simple ROT encryption to obfuscate messages and hides communication within ICMP packets. This project uses a combination of Python, Bash, and third-party tools to ensure both secure and stealth communication between clients and servers.

## Features

- **Stealth communication**: Hides chat messages in ICMP packets.
- **Encryption**: Uses a simple ROT cipher to encrypt messages.
- **Cross-platform**: Supports both Linux and Windows with the help of ptunnel.
- **Port forwarding**: Ensures secure communication through port forwarding.
- **Bash and Python scripts**: Automates setup and connection handling.

---

## Project Structure
```
.
├── README.md
├── include
│   ├── client-connect.sh
│   ├── line-formatter.sh
│   ├── messenger.sh
│   └── server-connect.sh
├── main-chat.sh
├── pf-lin.py
├── pf-win.py
└── ptunnel-ng.exe
```

---

## Dependencies

- **ptunnel-ng**: A tool that tunnels data in ICMP packets.
- **Python 3**: Required for port forwarding.
- **ncat**: Netcat tool for connecting to the chat server.
- **mingw**: Required for compiling Windows binaries.
- **gsudo (choco)**: Required for elevated permissions on Windows.

## Installation

### 1. Install ptunnel-ng

Clone and build ptunnel-ng from the following repository:

```bash
git clone https://github.com/utoni/ptunnel-ng.git
cd ptunnel-ng
chmod +x autogen.sh
./autogen.sh
make install
```
OR
```bash
wget http://ports.ubuntu.com/pool/universe/p/ptunnel-ng/ptunnel-ng_1.42-1_arm64.deb
sudo dpkg -i ptunnel-ng_1.42-1_arm64.deb
```

To compile for Windows, install mingw and ensure WinPcap support if needed. WinPcap can be downloaded here:

[WinPcap Download](http://www.winpcap.org/install/bin/WpdPack_4_0_2.zip)

OR

Download from [releases](https://github.com/utoni/ptunnel-ng/releases/tag/v1.42)

## Usage

### Step 1: Start ptunnel on Linux
Run ptunnel-ng on the Linux server:
```bash
sudo ptunnel-ng
```
### Step 2: Start ptunnel on Windows
Run ptunnel-ng on the Windows client, specifying the WSL IP and setting up the tunnel:
```bash
sudo ptunnel-ng -p<WSL_IP> -l6666 -R5555
```
### Step 3: Start Secure Tunnel on Linux
Start port forwarding on the Linux server using Python:
```bash
python3 pf-lin.py
```
### Step 4: Start Secure Tunnel on Windows
Start port forwarding on the Windows client using Python:
```bash
python3 pf-win.py
```
### Step 5: Start the Chat Server
Run the main Bash script to start the chat server on Linux:
```bash
sh main-chat.sh
```
### Step 6: Connect to the Chat Server
Use `ncat` to connect to the chat server through the secure tunnel:
```bash
ncat 127.0.0.1 4444
```
---
#### If you check your WSL(Hyper-V) firewall which sits between Windows and WSl with [Wireshark](https://www.wireshark.org/), you will notice that all communication Takes place over ICMP and the data within the packet is encrypted as expected

