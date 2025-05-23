# IDS (Intrusion Detection System)

Think of an example of a building’s security. A firewall acts as the gatekeeper, checking the people coming in and going out. 
There is always a chance that some bad actor will successfully sneak inside and start performing malicious activities. 
He was missed at the gate, but what if we catch him even after he gets in? 
This can be done by the surveillance cameras present throughout the building. The IDS plays the role of surveillance cameras. 
It sits in a corner, monitors the network traffic based on its signature and anomaly-based detections, and detects any abnormal traffic going out or inside the network. 
Upon every detection, an alert is generated for the security administrators.
IDS does not act on those detections; it only notifies the security administrators about the malicious activity.


This room will equip you with sound knowledge of IDS solutions. 
In the upcoming tasks, we will also explore the most popular open-source IDS solution. 

Learning Objectives
- Types of IDS and their detection capabilities
- Working of Snort IDS
- Default and custom rules in Snort IDS
- Making a custom rule in Snort IDS

## Types of IDS: Deployment Modes
IDS can be deployed in the following ways:

## Host Intrusion Detection System (HIDS): 
Host-based IDS solutions are installed individually on the hosts and are responsible for only detecting potential security threats associated with that particular host. 
They provide detailed visibility of the host’s activities. However, host intrusion detection systems can be challenging to manage in large networks as they are resource-intensive and require management on each host.

## Network Intrusion Detection System (NIDS): 
Network-based IDS solutions are crucial in detecting potentially malicious activities within the whole network, regardless of any specific hosts. 
They monitor the network traffic of all the hosts involved to detect suspicious activities. 
It provides a centralized view of all the detections inside the whole network.
Difference between NIDS and HIDS.

# Detection Modes

## Signature-Based IDS: 
Many attacks occur every day. Each attack has its unique pattern, which is known as a signature. 
These signatures are preserved by the IDS in their databases so that if the same attack happens in the future, it gets detected by its signature and reported to the security administrators for action. 
The stronger the signature database of the IDS is, the more efficiently it would detect known threats.
However, the signature-based IDS is unable to detect zero-day attacks. 
Zero-day attacks have no prior signatures (patterns) and are not saved inside the IDS databases.
Therefore, the signature-based IDS can only detect the attacks that happened previously, and its signatures (patterns) are saved inside the database.
In the upcoming tasks, we will explore a signature-based IDS named Snort.

## Anomaly-Based IDS: 
This type of IDS first learns the normal behavior (baseline) of the network or system and performs detections if there is any deviation from the normal behavior.
Anomaly-based IDS can also detect zero-day attacks because they don’t rely on the available signatures for the detections but detect abnormalities inside the network or system by comparing the current state with the normal behavior (baseline). 
However, this type of IDS may generate a lot of false positives (marking benign activities as malicious) because the nature of most legitimate programs matches the malicious ones. Anomaly-based IDS would mark them malicious and believe anything behaving unusually is malicious. 
We can also reduce the false positives generated by anomaly-based IDS by fine-tuning it (manually defining the normal behavior in the IDS).

## Hybrid IDS: 
A hybrid IDS combines the detection methods of signature-based IDS and anomaly-based IDS to leverage the strengths of each approach.
Some known threats may already have some signatures in the IDS database; 
in this case, the hybrid IDS would use the detection technique of the signature-based IDS. 
If it encounters a new threat, it can leverage the detection method of anomaly-based IDS.
Signature-based IDS can detect threats quickly, while other IDS can have a high processing overhead. 
However, it is also essential to consider the IDS based on several different factors. 
Signature-based IDS can be a good option for covering a small threat surface. 
Anomaly-based IDS and hybrid IDS can help detect modern zero-day attacks, which are increasing daily and can cause massive damage to organizations.

## Snort
Snort is one of the most widely used open-source IDS solutions developed in 1998. It uses signature-based and anomaly-based detections to identify known threats. These are defined in the rule files of the Snort tool. Several built-in rule files come pre-installed in this tool’s package. These built-in rule files contain a variety of known attack patterns. Snort’s built-in rules can detect a lot of malicious traffic for you. However, you can configure Snort to detect specific types of network traffic that are not covered by the default rule files. You can create custom rules based on your requirements to detect specific traffic. You can also disable any built-in detection rules if they don’t point to harmful traffic for your system or network and define some custom rules instead. In the upcoming task, we will explore the built-in rules and make custom rules to detect specific traffic.

Modes of Snort
Difference between Packet Sniffer mode, Packet Logging mode, and NIDS mode.

Mode	Description	Use Case
Packet sniffer mode	This mode reads and displays network packets without performing any analysis on them. The packet sniffer mode of Snort does not directly relate to IDS capabilities, but it can be helpful in network monitoring and troubleshooting. In some cases, system administrators might need to read the traffic flow without performing any detection to diagnose specific issues. In this case, they can utilize the packet sniffer mode of Snort. This mode allows you to display the network traffic on the console or even output it in a file.	The network team observes some network performance issues. To diagnose the issue, they need detailed insights into the network traffic. For this purpose, they can utilize Snort’s packet sniffer mode.
Packet logging mode	Snort performs detection on the network traffic in real-time and displays the detections as alerts on the console for the security administrators to take action. However, in some cases, the network traffic needs to be logged for later analysis. The packet logging mode of Snort allows you to log the network traffic as a PCAP (standard packet capture format) file. This includes all the network traffic and any detections from it. Forensic investigators can use these Snort log files to perform the root cause analysis of previous attacks.	The security team needs to initiate a forensic investigation of a network attack. They would need the traffic logs to perform the root cause analysis. The network traffic logged through Snort’s packet logging mode can help them.
Network Intrusion Detection System mode	Snort’s NIDS mode is the primary mode that monitors network traffic in real-time and applies its rule files to identify any match to the known attack patterns stored as signatures. If there is a match, it generates an alert. This mode provides the main functionality of an IDS solution.	The security team must proactively monitor their network or systems to detect potential threats. They can leverage Snort’s NIDS mode to achieve this.
The most relevant use of Snort as an IDS comes from its NIDS mode. However, Snort can be used in any of the above modes depending upon the requirement.

