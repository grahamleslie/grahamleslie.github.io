---
layout: post
title: "Building a Simple Rackmount Home Server with Docker Compose"
date: 2023-07-09 17:05:00 -0500
categories: home server docker ubuntu
duration: "5 minutes"
---

Not long ago, my [home server I set up in 2020](https://gleslie.com/docker/home/vpn/homelab/2020/05/03/setting-up-a-home-vpn-on-docker.html) died. It was time to rebuild it, but (much) better. Here's what I did:

![The rackmount home server](/assets/images/posts/rack-mount-home-server.jpg)

## Hardware

I used the same hardware I had been using previously: an old Thinkstation S30 workstation. This time, I stripped it out of the factory case and reinstalled it in a [compact rackmount 3U server chassis](https://amzn.to/3pKIqWz). This setup has two [Seagate IronWolf 4TB NAS disks](https://amzn.to/44F2Cbt) set up with software RAID 1 for redundancy and an SSD for the operating system.

I wall mounted a [6U network rack](https://amzn.to/3PNcsUg) and slid the server in to occupy the bottom 3U.

The top 3U are occupied by a [Cyberpower 300W UPS](https://amzn.to/44tDvZa), a [patch panel](https://amzn.to/43cQBJb) with an unmanaged switch behind it, and [brush passthrough panel](https://amzn.to/3XHzZrI) to run ethernet through.

## Software

The home server runs Ubuntu Server. On it, I installed Docker. Then, I created a GitHub repository with a Docker Compose file. In that Docker Compose file, I set up a few containers (with their appropriate mounts):

- `kaive/docker-web-gui`: a simple GUI app for viewing Docker containers and logs
- `nextcloud`: my personal storage
- `caddy`: a simple reverse proxy for routing requests to containers
- `jpillora/dnsmasq`: a DNS server for my local network ()
- `hwdsl2/ipsec-vpn-server`: a VPN server for remote access
- `ghcr.io/akarys42/cloudflare-ddns-docker`: to update my Cloudflare DNS records when my IP changes
- `plex`: my home movie server

I also created a few networks to isolate containers. In particular, I networked the DNS container and VPN container together with static IPs to solve a big gotcha: the VPN container needs an environment variable `VPN_DNS_SRV1` set with the static _internal_ IP of the DNS container to resolve DNS requests in the home network.

I also added [a script to generate an adblock list](https://gist.github.com/OnlyInAmerica/75e200886e02e7562fa1) to the repo. I modified it to output to a file called `ads.hosts`.

I included a simple `dnsmasq.conf` to configure `dnsmasq` and mounted it to the `dnsmasq` container (along with the adblock list):

```dnsmasq
log-queries
no-resolv
server=1.1.1.1 # Use Cloudflare DNS.
server=1.0.0.1
strict-order
address=/home/192.168.86.2 # Route all requests ending in `.home` to my home server.
addn-hosts=/etc/ads.hosts # Include the adblock list.
```

To host a DNS server in Ubuntu Server, you need to modify `/etc/systemd/resolved.conf` to disable the default listener on port 53.

Last, I created a `Caddyfile` to configure `caddy`. It just has an entry for each domain (example: `plex.home`) and routes it to the correct port exposed by the container.

## Docker

I then cloned that repo to the server, created some `.env` files to include the secrets for each container, and ran the adblock list generator to create the file that will mount to `dnsmasq`. I can just run `docker-compose up -d` and everything starts up.

The last step was to set a static IP for the home server and forward the necessary ports for external access. A simple home server with a configuration in GitHub--easy to rebuild if something goes wrong.
