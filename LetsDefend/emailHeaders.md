# What is an Email Header and How to Read Them?
In this lesson, we will explain the header information in an email, how to access it, and what you can do with it. 
It is important to follow this section carefully as we will explain how to perform the header analysis in the next section.

What is an Email Header?

The header is a section of the email containing information such as sender, recipient, and date. 
There are also components such as 'Return-Path', 'Reply-To', and 'Received'. 
Below you can see the header details of an example email.


What does the Email Header do?

Allows you to identify the sender and recipient

Thanks to the "From" and "To" fields in the header, you can find out who is sending an email and who is receiving it. 
If we look at the email above, which you have downloaded in "eml" format, we can see that it was sent from "ogunal@letsdefend.io" to "info@letsdefend.io".


## Spam Blocker

It is possible to detect spam emails using header analysis and various other methods. 
This prevents people from receiving SPAM emails.

Allows You to Track an Email's Route

It is important to check the route an email takes to see if it came from the correct address. If we look at the example email above, we can see that it came from the address "ogunal@letsdefend.io", but it is still not certain whether it came from the domain "letsdefend.io" or from another fake server that imitates the same name. We can use the header information to answer this question.

## Important Fields

From

The 'From' field in an Internet header shows the name and email address of the sender.

To

This field in the mail header contains the details of the recipient of the email, including their name and email address. Such as CC (carbon copy) and BCC (blind carbon copy) also fall under this category, as they all contain details of your recipients.

To find out more about carbon copy and blind carbon copy, see How to use CC and BCC.

Date

This is the timestamp showing when the email was sent.

In Gmail, it usually follows the format day dd month yyyy hh:mm:ss

So if an email was sent on 16 November 2021 at 4:57:23 pm, it would show up as Wed, 16 Nov 2021 16:57:23.

Subject

The subject is the topic of the email. It summarises the content of the entire message body.

Return-Path

This email header field is also known as Reply-To. When you reply to an email, the reply is sent to the address specified in the Return-Path field.

## Domain Key and DKIM Signatures

Domain Key and Domain Key Identified Mail (DKIM) are email signatures that help email service providers identify and authenticate your emails, similar to SPF signatures.

Message-ID

The Message-ID header is a unique combination of letters and numbers that identifies each email. No two emails will have the same Message ID.

MIME-Version

Multipurpose Internet Mail Extensions (MIME) is an Internet coding standard. It converts non-text content, such as images, videos, and other attachments, into text so that non-text content can be attached to an email and sent via SMTP (Simple Mail Transfer Protocol).

Received

The Received section lists each mail server that an email has passed through before arriving in the recipient's inbox. It's listed in reverse chronological order - the mail server at the top is the last server the email message passed through, and the mail server at the bottom is where the email originated.

## X-Spam Status

The X-Spam Status shows you the spam score of an email message.
First, it'll highlight if a message is classified as spam.
It then shows the spam score of the email and the spam threshold for the email.
An email can either meet or exceed an inbox's spam threshold. If it's too spammy and exceeds the threshold, it's automatically classified as spam and sent to the Spam folder.

Field Definitions: gmass.co

How to Access Your Email Header?

Gmail

1- Open the email in question
2- Click on the 3 dots at the top right "..."
3- Click on the "Download message" button.

4- Open the downloaded file with the extension ".eml" with any notebook application

Outlook

1- Open the email in question
2- File -> Info -> Properties -> Internet headers

## Email Header Analysis
In the previous lesson, we looked at what a phishing email is, what the header information is, and what it does. Now, when we suspect that an email is phishing, we will know what we should do and what the analysis process should be like.

Here are the key questions we need to answer when checking headings during a Phishing analysis:

Was the email sent from the correct SMTP server?
Are the data "From" and "Return-Path / Reply-To" the same?

The e-mail examined in the rest of the article:

Note: Connect to the lab machine with the connect button below. Use the "C:\Users\LetsDefend\Desktop\Files\Mail-Analysis.zip" file to analyze the email. (File Password: infected)

Was the email sent from the correct SMTP server?

We can check the "Received" field to see the path the email took. As you can see in the image below, the email came from the server with the IP address "101[.]99.94.116".

If we look at who is sending the mail ("sender"), we can see that it is coming from the domain "letsdefend.io".

So, under normal circumstances, "letsdefend.io" should be using "101[.]99.94.116" to send mail. To confirm this, we can query the MX servers that "letsdefend.io" is actively using."

"mxtoolbox.com" will help you by showing you the MX servers used by the domain you are asking for.

If we look at the image above, the domain "letsdefend.io" uses Google addresses as its email server. So there is no relation with the addresses emkei[.]cz or "101[.]99.94.116".


This examination showed that the email did not come from the original address, but was spoofed.


