This is adapted from (https://www.losant.com/blog/getting-started-with-the-raspberry-pi-zero-w-without-a-monitor)


## Download:

RASPBIAN STRETCH LITE
https://www.raspberrypi.org/downloads/

ETCHER
https://etcher.io/


## Flash SD (This step requres admin access)
- Install Etcher
![alt text](http://url/to/img.png)

- Select Raspbian image you downloaded
![alt text](http://url/to/img.png)
- Select your SD Card 
![alt text](http://url/to/img.png)

- Flash



## Pull the SD Card completely out of your machine

## Reinsert the SD Card
![alt text](http://url/to/img.png)

Etcher automatically unmounts the SD card. And we need to edit some of the files that are on the SD card before we insert it into the Raspberry Pi.

Your SD Card should have these files and look like this

![alt text](http://url/to/img.png)



## ENABLE SSH

We need to create a file called __ssh__ on the SD Card. This file should not have an extension and should live at the root of the directory. 
![alt text](http://url/to/img.png)


## SSH INTO THE PI ZERO W