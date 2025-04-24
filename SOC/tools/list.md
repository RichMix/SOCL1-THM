# Vunderbility tools
Vulnerability scanning is the inspection of digital systems to find weaknesses. 
Organizations carry critical information in their digital infrastructure. 
They must regularly scan their systems and networks for vulnerabilities, as attackers can leverage these vulnerabilities to compromise their digital infrastructure, resulting in a considerable loss. 
Vulnerability scanning is also an important compliance requirement of many regulatory bodies. 
Some security standards advise performing vulnerability scanning quarterly, while some advise performing it once a year.

We saw how important it is to conduct vulnerability scans in your digital landscape regularly; 
however, manually looking for these weaknesses can be very hectic and miss some major ones. 
The bigger the network is, the slower the process of manual vulnerability scanning would be. 
This is no longer an issue as some efficient vulnerability scanners that perform automated vulnerability scanning are available in the market. 
This automated vulnerability scanning has made life much easier. 
You only need to install the tool and give it an IP address for a host or a network range for a network; it will start checking vulnerabilities and give you an easy-to-read report with the details of the vulnerabilities found.

After identifying vulnerabilities, organizations fix them by making changes to a software program or system. 
These changes are referred to as Patches.

Vulnerability scans can be categorized into many types; however, the major categorization of these scans are explained below:

Authenticated vs. Unauthenticated Scans
Authenticated scans require the subject host's credentials and are more detailed than unauthenticated scans. 
These types of scans are helpful for discovering the threat surface within the host. However, unauthenticated scans are conducted without providing any credentials of the subject host. 
These scans help identify the threat surface from outside the host.

Authenticated Scans	Unauthenticated Scans
The credentials of the subject host must be provided to the vulnerability scanner.	
The vulnerability scanner does not require the host’s credentials; it only needs the IP address.
Identifies the vulnerabilities that can be exploited by the attackers having access to the host.	
Identifies the vulnerabilities that can be exploited by an external attacker having no access to the subject host.
It provides a deeper visibility into the target system by scanning its configuration and installed applications.	
It is less resource-intensive and straightforward to set up.
For example, scanning an internal database by providing its credentials to the vulnerability scanner.	
For example, scanning a public-facing website for vulnerabilities that any user can exploit.
Authenticated Scans.Unauthenticated Scans..
Internal vs. External Scans
Internal scans are conducted from inside the network, while external scans are conducted from outside the network. 
Let's see a few of their differences below.

Internal Scans	External Scans
Conducted from inside the network.	Conducted from outside the network.
It focuses on the vulnerabilities that can be exploited inside the network.	
It focuses on the vulnerabilities that can be exploited from outside the network.
Identifies vulnerabilities that would be exposed to the attackers once they get inside the network.	
Identifies the vulnerabilities exposed to the attacker from outside the network.
External vs Internal Scans.

# Tools
The choice between vulnerability scan types depends on several factors.
Authenticated scans are often used for internal vulnerability scanning, while unauthenticated scans are mostly used for external vulnerability scanning.

## Nessus: https://www.tenable.com/products/nessus
Nessus was developed as an open-source project in 1998. It was later acquired by Tenable in 2005 and became proprietary software. 
It has extensive vulnerability scanning options and is widely used by large enterprises. It is available in both free and paid versions. 
The free version offers a limited number of scan features. 
In contrast, its commercial version offers advanced scanning features, unlimited scans, and professional support. 
Nessus needs to be deployed and managed on-premises.

## Qualys:  https://www.qualys.com/
Qualys was developed in 1999 as a subscription-based vulnerability management solution. 
Along with continuous vulnerability scanning, it provides compliance checks and asset management. 
It automatically alerts on the vulnerabilities found during continuous monitoring.
The best thing about Qualys is that it is a cloud-based platform, which means there is no extra cost or effort to keep it up and running on our physical hardware and manage it.

## Nexpose : https://www.rapid7.com/products/nexpose/
Nexpose was developed by Rapid7 in 2005 as a subscription-based vulnerability management solution. 
It continuously discovers new assets in the network and performs vulnerability scans on them. 
It gives vulnerability risk scores depending on the asset value and the vulnerability’s impact. 
It also provides compliance checks against various standards. 
Nexpose offers both on-premises and hybrid (cloud and on-premises) deployment modes.

## OpenVAS (Open Vulnerability Assessment System) : https://www.openvas.org/
OpenVAS is an open-source vulnerability assessment solution developed by Greenbone Security. 
It offers basic features with known vulnerabilities scanned through its database. It is less extensive than commercial tools; however, it gives you the flavor of a complete vulnerability scanner. It is beneficial for small organizations and individual systems. The next section will explore this tool in more detail by performing vulnerability scanning.

Almost all vulnerability scanners offer reporting capabilities. They generate a detailed report after every vulnerability scan. These reports contain a list of the vulnerabilities discovered, their risk scores, and detailed descriptions. Some vulnerability scanners offer advanced reporting capabilities that provide remediation methods for all the discovered vulnerabilities and allow you to export these vulnerability assessment reports in different formats.

Each of the tools mentioned above has its strengths. When choosing a suitable vulnerability scanner for your digital assets, you must consider the scope, resources, depth of analysis, and other factors.
