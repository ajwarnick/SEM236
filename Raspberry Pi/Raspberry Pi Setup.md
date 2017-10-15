This is adapted from (https://www.losant.com/blog/getting-started-with-the-raspberry-pi-zero-w-without-a-monitor)


## Download:

RASPBIAN STRETCH LITE  
https://www.raspberrypi.org/downloads/

ETCHER  
https://etcher.io/


## FLASH SD (This step requres admin access)
- Install Etcher  
![Install Etcher](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_1.png)

- Select Raspbian image you downloaded  
![Select Raspbian image you downloaded](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_2.png)

- Select your SD Card   
![Select your SD Card](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_3.png)

- Flash  



## PULL THE SD CARD COMPLETELY OUT OF YOUR MACHINE

## REINSERT THE SD CARD
![REINSERT THE SD CARD](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_4.png)  
Etcher automatically unmounts the SD card. And we need to edit some of the files that are on the SD card before we insert it into the Raspberry Pi.  

Your SD Card should have these files and look like this
![REINSERT THE SD CARD](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_5.png)



## ENABLE SSH

We need to create a file called __ssh__ on the SD Card. This file should not have an extension and should live at the root of the directory. 

#### Edit boot/config.txt
Next, append 
```
dtoverlay=dwc2 
```
to the end of the boot/config.txt file on a new line. 

#### Edit boot/cmdline.txt
Now you will need to edit cmdline.txt. Find `rootwait` and insert:
```
modules-load=dwc2,g_ether
```
Make sure you follow the same space-delimited pattern as the rest of the file.


## LAUNCH YOUR PI

- EJECT THE SD CARD
- INSERT THE SD CARD INTO THE RASPBERRY PI
- PLUG THE MICRO USB INTO THE RASPBERRY PI
- PLUG THE USB A INTO YOUR COMPUTER

This will power on the Raspberry Pi. Next you will need to wait the 2 minutes for the Pi to boot for the first time. We need to make sure it is fully booted before we continue to the next step. It is fully booted when the green light stays solidly illuminated.  


## SSH INTO THE PI ZERO W
 Now, after the Pi turns on, we will _ssh_ into it. 
### launch Terminal 
### Test to see if your pi is connected and ready
```bash
ping raspberrypi.local
```
If the result is like this:
```
PING raspberrypi.local (192.168.2.10): 56 data bytes
64 bytes from 192.168.2.10: icmp_seq=0 ttl=64 time=0.299 ms
64 bytes from 192.168.2.10: icmp_seq=1 ttl=64 time=0.425 ms
64 bytes from 192.168.2.10: icmp_seq=2 ttl=64 time=0.420 ms
64 bytes from 192.168.2.10: icmp_seq=3 ttl=64 time=0.390 ms
64 bytes from 192.168.2.10: icmp_seq=4 ttl=64 time=0.368 ms
```

Continue to the next step and type the command:

```
ssh pi@raspberrypi.local
```

![Are you sure you want to continue connecting](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_7.gif)


```
Are you sure you want to continue connecting (yes/no)? yes
```
The ssh password for user pi is `raspberry`.

Now you should be logged into the Raspberry Pi and we can start transferring files and running commands.


## INSTALLING Pi fm_transmitter

you will need to download __Pi fm_transmitter__:
https://github.com/somu1795/fm_transmitter





mkdir fm


scp -r /Users/warnick/Documents/Processing/TIME/Raspberry\ Pi/fm_transmitter-master pi@raspberrypi.local:fm/



## FIND A FREQUENCY 

We will need to talk within our class and divid up the available spectrum. But the resource that we will use to find the frequencies we can use is https://radio-locator.com/




# Week Two
![week two](https://media.giphy.com/media/10UeedrT5MIfPG/giphy.gif)


## Connecting to the Internet
First on your mac go to __System Preferances__ and go to __Network__. If you do not see RNDIS/Ethernet Gadget on the side bar you will need to add it.

This is done by clicking the + and selelecting selecting __RNDIS/Ethernet Gadget__ from the dropdown. And then click __Apply__.

Now go to __Sharing__ from the main __System Preferances__ screen.
![Sharing Preferance](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_8.png)
Now turn on the __Internet Sharing__ option.
![Internet Sharing](https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/img/ras_pi_demo_9.png)
When it ask if you want to __start__ click start.

Now you will need to __ssh__ into your raspberry pi, and run the following command:

```
sudo sh -c 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf'
```

## Test Internet Connection
The easiest way to test if the internet is working is to use `wget`. We will try to download this file with `wget`.
```
wget https://raw.githubusercontent.com/ajwarnick/SEM236/master/Raspberry%20Pi/Raspberry%20Pi%20Setup.md
```
If this works and completes without error you can contiune. (If it fails please email me.)

## Install sox
Now we need to install an audio playing software.
```
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install sox libsox-fmt-all
```
## Moving your file to the raspberry pi
Now you will need to ether download the .wav from the internet with `wget` or you will need to run this command:

#### Notice that you will need to copy the path to your file on your computer
```
scp  /path/to/your/file/test.wav pi@raspberrypi.local:fm/fm_transmitter-master/
```

## Now test broadcast set up
Run the following command, but make sure to replace the frequency with your frequency, and replace the file name with your file name. (note: please done use files with spaces in the names.)

```
sox fm/fm_transmitter-master/test.wav -r 22050 -c 1 -b 16 -t wav - | sudo ./fm/fm_transmitter-master/fm_transmitter -f 90.3 -
```

## Adding broadcast command to run on start up

