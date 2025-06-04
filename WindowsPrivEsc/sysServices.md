## Task Manager

- Type - Each process falls into 1 of 3 categories (Apps, Background process, or Windows process).
- Publisher - Think of this column as the name of the author of the program/file.
- PID - This is known as the process identifier number. Windows assigns a unique process identifier each time a program starts. If the same program has multiple running processes, each will have its unique process identifier (PID).
- Process name - This is the file name of the process. In the above image, the file name for Task Manager is Taskmrg.exe. 
- Command line - The full command used to launch the process. 
- CPU - The amount of CPU (processing power) the process uses.
- Memory - The amount of physical working memory utilized by the process. 
- Task Manager is a utility you should be comfortable using, whether you're troubleshooting or performing analysis on the endpoint. 

Let's move to the Details tab. This view provides some core processes that will be discussed in this room. 
Sort the PID column so that the PIDs are in ascending order.

#### Task Manager doesn't show a Parent-Child process view. That is where other utilities, such as Process Hacker and Process Explorer, come to the rescue.

Important Docs:

- [Service Control Manager](https://en.wikipedia.org/wiki/Service_Control_Manager)
- [Session Manager Subsystem](https://en.wikipedia.org/wiki/Session_Manager_Subsystem)
- [NT Architecture](https://en.wikipedia.org/wiki/Architecture_of_Windows_NT)
- [User vs Kernel Mode](https://learn.microsoft.com/en-us/windows-hardware/drivers/gettingstarted/user-mode-and-kernel-mode)

