# What is MITRE ATT&CK Matrix?
MITRE ATT&CK Matrix is a visualization method used to classify and see attack methods of cyber attackers. 
Matrices can be customized for almost any subject and turned into useful visuals. 
MITRE has created MITRE ATT&CK matrices to visualize the details of attacker behavior using the matrices.

## Types of Matrices
3 different matrices have been created within the MITRE ATT&CK Framework according to the platform types:

## Enterprise Matrix
Mobile Matrix
ICS (Industrial Control Systems) Matrix

Enterprise Matrix

Enterprise matrix is the first matrix created by MITRE. 
There are more digital systems included in this matrix and are more common than those that are included in other matrices, so there are a lot more information in this matrix than other matrices. 
Enterprise matrix is mainly used to understand the cyber attacks on large organizations.

The following image shows the enterprise matrix in detail:

  
(Image Source: mitre.org)
There are 7 sub-matrices under the Enterprise Matrix:

PRE
Windows
macOS
Linux
Cloud
Network
Containers
You can access the Enterprise Matrix and its sub-matrices at the following link and can learn more about them:

Enterprise Matrix: https://attack.mitre.org/matrices/enterprise/ 
(Image Source: mitre.org)

Mobile Matrix

The mobile matrix is the one that was prepared for mobile devices and contains information about the cyber security of mobile devices. 
This matrix can be used to ensure the security of individual and corporate mobile devices. Comparing the Enterprise Matrix, it contains less information:

The following image shows the mobile matrix:
You can reach Mobile Matrix at the following link and learn more:

Mobile Matrix: https://attack.mitre.org/matrices/mobile/ 

Mobile Matrix has 2 sub-matrices:

Android
iOS

ICS Matrix

The ICS Matrix is the one that contains the information collected for the cyber security of devices in the industrial control systems. 
This matrix can be used to provide cyber security and analyses of an ICS.

The following image shows the ICS matrix:

You can access the ICS Matrix in the image above at the following link:

ICS Matrix: https://attack.mitre.org/matrices/ics/ 

We have covered the MITRE ATT&CK matrices in this part of the training. 
We have explained what the MITRE ATT&CK matrix is, type of matrices their sub-types. 
In the next part of the training, the subject of “Tactics” within the matrices is explained.

## Tactics

What is Tactic?
Tactic expresses the purpose of the cyber attacker and the reason for his action. Tactics are one of the most important MITRE ATT&CK Framework components used to group cyber attacker behaviors and see the attack steps. Tactics are in the top row of the matrix.

As an example, the tactics on the enterprise matrix are shown in the image below:

Types of Tactics
Tactics often consist of general statements as they express the purpose and reason for the cyber attack. Therefore, the tactics for each matrix are highly similar.

For example, the image below shows detailed information about the "Initial Access" tactic belonging to the enterprise matrix:


Note: Since the page in the above image has a long content, only the top part is shown.

The tactic numbers and names in each matrix are given in the titles below.


Enterprise Tactics
There are 14 tactics in the Enterprise matrix as in the list below:

Reconnaissance
Resource Development
Initial Access
Execution
Persistence
Privilege Escalation
Defense Evasion
Credential Access
Discovery
Lateral Movement
Collection
Command and Control
Exfiltration
Impact

Enterprise Tactics: https://attack.mitre.org/tactics/enterprise/ 

You can access each tactic under the Enterprise matrix from the navigation menu on the left of the page at the link above.


Mobile Tactics
There are 14 tactics in the Mobile matrix as in the list below:

Initial Access
Execution
Persistence
Privilege Escalation
Defense Evasion
Credential Access
Discovery
Lateral Movement
Collection
Command and Control
Exfiltration
Impact
Network Effects
Remote Service Effects

Mobile Tactics: https://attack.mitre.org/tactics/mobile/ 

You can access each tactic under the Mobile matrix from the navigation menu on the left of the page at the link above.

ICS Tactics
There are 12 tactics in the ICS matrix as in the list below:

Initial Access
Execution
Persistence
Privilege Escalation
Evasion
Discovery
Lateral Movement
Collection
Command and Control
Inhibit Response Function
Impair Process Control
Impact

ICS Tactics: https://attack.mitre.org/tactics/ics/ 

You can access each tactic under the ICS matrix from the navigation menu on the left of the page at the link above.

In this part of the training, we have covered what the tactic is within the matrices as a  MITRE ATT&CK Framework component. We have also listed the tactics that are included in different matrices. In the next part of the training, we will cover the topic “Techniques and Sub-Techniques” within the matrices.

Techniques and Sub-Techniques

What are Techniques and Sub-Techniques?
The tactics within the matrix only show what the attackers aim and do not contain detailed information about the attacker's attack method. The techniques and sub-techniques, on the other hand show the methods used by the attacker to achieve his goal and how he conducted the attack exactly. Each technique/sub-technique is included within the matrix depending on a particular tactic. As an example, some of the techniques on the enterprise matrix are shown in the image below:


The majority of the areas in the matrix in the image above is techniques. Some techniques have sub-techniques and some do not.

As it is shown in the image above, If there are gray areas next to the boxes where the names of the techniques are written in the matrix, it indicates that the technique has a sub-technique. For example, let's see the sub-techniques of the first 4 techniques under the "Reconnaissance" tactic:

# Types of Techniques and Sub-Techniques
Techniques are divided into 3 groups according to matrices:

Enterprise Techniques
Mobile Techniques
ICS Techniques

Enterprise Techniques
There are quite a number of enterprise techniques and are constantly updated over the time. The current number (10.05.2023) of enterprise techniques and sub-techniques is as follows:

