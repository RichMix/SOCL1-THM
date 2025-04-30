# HTB Section

Under the PORT heading, it also tells us that these are TCP ports. 
By default, Nmap will conduct a TCP scan unless specifically requested to perform a UDP scan.
The STATE heading confirms that these ports are open. Sometimes we will see other ports listed that have a different state, such as filtered. 
This can happen if a firewall is only allowing access to the ports from specific addresses.
The SERVICE heading tells us the service's name is typically mapped to the specific port number. 
However, the default scan will not tell us what is listening on that port.
Until we instruct Nmap to interact with the service and attempt to tease out identifying information, it could be another service altogether.

As we gain familiarity, we will notice that several ports are commonly associated with Windows or Linux. 
For example, port 3389 is the default port for Remote Desktop Services and is an excellent indication that the target is a Windows machine. 
In our current scenario, port 22 (SSH) being available indicates that the target is running Linux/Unix, but this service can also be configured on Windows. 
Let us run a more advanced Nmap scan and gather more information about the target device.

We can use the -sC parameter to specify that Nmap scripts should be used to try and obtain more detailed information. 
The -sV parameter instructs Nmap to perform a version scan.
In this scan, Nmap will fingerprint services on the target system and identify the service protocol, application name, and version.
The version scan is underpinned by a comprehensive database of over 1,000 service signatures. 
Finally, -p- tells Nmap that we want to scan all 65,535 TCP ports.

## Service Scanning
RichMix@htb[/htb]$ nmap -sV -sC -p- 10.129.42.253

