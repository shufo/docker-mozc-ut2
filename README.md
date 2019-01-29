# Mozc UT2 built with docker

This repository contains a script for build [Mozc UT2](http://www.geocities.jp/ep3797/mozc-ut2.html) by docker.

## Usage

`docker` is required to pull the image

```bash
$ docker run -d --name mozc-ut2 shufo/mozc-ut2:bionic
$ docker cp mozc-ut2:/app/ ./deb/
$ docker rm mozc-ut2
$ cd deb

# If you are using fcitx-mozc
$ sudo dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./ibus-mozc_*.deb ./fcitx-mozc_*.deb

# Or using ibus-mozc
$ sudo dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./ibus-mozc_*.deb
```

Then restart your computer will reflect settings

Also you can use these tags as ubuntu version

- `bionic`, `18.04`, `latest`
- `xenial`, `16.04`

### Manual Build

You can build mozc ut2 by your own machine

```
$ make 
```
