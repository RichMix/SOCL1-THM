# Firewalls 

Deployment became common in networks after organizations discovered their ability to filter harmful traffic from their systems and networks. Several different types of firewalls were introduced afterward, each serving a unique purpose. It's also important to note that different types of firewalls work on different OSI model layers. Firewalls are categorized into many types. 

Let’s examine a few of the most common types of firewalls and their roles in the OSI model.



## Stateless Firewall
This type of firewall operates on layer 3 and layer 4 of the OSI model and works solely by filtering the data based on predetermined rules without taking note of the state of the previous connections. 
This means it will match every packet with the rules regardless of whether it is part of a legitimate connection. 
It maintains no information on the state of the previous connections to make decisions for future packets. 
Due to this, these firewalls can process the packets quickly. However, they cannot apply complex policies to the data based on its relationship with the previous connections. 
Suppose the firewall denies a few packets from a single source based on its rules. 
Ideally, it should drop all the future packets from this source because the previous packets could not comply with the firewall’s rules. 
However, the firewall keeps forgetting this, and future packets from this source will be treated as new and matched by its rules again.

## Stateful Firewall
Unlike stateless firewalls, this type of firewall goes beyond filtering packets by predetermined rules. 
It also keeps track of previous connections and stores them in a state table. This adds another layer of security by inspecting the packets based on their history with connections. 
Stateful firewalls operate at layer 3 and layer 4 of the OSI model. Suppose the firewall accepts a few packets from a source address based on its rules. 
In that case, it will take note of this connection in its stated table and allow all the future packets for this connection to automatically get allowed without inspecting each of them. 
Similarly, the stateful firewalls take note of the connections for which they deny a few packets, and based upon this information, they deny all the subsequent packets coming from the same source.

## Proxy Firewall
The problem with previous firewalls was their inability to inspect the contents of a packet. 
Proxy firewalls, or application-level gateways, act as intermediaries between the private network and the Internet and operate on the OSI model’s layer 7. 
They inspect the content of all packets as well. The requests made by users in a network are forwarded by this proxy after inspection and masking them with their own IP address to provide anonymity for the internal IP addresses. 
Content filtering policies can be applied to these firewalls to allow/deny incoming and outgoing traffic based on their content.

## Next-Generation Firewall (NGFW)
This is the most advanced type of firewall that operates from layer 3 to layer 7 of the OSI model, offering deep packet inspection and other functionalities that enhance the security of incoming and outgoing network traffic. 
It has an intrusion prevention system that blocks malicious activities in real time. 
It offers heuristic analysis by analyzing the patterns of attacks and blocking them instantly before reaching the network. 
NGFWs have SSL/TLS decryption capabilities, which inspect the packets after decrypting them and correlate the data with the threat intelligence feeds to make efficient decisions.

The table below lists each firewall’s characteristics, which will help you choose the most suitable firewall for different use cases.

## Firewalls	Characteristics

Stateless firewalls	- Basic filtering
- No track of previous connections
- Efficient for high-speed networks

Stateful firewalls	- Recognize traffic by patterns
- Complex rules can be applicable
- Monitor the network connections

Proxy firewalls	- Inspect the data inside the packets as well
- Provides content filtering options
- Provides application control
- Decrypts and inspects SSL/TLS data packets

Next-generation firewalls	- Provides advanced threat protection
- Comes with an intrusion prevention system
- Identify anomalies based on heuristic analysis
- Decrypts and inspects SSL/TLS data packets

## Rules in Firewalls
A firewall gives you control over your network’s traffic. 
Although it filters the traffic based on its built-in rules, some customized rules can be defined for various networks. 
For example, there would be networks that want to deny all the SSH traffic coming into their network. 
However, your network would have a requirement to allow SSH traffic from a few specific IP addresses. 
The rules allow you to configure these customized settings for your network’s incoming and outgoing traffic.

## The basic components of a firewall’s rule are described below:

Source address: The machine’s IP address that would originate the traffic.
Destination address: The machine’s IP address that would receive the data.
Port: The port number for the traffic.
Protocol: The protocol that would be used during the communication.
Action: This defines the action that would be taken upon identifying any traffic of this particular nature.
Direction: This field defines the rule’s applicability to incoming or outgoing traffic.

## Types of Actions
The component “Action” from a rule indicates the steps to take after a data packet falls under the category of the defined rule. Three main actions that can be applied to a rule are explained below.

