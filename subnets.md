# Subnetworks

Let's review a couple of terms before we move on to the main tasks. 
A network segment is a group of computers connected using a shared medium. For instance, the medium can be the Ethernet switch or WiFi access point. 
In an IP network, a subnetwork is usually the equivalent of one or more network segments connected together and configured to use the same router. 
The network segment refers to a physical connection, while a subnetwork refers to a logical connection.

In the following network diagram, we have four network segments or subnetworks. Generally speaking, your system would be connected to one of these network segments/subnetworks. 
A subnetwork, or simply a subnet, has its own IP address range and is connected to a more extensive network via a router. 
There might be a firewall enforcing security policies depending on each network.

Subnets with /16, which means that the subnet mask can be written as 255.255.0.0. This subnet can have around 65 thousand hosts.
Subnets with /24, which indicates that the subnet mask can be expressed as 255.255.255.0. This subnet can have around 250 hosts.
You might want to refer to Task 2 in the Intro to LAN room if you need to learn more about subnetting.

As part of active reconnaissance, we want to discover more information about a group of hosts or about a subnet. 
If you are connected to the same subnet, you would expect your scanner to rely on ARP (Address Resolution Protocol) queries to discover live hosts. 
An ARP query aims to get the hardware address (MAC address) so that communication over the link-layer becomes possible; 
however, we can use this to infer that the host is online. 
(We revisit link-layer in Task 4.)

If you are in Network A, you can use ARP only to discover the devices within that subnet (10.1.100.0/24). 
Suppose you are connected to a subnet different from the subnet of the target system(s). 
In that case, all packets generated by your scanner will be routed via the default gateway (router) to reach the systems on another subnet; however, 
the ARP queries won’t be routed and hence cannot cross the subnet router. 
ARP is a link-layer protocol, and ARP packets are bound to their subnet.

You have learned how ARP, ICMP, TCP, and UDP can detect live hosts by completing this room. Any response from a host is an indication that it is online. Below is a quick summary of the command-line options for Nmap that we have covered.

Scan Type	Example Command
ARP Scan	sudo nmap -PR -sn MACHINE_IP/24
ICMP Echo Scan	sudo nmap -PE -sn MACHINE_IP/24
ICMP Timestamp Scan	sudo nmap -PP -sn MACHINE_IP/24
ICMP Address Mask Scan	sudo nmap -PM -sn MACHINE_IP/24
TCP SYN Ping Scan	sudo nmap -PS22,80,443 -sn MACHINE_IP/30
TCP ACK Ping Scan	sudo nmap -PA22,80,443 -sn MACHINE_IP/30
UDP Ping Scan	sudo nmap -PU53,161,162 -sn MACHINE_IP/30
Remember to add -sn if you are only interested in host discovery without port-scanning. Omitting -sn will let Nmap default to port-scanning the live hosts.

Option	Purpose
-n	no DNS lookup
-R	reverse-DNS lookup for all hosts
-sn	host discovery only


