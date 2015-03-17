Description
===========

_[Hi, have a look at the blog post](http://devblog.springest.com/testing-big-infrastructure-changes-at-springest/)_

__From the makers of [Gor](https://github.com/buger/gor):__

> Gor is a simple http traffic replication tool written in Go. Its main goal is to replay traffic from production servers to staging and dev environments.
>
> Gor consists of 2 parts: listener and replay servers.
>
> The listener server catches http traffic from a given port in real-time and sends it to the replay server. The replay server forwards traffic to a given address.

![chart](https://github-camo.global.ssl.fastly.net/556d4aa5db32de9535d84d6c6c07f6564b43fc0b/687474703a2f2f692e696d6775722e636f6d2f396d716a32534b2e706e67)


Requirements
============

A Unix environment. Tested on Ubuntu, but any Linux, Unix, MacOS system should work.

