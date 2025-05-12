# Core Metrics
To begin with, let's recall the main goal of a SOC - to protect the confidentiality, integrity, and availability of the organisation's digital assets. 
The SOC team performs its purpose by developing, receiving, and triaging alerts. 
The L1 analysts' role in this process is to reliably report True Positives to the higher level, to L2. This leads us to the first four metrics:

## Metric	Formula	Measures
Alerts Count	AC = Total Count of Alerts Received	Overall load of SOC analysts
False Positive Rate	FPR = False Positives / Total Alerts	Level of noise in the alerts
Alert Escalation Rate	AER = Escalated Alerts / Total Alerts	Experience of L1 analysts
Threat Detection Rate	TDR = Detected Threats / Total Threats	Reliability of the SOC team
Alerts Count
A magnifying glass searching for threats in an ocean of False Positives

Imagine starting your shift and seeing 80 unresolved alerts in the queue. 
That's definitely overwhelming and prone to missing real threats hiding behind the noise spam. On the other hand, consider a whole week without any alerts.
Sounds better at first glance, but also concerning since a too low count of alerts may indicate an issue in the SIEM or lack of visibility, leading to undetected breaches.
The ideal metric value depends on company size but in general, 5 to 30 alerts per day per L1 analyst is a good metric.

### False Positive Rate
If 75 out of 80 alerts (94%) were confirmed to be False Positives like system noise or typical IT activity - that's a bad signal for your team. With more noise, analysts tend to become less vigilant and more likely to miss the threat and treat all alerts just like "yet another spam".
A False Positive rate of 0% is an unachievable ideal, but 80% or higher is a serious problem, usually fixed by a tool and detection rules tuning, often called "False Positive Remediation".

### Alert Escalation Rate
A magnifying glass pointed at a single threat while other threats are hidden because of issues in SIEM or lack of SOC experience

L2 analysts rely on L1 to filter out the noise and escalate only the actionable, threatening alerts.
At the same time, as L1, you don't want to be overconfident and triage alerts you do not fully understand without a senior support. The alert escalation rate comes in handy to evaluate how experienced and independent the L1 analysts are and how often they decide to escalate the alert.
It is usually aimed to be below 50%, or even better below 20%.

## Threat Detection Rate
Imagine that out of six attacks for 2025, your SOC team detected and prevented four attacks, missed the fifth because of the broken detection rule, and the sixth because one of the L1 analysts misclassified the breach as False Positive. 
The resulting metric is TDR = 4 / 6 = 67%, and this is a very bad result. The threat detection rate should always be at 100% since every missed threat can have devastating consequences, such as ransomware infection and data exfiltration.

# Triage Metrics
Next, remember that an alert by itself will not stop the breach, and it is important to timely receive the alert, triage it, and respond to the attack before the attackers achieve their goals.
The requirements to ensure a quick detection and remediation of the threat are commonly grouped into a Service Level Agreement (SLA) - a document signed between the internal SOC team and its company management, or by the managed SOC provider (MSSP) and its customers. The agreement usually requires quick threat detection (measured by MTTD), timely alert acknowledgement by L1 analysts (measured by MTTA), and finally, prompt response to the threat, like isolating the device or securing the breached account (measured by MTTR):

Metrics timeline showing a typical threat timeline, where first we measure MTTD, then MTTA, and finally MTTR

Reference Table

| Metric | Common SLA | Description |
|--------|------------|-------------|
| SOC Team Availability |	24/7 |	Working schedule of the SOC team, often Monday-Friday (8/5) or 24/7 mode |
| Mean Time to Detect (MTTD) |	5 minutes	| Average time between the attack and its detection by SOC tools |
| Mean Time to Acknowledge (MTTA)	| 10 minutes |	Average time for L1 analysts to start triage of the new alert |
| Mean Time to Respond (MTTR) |	60 minutes |	Average time taken by SOC to actually stop the breach from spreading |
