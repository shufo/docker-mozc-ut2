FROM ubuntu:bionic AS builder

ENV MOZC_VERSION 2.23.2815.102
ENV UT2_VERSION 20171008d
ENV UT2_CURRENT 20181028

WORKDIR /app

RUN apt-get update && apt-get install -y wget devscripts debhelper libibus-1.0-dev pkg-config libxcb-xfixes0-dev libgtk2.0-dev python-dev gyp protobuf-compiler libprotobuf-dev qtbase5-dev libqwt-qt5-dev libgwengui-qt5-dev libuim-dev libzinnia-dev fcitx-libs-dev gettext desktop-file-utils ninja-build
RUN wget --trust-server-names "https://ja.osdn.net/frs/chamber_redir.php?m=iij&f=%2Fusers%2F22%2F22942%2Fmozc-${MOZC_VERSION}%2Bdfsg%7Eut2-${UT2_VERSION}%2B${UT2_CURRENT}.tar.xz"
RUN tar xavf ./mozc-*
RUN cd mozc-*/ && ./build_mozc_plus_utdict

FROM ubuntu:bionic

ENV DIR /app
WORKDIR $DIR

COPY --from=builder $DIR/mozc-*/*.deb ./
