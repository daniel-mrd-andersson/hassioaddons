# Hass.io Addons

In this repository I am collecting addons that I have created for to enhanche my own hass.io installation, all is built to be generic and work on other installations also, althou this is not tested and I have limited possibilites to give any support for my addons to others.

Installation either by pointing out this repository or copy the directories to your local "addon" folder on your device.

## conbee

Enables the deCONZ webb-interface to communicate with zigbee devices using the conbee USB stick, has only been tested with IKEA Trådfri lightbulb.
**Known issues:**
 - Firmware of USB stick does not work
 - Auto update of deCONZ does not work
 - Reset of USB stick does not work (still seems to work ok to communicate with devices)
 - You need to manually update config.json devices row to point out your conbee device (use ssh-addon and run *"hassio host hardware"* to list devices)
 - Limited testing has been performed, use at own risk.
