---
layout: post
title: "Hosting a web site (for free) with S3, CloudFront, and Cloudflare"
date: 2020-12-19 020:30:31 -0500
categories: web site amazon s3 cloudfront cloudflare
duration: "3 minutes"
---

I host a handful of web sites for free using Amazon S3, CloudFront, and Cloudflare. Here's how:

### Architecture

```
+-----------+    +------------+    +------------+
|           |    |            |    |            |
| S3 Static |    | CloudFront |    | Cloudflare |
| Website   |<---| CDN        |<---| DNS        |<---Inbound
|           |    |            |    |            |
+-----------+    +------------+    +------------+
```

### Cloudflare

Add your domain to Cloudflare. You can follow their instructions for setting up nameservers wherever you purchased your domain.

### S3 Static web site

Create a bucket on S3. I like to use the fully-qualified domain name as the bucket name. This will hold the distributable files for the web site and provide some basic hosting.

Using **ACL control**, grant _Everyone (public access)_ _Objects: List_ and _Bucket ACL: Read_.

In **Properties**, enable _Static web site Hosting_. Set _Index_ and _Error Document_ to `index.html`.

### Certificate Manager

Request a certificate for your domain name(s). Make sure you include additional names for any subdomains you need.

You'll need to verify ownership by adding some CNAMEs to Cloudflare.

### CloudFront Distribution

Create a CloudFront Distribution. This will accept the CNAME(s) for your custom domain.

Change the **Price Class** to _Use Only U.S., Canada and Europe_ if that's all you need.

Add any **Alternate Domain Names (CNAMEs)** that will be used to access your site (like `www.` prefix).

Choose **SSL Certificate** _Custom SSL Certificate (example.com)_. Choose the certificate you created in **Certificate Manager**.

Set **Default Root Object** to `index.html`.

### Cloudflare

In the **DNS** tab, set up your site's DNS. Add a **CNAME** from your domain name to the CloudFront distribution URL. Don't forget to add any other CNAMEs, like `www`.

In the **SSL/TLS** tab, pick the mode _Full_.

Under the **Edge Certificates** subtab, toggle _Always Use HTTPS_ to _On_.

### Wait ⏳

It might take 24 hours for your site to become available, but after that your site should be live, and it should never exceed the free tier on AWS.