Are the 'From' and 'Return-Path / Reply-To' details the same?

Except in exceptional cases, we expect the sender of the email and the recipient of the replies to be the same. Here is an example of how these parts are used differently in phishing attacks:


Someone sends an email (Gmail, Hotmail, etc.) to LetsDefend with the same last name as someone who works for Google, LetsDefend tells the employee that they have issued the invoice and they need to pay to their XXX account. It inserts the real Google employee's email address in the "Reply-To" field so that the fake email address will not stand out when the email is replied to.

Going back to the email we downloaded above, all we need to do is compare the email addresses in the 'From' and 'Reply-to' sections.

As you can see, the data is different. In other words, if we want to reply to this email, we will send a reply to the gmail address below. 
Please note that just because this data is different doesn't always mean that it's definitely a phishing email, we need to look at the event as a whole. In other words, in addition to this suspicious situation, if there's a malicious attachment, URL, or misleading content in the content of the email, we can understand that it's a phishing email. 
In the next lesson, we will analyze the data in the body of the email.

## Static Analysis
Many people find plain text boring, which is why email programs offer HTML support, allowing you to create emails that are more likely to grab the user's attention. Of course, there is a downside to this feature. Attackers can use HTML to create emails that hide malicious URLs behind buttons or text that appear to be harmless.

As seen in the image above, the address the user sees when clicking on a link can be different (the real address is seen when the user hovers over the link).

In most phishing attacks, the attackers take a new domain address and complete a phishing attack within a few days. 
Therefore, if the domain name in the email is new, it is more likely to be a phishing attack.

By querying VirusTotal for web addresses in emails, you can find out if the antivirus engines detect the web address as harmful. 
If someone else has already analyzed the same address/file in VirusTotal, VirusTotal will not analyze it from scratch, it will show you the old analysis result. 
This feature can be considered both an advantage and a disadvantage.


If the attacker searches the domain address in VirusTotal when it does not contain malicious content, this address will appear to VirusTotal to be harmless. 
However, if you miss this tiny detail, you could be fooled into thinking that this address is harmless. In the image above you can see that the address umuttosun.com appears to be harmless, but if you look at the section marked with a red arrow you can see that this address was scanned 9 months ago and this result is 9 months old. To scan it again, click the blue arrow button.

If the site was previously scanned by VirusTotal, it could mean that the attacker wanted to see the detection rate of the site during the preparation phase. 
If we analyze it again, the antivirus engine will detect it as phishing, which means that the attacker tried to trick the analysts.

Performing a static analysis of the files in the email can provide insight into the capacity/capability of the file. 
However, since static analysis takes a long time, dynamic analysis can provide the information you need more quickly.

Cisco Talos Intelligence has search sections where we can learn the reputation of IP addresses. 
By looking up the SMTP address of the email we detected in Talos, we can see the reputation of the IP address and find out if it is on the blacklist. 
If the SMTP address is blacklisted, it can be assumed that the attack was carried out on a compromised server.

Similarly, the SMTP address can be searched on VirusTotal and AbuseIPDB to find out if the IP address has been involved in malicious activity in the past.

## Dynamic Analysis
URLs and files in an email need to be checked to make sure they are safe. 
You don't want your data to be stolen by hackers by running these files on your personal computer. For this reason, the websites and files in the mail should be run in sandbox environments and the changes made to the system should be examined to see if they are harmful or not.

You can use online web browsers such as Browserling to quickly check the web addresses in the email. 
The advantage of such services is that you are not burdened by a possible zero-day vulnerability that would impact browsers, as you are not visiting the website on your own computer. On the other hand, the disadvantage of using web browsers such as Browserling is that if the malicious file is downloaded from the website, you will not be able to run it. This could interrupt your analysis.

Before going to the links in the email, you should check if there is any important information in the URL.
If we examine the example in the image above, and the user's email address in the email parameter. So even if the user does not enter their password on the phishing page, when they click on popularshoppingsite[.]com and visit the website, the attacker will know that this user is valid. The attacker can increase the success rate of the attack by social engineering the valid users in later attacks. Therefore, it is important to change information such as email addresses before accessing websites.


Sandbox environments allow you to examine suspicious files and websites without the risk of infecting your computer with malware. 
Many sandbox services/products are available for both paid and free use. You can choose one or more of these services according to your needs.

Some commonly used sandboxes:

VMRay
JoeSandbox
AnyRun
Hybrid Analysis(Falcon Sandbox)

Malware can wait a certain amount of time without taking any action to make detection more difficult. 
You have to wait for the malware to take action before you decide that the file being scanned is not malicious.

Also, the fact that there are no URLs and files in the email does not mean that it is not malicious. 
The attacker may also send the malware as an image to avoid detection by the analysis tools.
