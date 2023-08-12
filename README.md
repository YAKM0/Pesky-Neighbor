# Pesky-Neighbor Deauthentication Tool

## Description

The Pesky-Neighbor Deauthentication Tool is a Bash script designed for educational purposes to perform deauthentication attacks on Wi-Fi networks. This script utilizes various tools to deauthenticate clients from a specified access point, disrupting their network connections temporarily.

## Disclaimer

This script is intended for educational and learning purposes only. Unauthorized use of this script for malicious activities is illegal and unethical. The author does not condone or support any illegal or malicious actions.

## Usage

1. Clone or download the repository to your local machine.

2. Open a terminal window and navigate to the directory containing the script.

3. Run the script using the Bash interpreter: ./pesky-neighbor.sh
4. Follow the on-screen prompts to select the target Wi-Fi network and interface.

5. The script will initiate a deauthentication attack on the chosen network. After the attack, it will return your interface to managed mode.

6. **Remember**: Use this tool responsibly and only on networks you have explicit permission to test.

## Prerequisites
- Linux-based operating system
- Basic knowledge of Wi-Fi networks and Bash scripting

## Script Flow
1. Display a banner with information about the script's purpose and disclaimer.
2. Wait for 5 seconds and clear the terminal screen.
3. List available Wi-Fi networks with their details using nmcli and save the information to a file.
4. Prompt the user to choose a Wi-Fi network for the deauthentication attack.
5. Confirm the selected network and prompt for the Wi-Fi interface to put into monitor mode.
6. Enable monitor mode using airmon-ng.
7. Start monitoring the chosen network and channel using airodump-ng.
8. Initiate a deauthentication attack on the selected network using aireplay-ng.
9. Stop the deauthentication attack and return the interface to managed mode.
10. Clean up temporary files.
## Disclaimer
This script is provided as-is for educational purposes. The author is not responsible for any misuse, damage, or legal consequences resulting from the use of this script. Use this tool responsibly and only in compliance with applicable laws and regulations.

## License
This project is licensed under the [MIT License](LICENSE).
