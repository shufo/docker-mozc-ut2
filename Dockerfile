FROM ubuntu:xenial AS builder

ENV MOZC_VERSION 2.18.2598.102
ENV UT2_VERSION 20171008d
ENV UT2_CURRENT 20181028

WORKDIR /app

RUN apt-get update && apt-get install -y wget clang libdbus-1-dev libglib2.0-dev libgtk2.0-dev subversion tegaki-zinnia-japanese debhelper libibus-1.0-dev build-essential libssl-dev libxcb-xfixes0-dev python-dev gyp protobuf-compiler libqt4-dev libuim-dev libzinnia-dev fcitx-libs-dev devscripts ninja-build
RUN apt-get install -y desktop-file-utils
RUN wget --trust-server-names "https://ja.osdn.net/frs/chamber_redir.php?m=iij&f=%2Fusers%2F22%2F22940%2Fmozc-${MOZC_VERSION}%2Bdfsg-1%7Eut2-${UT2_VERSION}%2B${UT2_CURRENT}.tgz"
RUN tar xavf ./mozc-* && cd mozc-*/ && ./build_mozc_plus_utdict

FROM ubuntu:xenial

ENV DIR /app
WORKDIR $DIR

COPY --from=builder $DIR/mozc-*/*.deb ./
