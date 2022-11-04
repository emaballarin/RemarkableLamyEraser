TEMPLATE = app
CONFIG += console
CONFIG += file_copies
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += \
    /opt/codex/rm11x/3.1.68/sysroots/x86_64-codexsdk-linux/usr/lib/arm-remarkable-linux-gnueabi/gcc/arm-remarkable-linux-gnueabi/9.3.0/include \
    headers/

HEADERS += \
    headers/configuration.h \
    headers/effects.h \
    headers/effects_data.h \
    headers/orientation.h \
    headers/triggers.h

SOURCES += \
    sources/configuration.c \
    sources/effects.c \
    sources/orientation.c \
    sources/triggers.c \
    sources/main.c


DISTFILES += \
    LamyEraser.conf \
    LamyInstall.sh \
    LamyUninstall.sh \
    LamyEraser.service \
    RemarkableLamyEraser

conf.files += \
    LamyEraser.conf

conf.path = /home/root/.config/LamyEraser

service.files = LamyEraser.service
service.path = /lib/systemd/system

target.path = /usr/sbin


INSTALLS += \
        target \
        service \
        conf
