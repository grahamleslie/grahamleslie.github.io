---
layout: post
title: "Delightful HomeKit with Homebridge"
date: 2023-09-26 20:07:23 -0500
categories: home server docker homekit homebridge vesync nest hue
duration: "5 minutes"
---

Over the last few months, I've gotten the sense that my Amazon Echo Dots throughout the house were degrading in recognition quality. Maybe Amazon is moving to on-device or lower-cost language processing models. Either way, I was tired of asking Alexa to "turn on the backyard lights" for the dog to go outside and instead durning on the bedroom lights, blinding me in the middle of the night. I decided to give HomeKit a try.

Problem is, many of my devices are not HomeKit-compatible. I have VeSync smart plugs for lots of devices, a Nest home thermostat, Ring cameras, and Philips Hue lights. I filled up my shopping cart with HomeKit-compatible devices and was about to check out when it occured to me--I should check if there is a hacky, pain in the butt way to get these devices into HomeKit. Enter [Homebridge](https://homebridge.io/).

Homebridge is a Node.js server that runs on your local network and acts as a bridge between non-HomeKit devices and HomeKit. It has a huge community of plugins that add support for a wide variety of devices. It seems to have originally been created as a stop-gap while manufacturers added HomeKit support to their devices, but it seems its evolved to "bridge" the gap for manufacturers who aren't going to add HomeKit support to their devices (I presume Apple charges some licensing fee)--a great solution to the problem of otherwising needing to trash a whole home's worth of automation to buy new devices that cost 10% more due to the HomeLit label stickered on the box. It's a great way to get started with HomeKit without having to buy all new devices. I thought this might be my answer, but I was certainly geared up to spend days debugging, editing JSON configuration files, and reading StackOverflow posts.

Instead, to my surprise, Homebridge was a breeze to set up. I installed it on my home server using Docker following [their own instructions](https://github.com/homebridge/homebridge/wiki/Install-Homebridge-on-Docker). It spun up immediately and guided me through adding plugins for each of my home automation devices. Some were as simple as entering username and password, others required a bit of Javascript Inspector hacking to capture OAuth credentials, but none were too difficult. Within a few minutes, all of my devices were added as "bridges". Each bridge displays a QR code that can be scanned with Apple Home app, and then those devices are available for control.

A few days after setup, everything is running smoothly--I can see my cameras, control my thermostat, turn on and off my smart plugs, toggle my lights, and have recreated all my automations in HomeKit. The Apple Home interface is significantly more user-friendly than Alexa. Homebridge really surprised me--a delightful setup, easy UI, minimal hacking--a much better user experience than I ever would have expected from an open source product. I'd highly recommend it for getting a home into the HomeKit ecosystem without needing to wastefully buy all new devices.
