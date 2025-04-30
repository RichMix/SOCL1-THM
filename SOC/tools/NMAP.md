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

(UNKNOWN) [10.129.42.253] 21 (ftp) open
220 (vsFTPd 3.0.3)
This reveals that the version of vsFTPd on the server is 3.0.3. We can also automate this process using Nmap's powerful scripting engine: nmap -sV --script=banner -p21 10.10.10.0/24.
