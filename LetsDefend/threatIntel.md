# Threat Intelligence Feed

A SOC team should be immediately aware of the latest threats and take the necessary precautions. 
To meet this need, threat intelligence feeds are created. As a SOC analyst, you can use these feeds to guide your investigations.

A Threat Intelligence Feed is data (such as malware hashes, C2 (Command&Control) domain/IP addresses etc.) provided by a third party company.

Looking at LetsDefend's Threat Intel page, you can see many types of data (hash, IP, etc.)


The data here consists of artifacts from previous malicious activity. 
It could be the hash of malware or the IP address of a command and control center. 
As a SOC analyst, you need to search threat intelligence feeds to determine if a hash file at hand has ever been used in a malicious scenario in the past.

Here are some free and popular sources you can use:

VirusTotal
Talos Intelligence


Important points to highlight:

If data you run through feeds does not show up
Let's say you ran a hash of an .exe in VirusTotal and in the past you didn't find anything suspicious about it. 
In this case, you should not just assume that the file is clean, that would be a mistake. 
A SOC analyst should carefully perform the necessary file analysis (static/dynamic).

