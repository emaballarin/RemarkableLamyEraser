# RemarkableLamyEraser
Standalone tool that turns the button on the Lamy Pen into an eraser on the reMarkable.

Also confirmed to work with these other styli:
 * Samsung S6 S Pen
 * Wacom One Pen CP91300B2Z

The tool will definitely break when the reMarkable updates. When that happens, just reinstall!
# Install Instructions
```shell
cd; wget https://github.com/emaballarin/RemarkableLamyEraser/raw/v1/LamyInstall.sh; chmod +x LamyInstall.sh; ./LamyInstall.sh; rm ~/LamyInstall.sh;
```
# Uninstall Instrucions
```shell
cd; wget https://github.com/emaballarin/RemarkableLamyEraser/raw/v1/LamyUninstall.sh; chmod +x LamyUninstall.sh; ./LamyUninstall.sh; rm ~/LamyUninstall.sh;
```


# Usage 
Press and hold to erase, release to use as a normal pen. Double click the button to undo. Note that at the moment, double pressing to undo only works for portrait orientation documents.

Further customization can be done by adding arguments to ExecStart line of the LamyEraser.service file. This can be opened with `nano /lib/systemd/system/LamyEraser.service`.
The supported arguments are:  
`--press`   Press and hold to erase, release to use as a normal pen. *This is the default behavior.*  
`--toggle`  Press the button to erase, press the button again to swtich back to a normal pen.  
`--double-press undo` Double click the button to undo. *This is the default behavior.*  
`--double-press redo` Double click the button to redo.  
`--left-handed` Use this option if you are using left handed mode.  
For example, this line would use the toggle mode and redo on a double click:  
`ExecStart=RemarkableLamyEraser --toggle --double-press redo`

To apply your config, run these commands:
``` Shell
systemctl stop LamyEraser.service
systemctl daemon-reload
systemctl start LamyEraser.service
```


# How it works
When you press the button on the Lamy Pen, an input event with code BTN_TOOL_RUBBER is sent into dev/input/event1. Essentially, this tricks the reMarkable into
thinking you are using the eraser side of the Marker Plus.
