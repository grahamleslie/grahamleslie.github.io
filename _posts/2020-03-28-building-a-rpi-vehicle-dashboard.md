---
layout: post
title: "Building a Raspberry Pi Speedometer"
date: 2020-03-28 18:08:17 -0500
categories: rpi raspberry pi dashboard
duration: "2 minutes"
---

Back in April of last year, the speedometer failed in my '94 Explorer.

Rather than fix the speedometer, I opted to build a new one using a Raspberry Pi.

BOM (~\$100):

- <a href="https://www.amazon.com/Raspberry-Model-2019-Quad-Bluetooth/dp/B07TD42S27/ref=as_li_ss_tl?dchild=1&keywords=raspberry+pi+4&qid=1585438679&s=electronics&sr=1-4&linkCode=ll1&tag=gleslie03-20&linkId=d2cc7b417708136255d9c38f844f2b14&language=en_US" target="_blank">Raspberry Pi 4 (~\$40)</a>
- <a href="https://www.amazon.com/Raspberry-Case-Black-Compatible-Model/dp/B00UW2G1BS/ref=as_li_ss_tl?dchild=1&keywords=canakit+case&qid=1585438808&s=electronics&sr=1-16&linkCode=ll1&tag=gleslie03-20&linkId=04f8577824301215a9bba0063a1235df&language=en_US" target="_blank">Plastic Case (~\$7)</a>
- <a href="https://www.amazon.com/gp/product/B076M399XX/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B076M399XX&linkCode=as2&tag=gleslie03-20&linkId=a0bc8d146110d760528d3c8bcc1cb310" target="_blank">Raspberry Pi 3.5" LCD Display (~\$30)</a>
- <a href="https://www.amazon.com/gp/product/B078Y52FGQ/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B078Y52FGQ&linkCode=as2&tag=gleslie03-20&linkId=72bfaf0f8b4ef6e9115a8395475b5c99" target="_blank">Raspberry Pi-compatible GPS Receiver (~\$20)</a>

> <small>FYI: If you buy something through an Amazon link, I may earn a commission.</small>

I discarded the top of the Raspberry Pi case, and I used a dremel tool to cut out room for the HDMI bridge that connects the LCD display to the Pi.

I set up Raspbian using NOOBS, installed [Navit](https://www.navit-project.org/), and hooked up my hardware. At this point, I had a functioning speedometer and GPS display.

![Raspberry Pi running Navit](/assets/images/posts/pi-nav.jpg)

Next, I set up automatic login and configured Navit to launch at boot.

I used command strips to adhere the box to my dashboard (while being easy to remove), ran the magnetic GPS receiver to the underside of the roof, and ran power from a cigarette-lighter adapter. I conveniently already had a power source off the ignition switch, so the Raspberry Pi only gets power when the car is turned on. If you wire yours to an always-on power source, I suggest some kind of inline switch to make sure you don't cause a parasitic leak.

![Raspberry Pi in Use](/assets/images/posts/pi-nav-installed.jpg)

We're in business! After this photo, I customized Navit to make the MPH value much larger and more readable using [Navit's customization settings](https://wiki.navit-project.org/index.php/Configuration).

![The Explorer](/assets/images/posts/explorer.jpeg)

The Raspberry Pi has served as good replacement for the speedometer, and honestly was probably faster than replacing the speedometer cable that went bad in the first place. GPS is usually acquired within 15-30 seconds of starting (much faster than the <a href="https://www.amazon.com/LeaningTech-Universal-Speedometer-Overspeed-Windshield/dp/B01LJCA1B0/ref=as_li_ss_tl?dchild=1&keywords=electronic+speedometer&qid=1585438935&sr=8-24&linkCode=ll1&tag=gleslie03-20&linkId=8082d20ee3544eb47ef53da4f035cb35&language=en_US" target="_blank">cheap electronic speedometers</a> I tested first).

Is it sexy? Not really. I don't care - I got it working in an afternoon.
