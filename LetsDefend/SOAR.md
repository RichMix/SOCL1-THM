# SOAR (Security Orchestration Automation and Response)

SOAR stands for Security Orchestration Automation and Response. 
It enables security products and tools in an environment to work together, streamlining the tasks of SOC team members.
For example, it will automatically search VirusTotal for the source IP of a SIEM alert, reducing the workload of the SOC analyst.

Some SOAR products commonly used in the industry:

Splunk Phantom
IBM Resilient
Logsign
Demisto

The image below shows what can be achieved with a SOAR solution.

image: hawk-eye.io

The benefits of SOAR and how you can effectively use SOAR as a SOC analyst will be the focus of the rest of this lesson.

Saves You Time
SOAR saves time with workflows that automate processes. Some common workflows are:

IP address reputation control
Hash query
Scanning an acquired file in a sandbox environment
…

Centralization (A single platform for everything you need)
It allows you to use different security tools in your environment (sandbox, log management, 3rd party tools, etc.) by providing an all-in-one software. 
These tools are integrated into the SOAR solution and can be used on the same platform.

image: splunk.com

Playbooks
You can easily investigate SIEM alerts using playbooks created for different scenarios within SOAR. 
Even if you don't know or remember all the procedures, you can perform an analysis by following the steps outlined in the playbooks



In addition, these playbooks help ensure that the entire SOC team is on the same page when performing their analysis. For example, all team members need to check IP reputation, so if one team member is not checking it and the others are, this is an undesirable situation. We can avoid this situation by adding this step to the playbook.



