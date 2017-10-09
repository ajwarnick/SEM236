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
![alt text](http://url/to/img.png)

Etcher automatically unmounts the SD card. And we need to edit some of the files that are on the SD card before we insert it into the Raspberry Pi.  

Your SD Card should have these files and look like this

![alt text](http://url/to/img.png)



## ENABLE SSH

We need to create a file called __ssh__ on the SD Card. This file should not have an extension and should live at the root of the directory. 
![alt text](http://url/to/img.png)

#### Edit boot/config.txt
Next, append 
```
dtoverlay=dwc2 
```
to the end of the /Volumes/boot/config.txt file on a new line. 

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
 Now, after the Pi turns on, we will __ssh__ into it. 
### launch Terminal 
### Test to see if your pi is connected and ready
```bash
ping raspberrypi.local
```






```
Are you sure you want to continue connecting (yes/no)? yes
```

