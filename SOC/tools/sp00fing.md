# Spoofing and Decoys
In some network setups, you will be able to scan a target system using a spoofed IP address and even a spoofed MAC address. 
Such a scan is only beneficial in a situation where you can guarantee to capture the response. 
If you try to scan a target from some random network using a spoofed IP address, chances are you won’t have any response routed to you, and the scan results could be unreliable.

The following figure shows the attacker launching the command nmap -S SPOOFED_IP 10.10.189.203. 
Consequently, Nmap will craft all the packets using the provided source IP address SPOOFED_IP. 
The target machine will respond to the incoming packets sending the replies to the destination IP address SPOOFED_IP. 
For this scan to work and give accurate results, the attacker needs to monitor the network traffic to analyze the replies.

In brief, scanning with a spoofed IP address is three steps:

Attacker sends a packet with a spoofed source IP address to the target machine.
Target machine replies to the spoofed IP address as the destination.
Attacker captures the replies to figure out open ports.
In general, you expect to specify the network interface using -e and to explicitly disable ping scan -Pn. 
Therefore, instead of nmap -S SPOOFED_IP 10.10.189.203, you will need to issue nmap -e NET_INTERFACE -Pn -S SPOOFED_IP 10.10.189.203 to tell Nmap explicitly which network interface to use and not to expect to receive a ping reply. It is worth repeating that this scan will be useless if the attacker system cannot monitor the network for responses.

When you are on the same subnet as the target machine, you would be able to spoof your MAC address as well. 
You can specify the source MAC address using --spoof-mac SPOOFED_MAC. 
This address spoofing is only possible if the attacker and the target machine are on the same Ethernet (802.3) network or same WiFi (802.11).

Spoofing only works in a minimal number of cases where certain conditions are met. 
Therefore, the attacker might resort to using decoys to make it more challenging to be pinpointed. 
The concept is simple, make the scan appear to be coming from many IP addresses so that the attacker’s IP address would be lost among them. 
As we see in the figure below, the scan of the target machine will appear to be coming from 3 different sources, and consequently, the replies will go the decoys as well.


You can launch a decoy scan by specifying a specific or random IP address after -D. 
For example, nmap -D 10.10.0.1,10.10.0.2,ME 10.10.189.203 will make the scan of 10.10.189.203 appear as coming from the IP addresses 10.10.0.1, 10.10.0.2, and then ME to indicate that your IP address should appear in the third order. Another example command would be nmap -D 10.10.0.1,10.10.0.2,RND,RND,ME 10.10.189.203, where the third and fourth source IP addresses are assigned randomly, while the fifth source is going to be the attacker’s IP address. 
In other words, each time you execute the latter command, you would expect two new random IP addresses to be the third and fourth decoy sources.

What do you need to add to the command sudo nmap 10.10.189.203 to make the scan appear as if coming from the source IP address 10.10.10.11 instead of your IP address?
-S 10.10.10.11
Correct Answer
What do you need to add to the command sudo nmap 10.10.189.203 to make the scan appear as if coming from the source IP addresses 10.10.20.21 and 10.10.20.28 in addition to your IP address?

-D 10.10.20.21,10.10.20.28,ME
Correct Answer