Starting Nmap 7.80 ( https://nmap.org ) at 2021-02-25 16:18 EST
Nmap scan report for 10.129.42.253
Host is up (0.11s latency).
Not shown: 65530 closed ports
PORT    STATE SERVICE     VERSION
21/tcp  open  ftp         vsftpd 3.0.3
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_drwxr-xr-x    2 ftp      ftp          4096 Feb 25 19:25 pub
| ftp-syst: 
|   STAT: 
| FTP server status:
|      Connected to ::ffff:10.10.14.2
|      Logged in as ftp
|      TYPE: ASCII
|      No session bandwidth limit
|      Session timeout in seconds is 300
|      Control connection is plain text
|      Data connections will be plain text
|      At session startup, client count was 2
|      vsFTPd 3.0.3 - secure, fast, stable
|_End of status
22/tcp  open  ssh         OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
80/tcp  open  http        Apache httpd 2.4.41 ((Ubuntu))
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: PHP 7.4.3 - phpinfo()
139/tcp open  netbios-ssn Samba smbd 4.6.2
445/tcp open  netbios-ssn Samba smbd 4.6.2
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel


Host script results:
|_nbstat: NetBIOS name: GS-SVCSCAN, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2021-02-25T21:21:51
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 233.68 seconds
This returns a lot more information. We see that it took a lot longer to scan 65,535 ports than 1,000 ports. 
The -sC and -sV options also increase the duration of a scan, as instead of performing a simple TCP handshake, they perform a lot more checks. 
We notice that this time there is a VERSION heading, which reports the service version and the operating system if this is possible to identify.

So far, we know that the operating system is Ubuntu Linux. Application versions can also help reveal the target OS version. 
Take OpenSSH, for example. We see the reported version is OpenSSH 8.2p1 Ubuntu 4ubuntu0.1. 
From inspection of other Ubuntu SSH package changelogs, we see the release version takes the format 1:7.3p1-1ubuntu0.1. 
Updating our version to fit this format, we get 1:8.2p1-4ubuntu0.1. 
A quick search for this version online reveals that it is included in Ubuntu Linux Focal Fossa 20.04.

Google search results for '1:8.2p1-4ubuntu0.1 release' showing links to OpenSSH package on Launchpad.

Another quick search reveals that the release date of this OS is April 23rd, 2020.

Google search results for 'Ubuntu focal 20.04 release date' showing April 23, 2020, as the release date.

However, it is worth noting that this cross-referencing technique is not entirely reliable, as it is possible to install more recent application packages on an older OS version. 
The script scan -sC flag causes Nmap to report the server headers http-server-header page and the page title http-title for any web page hosted on the webserver. 
The web page title PHP 7.4.3 - phpinfo() indicates that this is a PHPInfo file, which is often manually created to confirm that PHP has been successfully installed. 
The title (and PHPInfo page) also reveals the PHP version, which is worth noting if it is vulnerable.

http://10.129.42.253/index.php
PHP Version 7.4.3 information table showing system details, build date, server API, and configuration paths.
Nmap Scripts
Specifying -sC will run many useful default scripts against a target, but there are cases when running a specific script is required. For example, in an assessment scope, we may be asked to audit a large Citrix installation. We could use this Nmap script to audit for the severe Citrix NetScaler vulnerability (CVE-2019–19781), while Nmap also has other scripts to audit a Citrix installation.

  Service Scanning
RichMix@htb[/htb]$ locate scripts/citrix

/usr/share/nmap/scripts/citrix-brute-xml.nse
/usr/share/nmap/scripts/citrix-enum-apps-xml.nse
/usr/share/nmap/scripts/citrix-enum-apps.nse
/usr/share/nmap/scripts/citrix-enum-servers-xml.nse
/usr/share/nmap/scripts/citrix-enum-servers.nse
The syntax for running an Nmap script is nmap --script <script name> -p<port> <host>.

## NMAP Scrips
Nmap scripts are a great way to enhance our scans' functionality, and inspection of the available options will pay dividends. 
Check out the Network Enumeration with Nmap module for a more detailed study of the Nmap tool.

# Attacking Network Services

## Banner Grabbing
As previously discussed, banner grabbing is a useful technique to fingerprint a service quickly. Often a service will look to identify itself by displaying a banner once a connection is initiated. Nmap will attempt to grab the banners if the syntax nmap -sV --script=banner <target> is specified. We can also attempt this manually using Netcat. Let us take another example, using the nc version of Netcat:

  Service Scanning
RichMix@htb[/htb]$ nc -nv 10.129.42.253 21

## THM // TCP-UDP

(UNKNOWN) [10.129.42.253] 21 (ftp) open
220 (vsFTPd 3.0.3)
This reveals that the version of vsFTPd on the server is 3.0.3. We can also automate this process using Nmap's powerful scripting engine: nmap -sV --script=banner -p21 10.10.10.0/24.

At the risk of oversimplification, we can classify ports in two states:

Open port indicates that there is some service listening on that port.
Closed port indicates that there is no service listening on that port.

## However, in practical situations, we need to consider the impact of firewalls. For instance, a port might be open, but a firewall might be blocking the packets. Therefore, Nmap considers the following six states:

- Open: indicates that a service is listening on the specified port.
- Closed: indicates that no service is listening on the specified port, although the port is accessible. By accessible, we mean that it is reachable and is not blocked by a firewall or other security appliances/programs.
- Filtered: means that Nmap cannot determine if the port is open or closed because the port is not accessible. This state is usually due to a firewall preventing Nmap from reaching that port. Nmap’s packets may be blocked from reaching the port; alternatively, the responses are blocked from reaching Nmap’s host.
- Unfiltered: means that Nmap cannot determine if the port is open or closed, although the port is accessible. This state is encountered when using an ACK scan -sA.
- Open|Filtered: This means that Nmap cannot determine whether the port is open or filtered.
- Closed|Filtered: This means that Nmap cannot decide whether a port is closed or filtered.

# TCP Flags

Nmap supports different types of TCP port scans. To understand the difference between these port scans, we need to review the TCP header. 
The TCP header is the first 24 bytes of a TCP segment. The following figure shows the TCP header as defined in RFC 793. 
This figure looks sophisticated at first; however, it is pretty simple to understand. In the first row, we have the source TCP port number and the destination port number. 
We can see that the port number is allocated 16 bits (2 bytes). In the second and third rows, we have the sequence number and the acknowledgement number. 
Each row has 32 bits (4 bytes) allocated, with six rows total, making up 24 bytes.


In particular, we need to focus on the flags that Nmap can set or unset. We have highlighted the TCP flags in red. Setting a flag bit means setting its value to 1. 
From left to right, the TCP header flags are:

- URG: Urgent flag indicates that the urgent pointer filed is significant. 
The urgent pointer indicates that the incoming data is urgent, and that a TCP segment with the URG flag set is processed immediately without consideration of having to wait on previously sent TCP segments.
- ACK: Acknowledgement flag indicates that the acknowledgement number is significant. It is used to acknowledge the receipt of a TCP segment.
- PSH: Push flag asking TCP to pass the data to the application promptly.
- RST: Reset flag is used to reset the connection. Another device, such as a firewall, might send it to tear a TCP connection. This flag is also used when data is sent to a host and there is no service on the receiving end to answer.
- SYN: Synchronize flag is used to initiate a TCP 3-way handshake and synchronize sequence numbers with the other host. The sequence number should be set randomly during TCP connection establishment.
- FIN: The sender has no more data to send.

This room covered three types of scans.

| Port Scan Type |	Example Command |
|----------------|------------------|
| TCP Connect    | nmap -sT 10.10.244.31 |
| TCP SYN Scan	 | sudo nmap -sS 10.10.244.31 |
| UDP Scan	     | sudo nmap -sU 10.10.244.31 |

These scan types should get you started discovering running TCP and UDP services on a target host.

| Option | Purpose |
|--------|---------|
| -p-	   |all ports
| -p1-1023|	scan ports 1 to 1023
| -F	100 | most common ports
| -r	  | scan ports in consecutive order
| -T<0-5>	| -T0 being the slowest and T5 the fastest
| --max-rate | 50	rate <= 50 packets/sec
| --min-rate | 15	rate >= 15 packets/sec
| --min-parallelism | 100	at least 100 probes in parallel


# TCP Null Scan, FIN Scan, and Xmas Scan

Let’s start with the following three types of scans:

- Null Scan
- FIN Scan
- Xmas Scan

## Null Scan
The null scan does not set any flag; all six flag bits are set to zero. You can choose this scan using the -sN option. 
A TCP packet with no flags set will not trigger any response when it reaches an open port, as shown in the figure below. 
Therefore, from Nmap’s perspective, a lack of reply in a null scan indicates that either the port is open or a firewall is blocking the packet.

However, we expect the target server to respond with an RST packet if the port is closed. 
Consequently, we can use the lack of RST response to figure out the ports that are not closed: open or filtered.

Below is an example of a null scan against a Linux server. The null scan we carried out has successfully identified the six open ports on the target system. 
Because the null scan relies on the lack of a response to infer that the port is not closed, it cannot indicate with certainty that these ports are open; 
there is a possibility that the ports are not responding due to a firewall rule.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sN MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-30 10:30 BST
Nmap scan report for MACHINE_IP
Host is up (0.00066s latency).
Not shown: 994 closed ports
PORT    STATE         SERVICE
22/tcp  open|filtered ssh
25/tcp  open|filtered smtp
80/tcp  open|filtered http
110/tcp open|filtered pop3
111/tcp open|filtered rpcbind
143/tcp open|filtered imap
MAC Address: 02:45:BF:8A:2D:6B (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 96.50 seconds
Note that many Nmap options require root privileges. Unless you are running Nmap as root, you need to use sudo as in the example above using the -sN option.


## FIN Scan
The FIN scan sends a TCP packet with the FIN flag set. You can choose this scan type using the -sF option. Similarly, no response will be sent if the TCP port is open. 
Again, Nmap cannot be sure if the port is open or if a firewall is blocking the traffic related to this TCP port.

However, the target system should respond with an RST if the port is closed. 
Consequently, we will be able to know which ports are closed and use this knowledge to infer the ports that are open or filtered. 
It's worth noting some firewalls will 'silently' drop the traffic without sending an RST.

Below is an example of a FIN scan against a Linux server. The result is quite similar to the result we obtained earlier using a null scan.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sF MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-30 10:32 BST
Nmap scan report for MACHINE_IP
Host is up (0.0018s latency).
Not shown: 994 closed ports
PORT    STATE         SERVICE
22/tcp  open|filtered ssh
25/tcp  open|filtered smtp
80/tcp  open|filtered http
110/tcp open|filtered pop3
111/tcp open|filtered rpcbind
143/tcp open|filtered imap
MAC Address: 02:45:BF:8A:2D:6B (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 96.52 seconds

## Xmas Scan
The Xmas scan gets its name after Christmas tree lights. An Xmas scan sets the FIN, PSH, and URG flags simultaneously. You can select Xmas scan with the option -sX.

Like the Null scan and FIN scan, if an RST packet is received, it means that the port is closed. Otherwise, it will be reported as open|filtered.

The following two figures show the case when the TCP port is open and the case when the TCP port is closed.

The console output below shows an example of a Xmas scan against a Linux server. The obtained results are pretty similar to that of the null scan and the FIN scan.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sX MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-30 10:34 BST
Nmap scan report for MACHINE_IP
Host is up (0.00087s latency).
Not shown: 994 closed ports
PORT    STATE         SERVICE
22/tcp  open|filtered ssh
25/tcp  open|filtered smtp
80/tcp  open|filtered http
110/tcp open|filtered pop3
111/tcp open|filtered rpcbind
143/tcp open|filtered imap
MAC Address: 02:45:BF:8A:2D:6B (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 84.85 seconds
One scenario where these three scan types can be efficient is when scanning a target behind a stateless (non-stateful) firewall. A stateless firewall will check if the incoming packet has the SYN flag set to detect a connection attempt. Using a flag combination that does not match the SYN packet makes it possible to deceive the firewall and reach the system behind it. However, a stateful firewall will practically block all such crafted packets and render this kind of scan useless.

# TCP Maimon Scan
Uriel Maimon first described this scan in 1996. In this scan, the FIN and ACK bits are set. The target should send an RST packet as a response. However, certain BSD-derived systems drop the packet if it is an open port exposing the open ports. This scan won’t work on most targets encountered in modern networks; however, we include it in this room to better understand the port scanning mechanism and the hacking mindset. To select this scan type, use the -sM option.

Most target systems respond with an RST packet regardless of whether the TCP port is open. In such a case, we won’t be able to discover the open ports. 
The figure below shows the expected behaviour in the cases of both open and closed TCP ports.

The console output below is an example of a TCP Maimon scan against a Linux server. As mentioned, because open ports and closed ports are behaving the same way, the Maimon scan could not discover any open ports on the target system.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sM 10.10.252.27

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-30 10:36 BST
Nmap scan report for ip-10-10-252-27.eu-west-1.compute.internal (10.10.252.27)
Host is up (0.00095s latency).
All 1000 scanned ports on ip-10-10-252-27.eu-west-1.compute.internal (10.10.252.27) are closed
MAC Address: 02:45:BF:8A:2D:6B (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 1.61 seconds
This type of scan is not the first scan one would pick to discover a system; however, it is important to know about it as you don’t know when it could come in handy.

# TCP ACK, Window, and Custom Scan

This task will cover how to perform a TCP ACK scan, a TCP window scan, and how to create your custom flag scan.


## TCP ACK Scan
Let’s start with the TCP ACK scan. As the name implies, an ACK scan will send a TCP packet with the ACK flag set. Use the -sA option to choose this scan. 
As we show in the figure below, the target would respond to the ACK with RST regardless of the state of the port. 
This behaviour happens because a TCP packet with the ACK flag set should be sent only in response to a received TCP packet to acknowledge the receipt of some data, unlike our case. Hence, this scan won’t tell us whether the target port is open in a simple setup.


In the following example, we scanned the target VM before installing a firewall on it. 
As expected, we couldn’t learn which ports were open.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sA MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-30 10:37 BST
Nmap scan report for MACHINE_IP
Host is up (0.0013s latency).
All 1000 scanned ports on MACHINE_IP are unfiltered
MAC Address: 02:45:BF:8A:2D:6B (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 1.68 seconds
      
This kind of scan would be helpful if there is a firewall in front of the target. 
Consequently, based on which ACK packets resulted in responses, you will learn which ports were not blocked by the firewall. 
In other words, this type of scan is more suitable to discover firewall rule sets and configuration.

After setting up the target VM MACHINE_IP with a firewall, we repeated the ACK scan. This time, we received some interesting results. 
As seen in the console output below, we have three ports that aren't being blocked by the firewall. 
This result indicates that the firewall is blocking all other ports except for these three ports.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sA MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-09-07 11:34 BST
Nmap scan report for MACHINE_IP
Host is up (0.00046s latency).
Not shown: 997 filtered ports
PORT    STATE      SERVICE
22/tcp  unfiltered ssh
25/tcp  unfiltered smtp
80/tcp  unfiltered http
MAC Address: 02:78:C0:D0:4E:E9 (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 15.45 seconds
      
Window Scan
Another similar scan is the TCP window scan. The TCP window scan is almost the same as the ACK scan; however, it examines the TCP Window field of the RST packets returned.
On specific systems, this can reveal that the port is open. You can select this scan type with the option -sW . 
As shown in the figure below, we expect to get an RST packet in reply to our “uninvited” ACK packets, regardless of whether the port is open or closed.

Similarly, launching a TCP window scan against a Linux system with no firewall will not provide much information. 
As we can see in the console output below, the results of the window scan against a Linux server with no firewall didn’t give any extra information compared to the ACK scan executed earlier.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sW MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-30 10:38 BST
Nmap scan report for MACHINE_IP
Host is up (0.0011s latency).
All 1000 scanned ports on ip-10-10-252-27.eu-west-1.compute.internal (10.10.252.27) are closed
MAC Address: 02:45:BF:8A:2D:6B (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 1.60 seconds
      
However, as you would expect, if we repeat our TCP window scan against a server behind a firewall, we expect to get more satisfying results. 
In the console output shown below, the TCP window scan pointed that three ports are detected as closed. 
(This is in contrast with the ACK scan that labelled the same three ports as unfiltered.) 
Although we know that these three ports are not closed, we realize they responded differently, 
indicating that the firewall does not block them.

Pentester Terminal
pentester@TryHackMe$ sudo nmap -sW MACHINE_IP

Starting Nmap 7.60 ( https://nmap.org ) at 2021-09-07 11:39 BST
Nmap scan report for MACHINE_IP
Host is up (0.00040s latency).
Not shown: 997 filtered ports
PORT    STATE  SERVICE
22/tcp  closed ssh
25/tcp  closed smtp
80/tcp  closed http
MAC Address: 02:78:C0:D0:4E:E9 (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 14.84 seconds

## Custom Scan
If you want to experiment with a new TCP flag combination beyond the built-in TCP scan types, you can do so using --scanflags . 
For instance, if you want to set SYN, RST, and FIN simultaneously, you can do so using --scanflags RSTSYNFIN . 
As shown in the figure below, if you develop your custom scan, you need to know how the different ports will behave to interpret the results in different scenarios correctly.

x 

Finally, it is essential to note that the ACK scan and the window scan were very efficient at helping us map out the firewall rules.
However, it is vital to remember that just because a firewall is not blocking a specific port, it does not necessarily mean that a service is listening on that port. 
For example, there is a possibility that the firewall rules need to be updated to reflect recent service changes. 
Hence, ACK and window scans are exposing the firewall rules, not the services.

# Fragmented Packets

## Firewall
A firewall is a piece of software or hardware that permits packets to pass through or blocks them. 
It functions based on firewall rules, summarized as blocking all traffic with exceptions or allowing all traffic with exceptions. 
For instance, you might block all traffic to your server except those coming to your web server. 
A traditional firewall inspects, at least, the IP header and the transport layer header. 
A more sophisticated firewall would also try to examine the data carried by the transport layer.

## IDS
An intrusion detection system (IDS) inspects network packets for select behavioural patterns or specific content signatures. 
It raises an alert whenever a malicious rule is met. 
In addition to the IP header and transport layer header, an IDS would inspect the data contents in the transport layer and check if it matches any malicious patterns. 
How can you make it less likely for a traditional firewall/IDS to detect your Nmap activity? 
It is not easy to answer this; however, depending on the type of firewall/IDS, you might benefit from dividing the packet into smaller packets.

## Fragmented Packets
Nmap provides the option -f to fragment packets. Once chosen, the IP data will be divided into 8 bytes or less. Adding another -f (-f -f or -ff) will split the data into 16 byte-fragments instead of 8. You can change the default value by using the --mtu; however, you should always choose a multiple of 8.

To properly understand fragmentation, we need to look at the IP header in the figure below. It might look complicated at first, but we notice that we know most of its fields. In particular, notice the source address taking 32 bits (4 bytes) on the fourth row, while the destination address is taking another 4 bytes on the fifth row. The data that we will fragment across multiple packets is highlighted in red. To aid in the reassembly on the recipient side, IP uses the identification (ID) and fragment offset, shown on the second row of the figure below.

Let’s compare running sudo nmap -sS -p80 10.20.30.144 and sudo nmap -sS -p80 -f 10.20.30.144. 
As you know by now, this will use stealth TCP SYN scan on port 80; however, in the second command, we are requesting Nmap to fragment the IP packets.

In the first two lines, we can see an ARP query and response. Nmap issued an ARP query because the target is on the same Ethernet. 
The second two lines show a TCP SYN ping and a reply. The fifth line is the beginning of the port scan; Nmap sends a TCP SYN packet to port 80. 
In this case, the IP header is 20 bytes, and the TCP header is 24 bytes. Note that the minimum size of the TCP header is 20 bytes.

With fragmentation requested via -f, the 24 bytes of the TCP header will be divided into multiples of 8 bytes, with the last fragment containing 8 bytes or less of the TCP header. Since 24 is divisible by 8, we got 3 IP fragments; each has 20 bytes of IP header and 8 bytes of TCP header. We can see the three fragments between the fifth and the seventh lines.

Note that if you added -ff (or -f -f), the fragmentation of the data will be multiples of 16. 
In other words, the 24 bytes of the TCP header, in this case, would be divided over two IP fragments, the first containing 16 bytes and the second containing 8 bytes of the TCP header.

On the other hand, if you prefer to increase the size of your packets to make them look innocuous, you can use the option --data-length NUM, where num specifies the number of bytes you want to append to your packets.

# Idle/Zombie Scan
Spoofing the source IP address can be a great approach to scanning stealthily. However, spoofing will only work in specific network setups. 
It requires you to be in a position where you can monitor the traffic. 
Considering these limitations, spoofing your IP address can have little use; however, we can give it an upgrade with the idle scan.

The idle scan, or zombie scan, requires an idle system connected to the network that you can communicate with. 
Practically, Nmap will make each probe appear as if coming from the idle (zombie) host, then it will check for indicators whether the idle (zombie) host received any response to the spoofed probe. This is accomplished by checking the IP identification (IP ID) value in the IP header. 
You can run an idle scan using nmap -sI ZOMBIE_IP 10.10.189.203, where ZOMBIE_IP is the IP address of the idle host (zombie).

The idle (zombie) scan requires the following three steps to discover whether a port is open:

Trigger the idle host to respond so that you can record the current IP ID on the idle host.
Send a SYN packet to a TCP port on the target. The packet should be spoofed to appear as if it was coming from the idle host (zombie) IP address.
Trigger the idle machine again to respond so that you can compare the new IP ID with the one received earlier.
Let’s explain with figures. In the figure below, we have the attacker system probing an idle machine, a multi-function printer. 
By sending a SYN/ACK, it responds with an RST packet containing its newly incremented IP ID.

The attacker will send a SYN packet to the TCP port they want to check on the target machine in the next step. However, this packet will use the idle host (zombie) IP address as the source. Three scenarios would arise. In the first scenario, shown in the figure below, the TCP port is closed; therefore, the target machine responds to the idle host with an RST packet. The idle host does not respond; hence its IP ID is not incremented.

In the second scenario, as shown below, the TCP port is open, so the target machine responds with a SYN/ACK to the idle host (zombie). 
The idle host responds to this unexpected packet with an RST packet, thus incrementing its IP ID.

In the third scenario, the target machine does not respond at all due to firewall rules. 
This lack of response will lead to the same result as with the closed port; the idle host won’t increase the IP ID.

For the final step, the attacker sends another SYN/ACK to the idle host. 
The idle host responds with an RST packet, incrementing the IP ID by one again. 
The attacker needs to compare the IP ID of the RST packet received in the first step with the IP ID of the RST packet received in this third step. If the difference is 1, it means the port on the target machine was closed or filtered. However, if the difference is 2, it means that the port on the target was open.

It is worth repeating that this scan is called an idle scan because choosing an idle host is indispensable for the accuracy of the scan. If the “idle host” is busy, all the returned IP IDs would be useless.

This room covered the following types of scans.

| Port Scan | Type | Example Command |
|-----------|------|-----------------|
| TCP Null  | Scan	sudo nmap -sN 10.10.214.203 |
| TCP FIN   | Scan	sudo nmap -sF 10.10.214.203 |
| TCP Xmas  | Scan	sudo nmap -sX 10.10.214.203 |
| TCP Maimon| Scan	sudo nmap -sM 10.10.214.203 |
| TCP ACK   | Scan	sudo nmap -sA 10.10.214.203 |
| TCP Window| Scan	sudo nmap -sW 10.10.214.203 |
| Custom TCP| Scan	sudo nmap --scanflags URGACKPSHRSTSYNFIN 10.10.214.203 |
| Spoofed Source IP | sudo nmap -S SPOOFED_IP 10.10.214.203 |
| Spoofed MAC Address	--spoof-mac SPOOFED_MAC|
| Decoy Scan	nmap -D DECOY_IP,ME 10.10.214.203 |
| Idle (Zombie) Scan	sudo nmap -sI ZOMBIE_IP 10.10.214.203 |
| Fragment IP data into 8 bytes	-f |
| Fragment IP data into 16 bytes	-ff |
| Option	Purpose|
| --source-port PORT_NUM |
| specify source | port number |
| --data-length NUM | 
|-------------------|

append random data to reach given length
These scan types rely on setting TCP flags in unexpected ways to prompt ports for a reply. 
Null, FIN, and Xmas scan provoke a response from closed ports, while Maimon, ACK, and Window scans provoke a response from open and closed ports.

| Option | Purpose |
|--------|---------|
|--reason| explains how Nmap made its conclusion |
|-v	     | verbose |
|-vv	   | very verbose|
|-d	     | debugging |
|-dd	   | more details for debugging |

