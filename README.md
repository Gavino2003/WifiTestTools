\# WifiTestTool

\_\_\_\_ \_\_ \_\_\_\_ \_\_ \_\_\_\_\_\_\_ \_\_ .\_\_\_\_\_\_\_\_\_\_\_. \_\_\_\_\_\_ \_\_\_\_\_\_ \_\_ \_\_\_\_\_\_\_.

\\ \\ / \\ / / | | | \_\_\_\_|| | | | / \_\_ \\ / \_\_ \\ | | / |

\\ \\/ \\/ / | | | |\_\_ | | \`---| |----\`| | | | | | | | | | | (----\`

\\ / | | | \_\_| | | | | | | | | | | | | | | \\ \\

\\ /\\ / | | | | | | | | | \`--' | | \`--' | | \`----.----) |

\\\_\_/ \\\_\_/ |\_\_| |\_\_| |\_\_| |\_\_| \\\_\_\_\_\_\_/ \\\_\_\_\_\_\_/ |\_\_\_\_\_\_\_|\_\_\_\_\_\_\_/

Developed by Vasco Gavino

\---

\## Legal Notice / Disclaimer

\*\*WifiTestTool\*\* is intended strictly for educational purposes and testing on networks you own or have explicit permission to test.

Unauthorized use of this tool against networks or devices without consent is illegal and unethical.

\*\*The author and contributors assume no responsibility or liability for any misuse of this software.\*\*

By using this tool, you agree that you are solely responsible for your actions.

\---

\## Overview

\*\*WifiTestTool\*\* is a Bash script designed to automate parts of the Wi-Fi WPA2 handshake capture and cracking process, leveraging the \`aircrack-ng\` suite.

This tool was developed primarily with Arch Linux users in mind but may work on other Linux distributions with minimal adjustments.

Community contributions for compatibility improvements and feature enhancements are highly encouraged.

\---

\## Dependencies

\- \`aircrack-ng\` package must be installed.

The script attempts to install \`aircrack-ng\` automatically via \`yay\`.

If this fails, please install manually using your package manager, for example:

\`\`\`bash

sudo pacman -S aircrack-ng

Installation and Usage

Clone the repository or download the script.

Make the script executable:

chmod +x wifitesttool.sh

Open a terminal in the same directory as the script.

Run the script without root privileges:

./wifitesttool.sh

Usage Instructions

The script will prompt you to enter your Wi-Fi interface name (e.g., wlan0).

It will enable monitor mode on the interface and guide you step-by-step through capturing handshakes and attempting to crack them.

Follow all prompts carefully.

The tool requires manual input for certain steps such as selecting target BSSID, channel, and station MAC address.

Troubleshooting

If your Wi-Fi interface becomes unresponsive or inactive after running the tool, you can restore it by running:

sudo airmon-ng stop wlan0mon

sudo systemctl restart NetworkManager

Replace wlan0mon with your actual interface name appended with mon.

Contributing

Contributions, bug reports, and feature requests are welcome.

Please open an issue or submit a pull request to help improve WifiTestTool.

License and Responsibility

This tool is provided "as-is" without any warranties. Use responsibly and legally.

Do not use against unauthorized networks.

Developed and maintained by Vasco Gavino.
