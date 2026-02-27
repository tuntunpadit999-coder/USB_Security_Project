# USB_Security_Project
🔐 𝗟𝗶𝗻𝘂𝘅-𝗕𝗮𝘀𝗲𝗱 𝗨𝗦𝗕 𝗦𝗲𝗰𝘂𝗿𝗶𝘁𝘆 𝗣𝗿𝗼𝘁𝗲𝗰𝘁𝗶𝗼𝗻 𝗦𝘆𝘀𝘁𝗲𝗺

As part of my Operating Systems learning, I built a USB Security Protection System in Linux to prevent unauthorized data copying through external storage devices.

💡 𝗣𝗿𝗼𝗯𝗹𝗲𝗺 𝗦𝘁𝗮𝘁𝗲𝗺𝗲𝗻𝘁
When we leave our laptop or PC unattended, anyone can insert a pendrive and copy important files. This creates a serious security risk.

🚀 𝗦𝗼𝗹𝘂𝘁𝗶𝗼𝗻

I developed a Linux-based monitoring system using shell scripting that:
 • Continuously monitors USB device insertion
 • Detects any external storage device in real time
 • Displays an immediate security alert
 • Disables all input devices (keyboard, mouse, touchpad)
 • Keeps the system locked until the USB device is removed
 • Automatically restores normal functionality once removed
 • Whenever I genuinely need to copy files, I can safely stop the monitoring process and restart it afterward.

🧠 𝗖𝗼𝗻𝗰𝗲𝗽𝘁𝘀 𝗔𝗽𝗽𝗹𝗶𝗲𝗱
 • Process management
 • Background execution
 • PID handling and signal termination
 • Device detection using lsblk
 • Input device control using xinput
 • Infinite loop monitoring & real-time security logic

This project helped me understand how Linux interacts with hardware devices and how system-level security can be implemented using shell scripting.
