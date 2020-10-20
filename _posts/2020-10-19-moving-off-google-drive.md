---
layout: post
title: "Moving to NextCloud from Google Drive"
date: 2020-10-19 019:40:29 -0500
categories: docker home homelab nextcloud google drive privacy
duration: "5 minutes"
---

I've toyed around with moving away from Google Drive for a few years now, honestly from less of a die-hard-privacy-proponent-point-of-view but more because I thought it would be interesting to try to replace it with something self-managed.

I found [NextCloud](http://nextcloud.com/) about a year ago and spun up an instance on my local server. I used it primarily to host raw GoPro footage from hikes, off-roading trips, and vacations, but I figured it might be time to take the leap to try it out as a full replacement. If I don't like it, I figure I can always move all the files back to Google Drive whenever I want to.

The NextCloud instance is running in Docker in my local server. It's accessible on my local network, which I can VPN into to remotely access my files. haproxy and dnsmasq containers handle DNS and a custom local network domain for the NextCloud container. I've [detailed the set up of my local Docker host in another post](http://localhost:4000/docker/home/vpn/homelab/2020/05/03/setting-up-a-home-vpn-on-docker.html). The host has a 2TB Raid array that the NextCloud container binds for storage.

![The new cabinet](/assets/images/posts/new-cabinet.jpg)

_I recently put together a new server/networking cabinet. I found the IKEA Besta cabinet locally and put it on top of [these hairpin legs from Amazon](https://amzn.to/3jcVPgQ)._

> <small>FYI: If you buy something through an Amazon link, I may earn a commission.</small>

With NextCloud configured, I figured I'd just download all my files from Google Drive and upload them through the NextCloud web interface. This was terrible. Chrome kept running out of memory. I suppose NextCloud just isn't optimized for uploading a couple gigs through the web interface. Instead, I downloaded the [desktop app](https://nextcloud.com/install/#) and uploaded my files through that. It took a while but worked flawlessly.

Once my files were good to go, I set up an S3 bucket to use as a remote backup, then installed rclone on my host. I set up a simple cron job to `sync` the entire NextCloud binded directory to S3 nightly with:

`rclone sync /path/to/nextcloud/bind/ rclone_remote:bucket_name`

With backups in place, I installed the client apps on my devices and have been pleasntly surprised with the experience. I use Apple devices so I'm trying out Pages and the other Apple office apps; it's a convenient departure from Google Docs which I've used for a good decade now, and I was excited to see with NextCloud installed on iOS, my server showed up as a source for opening files from within iOS Pages. That was a much easier workflow than I expected.

All in all it seems pretty nice and I'll try this out for the long run. If I really like it, I'll try migrating my photos from Google Photos as well; I noticed NextCloud has a photo backup feature for iOS but I haven't tried it out yet.

Props to NextCloud. This is a really nice free product.
