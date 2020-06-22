---
layout: post
title: "Building an Arcade Emulator"
date: 2020-06-21 7:08:12 -0500
categories: arcade emulator retropi
duration: "4 minutes"
---

A coworker at a previous job built an arcade emulator. He used a CNC machine to cut the cabinet, then dropped in an old monitor for display, a Raspberry Pi for emulation, and a set of joysticks and buttons he'd found on Amazon. It was a pretty neat setup that inspired me to put mine together.

Instead of the old-school arcade cabinet feel, I decided to build something a little more modern, so I threw together a compact cabinet with scrap wood, I setup an Intel NUC with emulators for the consoles I grew up with, and plugged in a pair of SNES-style controllers. It's a fun setup for playing old games from SEGA Genesis, N64, GameCube, etc.

You can use whatever you want as the box to run the emulators; a Raspberry Pi works fine for arcade emulators, but you'll need something more powerful for more recent console emulators.

![The arcade cabinet in use.](/assets/images/posts/arcade-cabinet.jpg)

(I cleaned up the fit after taking these photos, FYI).

BOM (~\$50 if you have the computer/Pi and building materials lying around):

- <a href="https://amzn.to/310QX9e" target="_blank">Intel NUC (just an example, specs are up to you depending on the emulators you run)</a>.
- Some scrap wood for building the cabinet. I used all cheap 1" common board.
- Stain or paint for the cabinet.
- Wood glue, screws/nails for the cabinet.
- <a href="https://amzn.to/3dppOiG" target="_blank">Controllers (~\$14)</a>.
- <a href="https://amzn.to/2YThenj" target="_blank">USB Extension Cords (~\$12)</a> (for some extra controller distance).
- <a href="https://amzn.to/3fLkjwt" target="_blank">LED Strip (~\$16)</a> (obviously really important).
- Slim PC speakers to hide in the cabinet for audio (I used some 2000s passive speakers we probably all have in a box somewhere).
- An old monitor. It would have been super cool to use a CRT monitor, but I had a LCD monitor lying around.

> <small>FYI: If you buy something through an Amazon link, I may earn a commission.</small>

First, build the cabinet around your monitor. I built a small shelf for it to sit on, and secured it with another shelf that will hold the NUC. I also used some caulking around the monitor to make sure no light shines through. I also left a gap at the bottom for storing the controllers.

![The arcade cabinet with the monitor shelf.](/assets/images/posts/arcade-cabinet-shelf.jpg)

Here's a view from the front with the monitor installed.

![The arcade cabinet with the monitor installed.](/assets/images/posts/arcade-cabinet-front.jpg)

Next, I stuffed in all the electronics (and adhered the LED light strip, of course). I also added a WiFi Plug so I can power it on and off through voice commands or my phone.

![The arcade cabinet with all the electronics.](/assets/images/posts/arcade-cabinet-stuffed.jpg)

Once the electronics were done, I installed Ubuntu and setup [automatic log in](https://www.maketecheasier.com/enable-automatic-login-in-ubuntu/) so I could eventually have Ubuntu boot and launch the software automatically after being powered on.

Next, I used the [RetroPi Ubuntu docs](https://retropie.org.uk/docs/Debian/) to setup the software. Ubuntu picked up the controllers automatically, so I only had to run through some simple controller button mapping steps guided by RetroPi to get them working. I wrapped up the software setup by turning on auto-start in the configuration options.

Lastly, I setup some additional emulators and acquired some games. That's it!

<div style="text-align: center">
    <img alt="The arcade cabinet in use!" src="/assets/images/posts/arcade-cabinet-animated.gif" />
</div>
