TEMPLATE = app
CONFIG += console
CONFIG += file_copies
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += /opt/codex/rm11x/3.1.68/sysroots/x86_64-codexsdk-linux/usr/lib/arm-remarkable-linux-gnueabi/gcc/arm-remarkable-linux-gnueabi/9.3.0/include

HEADERS += screenlocations.h

SOURCES += main.c

DISTFILES += \
        LamyEraser.service \
        RemarkableLamyEraser

service.files = LamyEraser.service
service.path = /usr/systemd/system

target.path = /usr/sbin

INSTALLS += \
        target \
        service
