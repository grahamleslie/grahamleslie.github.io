---
layout: post
title: "Adding 2FA to Ubuntu 22.04.2 LTS"
date: 2023-06-19 020:00:00 -0500
categories: ubuntu 22 2fa mfa google authenticator ssh libpam-google-authenticator
duration: "2 minutes"
---

It's pretty easy to add 2FA authentication to Ubuntu 22.04.2 LTS. This guide will use `libpam-google-authenticator` to require 2FA when logging in. Make sure you save your backup codes when setting it up.

Here's how:

```bash
sudo apt update
sudo apt install libpam-google-authenticator
google-authenticator
# Now, follow the prompts to set up your 2FA. You can respond `yes` to all prompts.
sudo nano /etc/pam.d/common-auth
# Add this to the end of the file: `auth required pam_google_authenticator.so nullok`.
sudo nano /etc/ssh/sshd_config
# Change `KbdInteractiveAuthentication` to `yes`.
systemctl reload sshd
```

You're done! Try logging in again. You'll be prompted for your password and then your 2FA code.

Adapted from [this guide](https://www.digitalocean.com/community/tutorials/how-to-configure-multi-factor-authentication-on-ubuntu-18-04) and updated for Ubuntu 22.04.2 LTS.