Allow
A rule’s “Allow” action indicates that the particular traffic defined inside the rule would be permitted.

For example, let’s create a rule with an action to allow all the outgoing traffic from our network for port 80 (used for HTTP traffic to the Internet).

Action	Source	Destination	Protocol	Port	Direction
Allow	192.168.1.0/24	Any	TCP	80	Outbound
Deny
A rule’s “Deny” action means that the traffic defined inside the rule would be blocked and not permitted. 
These rules are fundamental for the security team to deny specific traffic coming from malicious IP addresses and create more rules to reduce the threat surface of the network.

For example, let’s create a rule with an action to deny all the incoming traffic on port 22 (used for remotely connecting to a machine via SSH) of our critical server.

Action	Source	Destination	Protocol	Port	Direction
Deny	Any	192.168.1.0/24	TCP	22	Inbound
Forward
The action “Forward” redirects traffic to a different network segment using the forwarding rules created on the firewalls. 
This applies to the firewalls that provide routing functionality and act as gateways between different network segments.

For example, let’s create a rule with an action to forward all the incoming traffic on port 80 (used for HTTP traffic) to the web server 192.168.1.8.

Action	Source	Destination	Protocol	Port	Direction
Forward	Any	192.168.1.8	TCP	80	Inbound
Directionality of Rules
Firewalls have different categories of rules, each categorized based on the traffic directionality on which the rules are created. Let’s examine each of these directionalities.


## Inbound Rules
Rules are categorized as inbound rules when they are meant to be applied to incoming traffic only. For example, you might allow incoming HTTP traffic (port 80) on your web server.

## Outbound Rules
These rules are made for outgoing traffic only. For example, blocking all outgoing SMTP traffic (port 25) from all the devices except the mail server.

## Forward Rules
Forwarding rules are created to forward specific traffic inside the network. 
For example, a forwarding rule can be created to forward the incoming HTTP (port 80) traffic to the web server located in your network.

## Windows Defender Firewall
Windows Defender is a built-in firewall introduced by Microsoft in the Windows OS. This firewall contains all the basic functionality for creating, allowing, or denying specific programs or creating customized rules. This task is designed to cover some of the essential components of the Windows Defender Firewall, which you can utilize to restrict your system’s incoming and outgoing network traffic. To open this firewall, you have to open the Windows search and type "Windows Defender Firewall."

The Windows Defender Firewall’s home page shows the "Network Profiles" and the available options. This is the main dashboard with all the options for the firewall.

## Windows Defender Firewall dashboard.

Network Profiles
There are two available network profiles. Windows firewall determines your current network based on Network Location Awareness (NLA) and applies that profile firewall settings for you. We can have different firewall settings for each of them.

Private networks: This includes the firewall configurations to apply when connected to our home network.
Guest or public networks: This includes the firewall configurations to apply when connected to a public or untrusted network like coffee shops, restaurants, or similar. For example, when connecting to public networks, you can configure firewall settings to block all incoming network connections and allow only some outgoing connections that are essential for you. These settings will apply to the public network profile and will not be implemented when you are in your private home network.
To allow/disallow any application in any of your network profiles, click on the option (highlighted as 1 in the screenshot). This will take you to the page listing all the apps and features installed in your system. You can checkmark the ones you want to allow in any of your network profiles or uncheck those if not needed. Windows Defender Firewall is turned on by default. However, if you want to turn it on/off, you can click on the option (highlighted as 2 in the screenshot). This will take you to the settings for both of your network profiles. Rather than completely turning it off, which Microsoft doesn’t recommend, you can also block all incoming connections. You can also click on "Restore Defaults" (highlighted as 3 in the screenshot) from the main dashboard anytime to restore all the firewall's default settings.

## Windows Defender Firewall different options.

Custom Rules
Windows Defender Firewall also allows you to create custom rules for your network to allow/disallow specific traffic as needed. Let’s create a custom rule to block all outgoing traffic on HTTP (port 80) or HTTPS (port 443). After creating this rule, we will be unable to browse any website on the Internet as the websites are working on port 80 or 443, which we will be blocking.

Before creating this rule, let's test if we are able to visit a website. For testing, let's visit http://10.10.10.10/. As shown in the screenshot below, we are able to visit this website.



To create a custom rule, choose "Advanced Settings" from the available options in the main dashboard. This will open a new tab where you can create your own rules.



