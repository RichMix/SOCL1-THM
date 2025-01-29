At this stage, we have levelled﻿ up our detection capabilities against the artifacts. 
The attacker would most likely give up trying to break into your network or go back and try to create a new tool that serves the same purpose. 
It will be a game over for the attackers as they would need to invest some money into building a new tool (if they are capable of doing so)
find the tool that has the same potential, or even gets some training to learn how to be proficient in a certain tool. 

Attackers would use the utilities to create malicious macro documents (maldocs) for spearphishing attempts, a backdoor that can be used to 
establish C2 (Command and Control Infrastructure), any custom .EXE, and .DLL files, payloads, or password crackers.
https://www.varonis.com/blog/what-is-c2

A Trojan dropped the suspicious "Stealer.exe" in the Temp folder:



The execution of the suspicious binary:



Antivirus signatures, detection rules, and YARA rules can be great weapons for you to use against attackers at this stage.

MalwareBazaar and Malshare are good resources to provide you with access to the samples, malicious feeds, and YARA results - 
these all can be very helpful when it comes to threat hunting and incident response. 
https://bazaar.abuse.ch/
https://malshare.com/

For detection rules, SOC Prime Threat Detection Marketplace is a great platform, where security professionals share their detection r
ules for different kinds of threats including the latest CVE's that are being exploited in the wild by adversaries. 
https://tdm.socprime.com/signup

Fuzzy hashing is also a strong weapon against the attacker's tools. Fuzzy hashing helps you to perform similarity analysis - match two files with minor differences based on the fuzzy hash values. 
One of the examples of fuzzy hashing is the usage of SSDeep; on the SSDeep official website, you can also find the complete explanation for fuzzy hashing. 

Example of SSDeep from VirusTotal:
https://ssdeep-project.github.io/ssdeep/index.html