Techniques: 193

Sub-techniques: 401

You can check the current numbers at the link below:

Enterprise Techniques and Sub-techniques: https://attack.mitre.org/techniques/enterprise/ 

Mobile Techniques
Total number of mobile techniques is less than the enterprise techniques and they are updated over the time as well. The current number (10.05.2023) of the mobile techniques and sub-techniques is as follows:

Techniques: 66

Sub-techniques: 41

You can check the current numbers at the link below:

Mobile Techniques and Sub-techniques: https://attack.mitre.org/techniques/mobile/ 

ICS Techniques
As with the techniques of other matrices, ICS techniques are also updated over the  time. The current number (10.05.2023) of ICS techniques and sub-techniques is as follows:

Techniques: 79

Sub-techniques: 0

You can check the current numbers at the link below:

ICS Techniques and Sub-techniques: https://attack.mitre.org/techniques/ics/ 

## What is Procedure?
The procedure consists of usage examples of techniques/sub-techniques. It simply shows which tool/software was utilized during the implementation of the technique. In other words, it is the explanation of the practical information on the use of the technique.

An example of the procedure for the "OS Credential Dumping" technique is in the image below:

Procedures can also be accessed through the page where the techniques are located.

In this part of the training, we have covered what technique/sub-technique is, the techniques in the matrices and the concept of procedure. The numbers of the techniques and their details are too much to cover here and we have briefly overviewed them. You can have more details and information about them at https://attack.mitre.org/techniques/enterprise/In the next part of the training, we will review “Mitigations”.

# Mitigations

What are Mitigations?
Mitigations refers to the measures and actions that can be taken in response to the techniques in the MITRE ATT&CK matrix. Each mitigation has a unique ID, name and description that provides clear understanding about them. For example, the image below shows one of the enterprise mitigations:


Note: Since the page in the above image has a long content, only the top part is shown.



Types of Mitigations
Mitigations are grouped into 3 for the matrices as in other MITRE ATT&CK components:

Enterprise Mitigations
Mobile Mitigations
ICS Mitigations


Enterprise Mitigations



(Image Source: mitre.org)



Note: Since the page in the above image has a long content, only the top part is shown.


The number of enterprise mitigations at the time of preparation of this training is as follows:

Mitigations: 43

You can check the below link to see the updated number:

Enterprise Mitigations: https://attack.mitre.org/mitigations/enterprise/

Mobile Mitigations

Note: Since the page in the above image has a long content, only the top part is shown.


The number of mobile mitigations at the time of preparation of this training is as follows:

Mitigations: 11

You can check the below link to see the updated number:

Mobile Mitigations: https://attack.mitre.org/mitigations/mobile/ 



ICS Mitigations

Note: Since the page in the above image has a long content, only the top part is shown.


The number of ICS mitigations at the time of preparation of this training is as follows:

Mitigations: 51

You can check the below link to see the updated number:

ICS Mitigations: https://attack.mitre.org/mitigations/ics/ 

In this part of the training, we have covered what the mitigations are in the MITRE ATT&CK Framework and the number of mitigations. In the next part of the training, we will detail the “Groups” topic.

# Groups
Advanced Persistent Threat (APT) Groups, are the hacker groups that may include many different people and groups that carry out cyber attacks in a targeted and systematic way, with governments support from time to time. APT groups may conduct cyber attacks with different motivations. For example, the group may have a specific mission, may be conducting their attacks for money, or may be foreign government supported and conduct their attacks to obtain their national ideals.

Within the MITRE ATT&CK Framework, information about APT groups is collected which helps identify which APT group is targeting which systems and which cyber attack techniques are being implemented. When all this information is gathered together and evaluated with the MITRE ATT&CK matrix, the attack map of the APT group can be revealed.

Groups: 135

You can check the below link to see the updated number:

Groups: https://attack.mitre.org/groups/ 

When the above site is visited, a menu like the image below will appear on the left side of the page:

Using this menu, information about the listed APT groups can be accessed. For example, the information about the “Lazarus Group” APT group is as follows:

As seen in the image above, each APT group listed in the MITRE ATT&CK Framework has a unique Group ID, Name and Description.

You can also see the information about the techniques used by the group in cyber attacks at the bottom of the page:


Under the “Techniques” column, you can see what tools, software or techniques that the APT group was leveraged for the attack. For example, some software used by the “Lazarus Group” APT group is as in the image below:

We have covered the Groups included in the MITRE ATT&CK Framework in this part of the training. We will detail the “Software” topic in the next part of the training.

# Software
Software are the programs developed to work on digital systems. In the software section of MITRE ATT&CK Framework, there are software used by APT groups.

Each software has a unique ID, name and description. For example, the below image shows the ID, Name and the Description of the software:


In order to obtain detailed information about the software, you can click on the software name so you can access the related software page. For example, the page of the “3PARA RAT” software is shown in the image below:



Note: Since the page in the above image has a long content, only the top part is shown.


The image above shows the page with detailed information about the "3PARA RAT" software. The information on this page includes which techniques the software uses and which APT group(s) utilizes this software.

There are quite a number of software included in the MITRE ATT&CK Framework and the names/IDs/Descriptions are constantly updated over time with the newly added software. The number of software at the time of preparation of this training is as follows:

Software: 718

You can see the current number of software by checking the link below:

Software: https://attack.mitre.org/software/ 

When you visit this site, you will see the menu like the one in the image below on the left of the page:


You can have detailed information about the listed software through this menu.

In this part of the training, we have covered the software included in the MITRE ATT&CK Framework.

