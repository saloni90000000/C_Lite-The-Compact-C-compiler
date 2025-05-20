# C_Lite-:The Compact C compiler
# System Call Monitoring for Security

This is a security-focused project aimed at monitoring system calls and running processes in real-time on a Windows system. The goal is to detect and alert the user about suspicious or unauthorized activities and provide control to terminate such processes.

> *Note:* This project is currently *incomplete* and under development.

## Features

- Logs all running processes with timestamp and memory usage
- Detects suspicious processes like mimikatz.exe, keylogger.exe, etc.
- Provides alerts and option to terminate the suspicious process
- Parses Sysmon XML logs for deep event analysis
- GUI built using Python (Tkinter) for ease of use

## Technologies Used

- *C* (Process Monitoring using Windows API)
- *Python* (GUI and XML Parsing)
- *Tkinter* (Graphical User Interface)
- *Sysmon* (System Monitoring logs)
- *Windows API* (Process handling and logging)

## Current Components

- final_s.c: Logs active processes and detects suspicious activity
- gui_parser.py: Python GUI for selecting and parsing Sysmon logs; also allows manual process termination

## How to Run

1. Compile the C file using GCC:
   ```bash
   gcc -o process_monitor.exe final_s.c -lpsapi
