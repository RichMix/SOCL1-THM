# Introduction to MITRE

For those that are new to the cybersecurity field, you probably never heard of MITRE. 
Those of us that have been around might only associate MITRE with CVEs ( Common Vulnerabilities and Exposures ) list, which is one resource you'll probably check when searching for an exploit for a given vulnerability. 
But MITRE researches in many areas, outside of cybersecurity, for the 'safety, stability, and well-being of our nation.'  
These areas include artificial intelligence, health informatics, space security, to name a few.

From Mitre.org : " At MITRE, we solve problems for a safer world. Through our federally funded R&D centers and public-private partnerships, we work across government to tackle challenges to the safety, stability, and well-being of our nation. "

In this room, we will focus on other projects/research that the US-based non-profit MITRE Corporation has created for the cybersecurity community, specifically:

- ATT&CK ®  ( A dversarial  T actics,  T echniques,  and   C ommon  K nowledge) Framework
- CAR ( C yber  A nalytics  R epository) Knowledge Base
- ENGAGE  (sorry, not a fancy acronym)
- D3FEND ( D etection,  D enial, and  D isruption  F ramework  E mpowering  N etwork  D efense)
- AEP ( A TT&CK  E mulation  P lans)

## Basic Terminology
Before diving in, let's briefly discuss a few terms that you will often hear when dealing with the framework, threat intelligence, etc.

## APT   is an acronym for  Advanced Persistent Threat .  
This can be considered a team/group ( threat group ), or even country ( nation-state group ), that engages in long-term attacks against organizations and/or countries. 
The term 'advanced' can be misleading as it will tend to cause us to believe that each APT group all have some super-weapon, e.i. a zero-day exploit, that they use. 
That is not the case. As we will see a bit later, the techniques these APT groups use are quite common and can be detected with the right implementations in place. 
You can view FireEye's current list of APT groups here .  

## TTP is an acronym for  Tactics, Techniques, and Procedures,  but what does each of these terms mean?
The  Tactic  is the adversary's goal or objective.
The  Technique  is how the adversary achieves the goal or objective.
The  Procedure  is how the technique is executed.
If that is not that clear now, don't worry. Hopefully, as you progress through each section, TTPs will make more sense.

# **ATT&CK® Framework
What is the ATT&CK® framework? According to the  website , "MITRE ATT&CK® is a globally-accessible knowledge base of adversary tactics and techniques based on real-world observations." 
In 2013, MITRE began to address the need to record and document common TTPs ( Tactics, Techniques, and Procedures ) that APT ( Advanced Persistent Threat ) groups used against enterprise Windows networks. 
This started with an internal project known as FMX ( Fort Meade Experiment ). Within this project, selected security professionals were tasked to emulated adversarial TTPs against a network, and data was collected from the attacks on this network. 
The gathered data helped construct the beginning pieces of what we know today as the ATT&CK® framework.

The ATT&CK® framework has grown and expanded throughout the years. 
One notable expansion was that the framework focused solely on the Windows platform but has expanded to cover other platforms, such as macOS and Linux. 
The framework is heavily contributed to by many sources, such as security researchers and threat intelligence reports. Note this is not only a tool for blue teamers. 
The tool is also useful for red teamers .

If you haven't done so, navigate to the ATT&CK®  website .

Direct your attention to the bottom of the page to view the  ATT&CK® Matrix for Enterprise . Across the top of the matrix, there are 14 categories.
Each category contains the techniques an adversary could use to perform the tactic. 
The categories cover the seven-stage Cyber Attack Lifecycle (credit Lockheed Martin for the Cyber Kill Chain).

## (ATT&CK Matrix v11.2)

Under  Initial Access , there are 9 techniques. Some of the techniques have sub-techniques, such as Phishing. 

If we click on the gray bar to the right, a new layer appears listing the sub-techniques. 

To get a better understanding of this technique and it's associated sub-techniques, click on Phishing.

We have been directed to a page dedicated to the technique known as Phishing and all related information regarding the technique, such as a brief description,  
Procedure Examples , and  Mitigations . 

You can alternatively resort to using the Search feature to retrieve all associated information regarding a given technique, sub-technique, and/or group. 

Lastly, the same data can be viewed via the  MITRE ATT&CK® Navigator : " 
The ATT&CK® Navigator is designed to provide basic navigation and annotation of ATT&CK® matrices, something that people are already doing today in tools like Excel.
We've designed it to be simple and generic - you can use the Navigator to visualize your defensive coverage, your red/blue team planning, the frequency of detected techniques, or anything else you want to do ."

You can access the Navigator view when visiting a group or tool page. 
The ATT&CK® Navigator Layers button will be available.

In the sub-menu select  view .

Let's get acquainted with this tool. Click  here  to view the ATT&CK® Navigator for Carbanak. 

At the top left, there are 3 sets of controls:  selection controls ,  layer controls , and  technique controls . 
I encourage you to inspect each of the options under each control to get familiar with them. 
The question mark at the far right will provide additional information regarding the navigator. 

To summarize, we can use the ATT&CK Matrix to map a threat group to their tactics and techniques.  
There are various methods the search can be initiated. 

The questions below will help you become more familiar with the ATT&CK®.  It is recommended to start answering the questions from the  Phishing page .
Note, that this link is for version 8 of the  ATT&CK Matrix. **
