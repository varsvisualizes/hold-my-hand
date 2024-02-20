# bless you - holdme

![IMG_5526](https://github.com/varsvisualizes/hold-my-hand/assets/47091936/5e3d159d-2a81-4139-971e-8456e8b9c396)

A physical computing project made for the library art show on February 14th, 2024, exhibited at the Hagen Ranch Road library. 

The name was inspired by a pack of tissues my friend brought me after a trip to Vietnam.

![inspo](https://github.com/varsvisualizes/hold-my-hand/assets/47091936/f0976153-a6d3-496f-90d3-5a456a3a42a3)

# Software & Hardware
## Raspberry Pi 3
I wanted to try using a Raspberry Pi for this project, so I booted up Raspbian with Processing included, then downloaded the Arduino 1.8.19 IDE ARM 32 bits. I used [this tutorial](https://www.youtube.com/watch?v=xWCwJXz4B4I).
## Arduino Uno
I knew I wanted to have capacitive touch and LCD capability. While I could get the LCD attached the Raspberry Pi, I know for sure how to achieve this with Arduino. I'm also experienced with Arduino's Capacitive Sense library, which would come in handy (pun intended) when connecting to the copper wire hands.

# Materials
* Copper wire, formed to look like hands
* Jumper cables
* Alligator clips
* Raspberry Pi 3 + power supply
* Arduino Uno
* 2 breadboards
* Monitor, keyboard, and mouse for modifying the code on the Pi

# Outcome
To add a little visual interest, I made it appear as though a copper wire hand were emerging from a cardboard box, offering itself to the viewer.

I had planned to have the LCD screen inside the box, inviting the viewer to peek inside. After a few of the first exhibition visitors were unable to come to the conclusion to look inside the box, I simply placed the LCD right on top in their line of sight - the exposed wiring seemed to pique more interest, anyway.

The project is simple: The LCD screen prompts its reader, "hold my hand?"

![IMG_5527](https://github.com/varsvisualizes/hold-my-hand/assets/47091936/85d74fff-34a7-456a-9ecc-eaa735fe05b9)

If the user accepts the plea, they can connect their hand with the metal hand protruding from the box. Often I would see participants interlace their fingers with the metal hand.

![IMG_5530](https://github.com/varsvisualizes/hold-my-hand/assets/47091936/ad2d0349-15c0-4bb4-9a91-3264a2dd049c)

The LCD screen would display its blessings and gratitude, and the text would scroll towards the left before bouncing back towards the right. This would repeat until the participant has released the metal hand.

![IMG_5530](https://github.com/varsvisualizes/hold-my-hand/assets/47091936/bb2b5a11-fc87-424f-b461-ca4b46b516d1)

# Todo

I have a partner piece made for this project, using Processing on my laptop and a second Arduino Uno. I will update this page to include that demo as well.

In the future, I would like to have the two parts synced up: If you hold the metal hand on one piece, then the other piece will respond, and vice versa. A different interaction would unfold if both pieces are held together. I have the idea to achieve this with MQTT, I simply have to keep digging to get it really going.
