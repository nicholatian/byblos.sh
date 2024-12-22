#!/bin/sh
#######################################################################
##                         xion.mt/byblos.sh                         ##
##                 Byblos v1 SDK installation script                 ##
##                                                                   ##
##               Copyright (C) 2024 Alexander Nicholi.               ##
##         Released under the Artisan Software Licence, v1.1         ##
##  Some rights reserved. See <https://asl.xion.mt/v1.1> for terms.  ##
#######################################################################

command -v stdbuf >/dev/null || {
	echo 'Please install coreutils before using this script.';
	echo 'Exiting...';
	exit 1;
};

echo='stdbuf -o0 /bin/echo';
echop="${echo} -n";
echod="${echo} done.";
echof="${echo} hold it!";

sudo='';

# use $EUID if available, otherwise get it POSIX-compatibly via id
uid="${EUID:-$(id -u)}";

if test "${uid}" != '0'; then
	command -v sudo >/dev/null || {
		${echo} 'Running this script as an unprivileged user requires';
		${echo} 'that sudo be installed and available in $PATH.';
		${echo} 'Exiting...';
		exit 1;
	};
	sudo='sudo';
fi

if ! test -d /opt/byblos; then
	${sudo} mkdir /opt/byblos;
	${sudo} mkdir /opt/byblos/conf;
	${sudo} mkdir /opt/byblos/include;
	${sudo} mkdir /opt/byblos/man;
	${sudo} mkdir /opt/byblos/sbin;
	${sudo} mkdir /opt/byblos/share;
	${sudo} mkdir /opt/byblos/slib;
	${sudo} mkdir /opt/byblos/system;
	${sudo} mkdir /opt/byblos/target;
	${sudo} mkdir /opt/byblos/target/windows;
	${sudo} mkdir /opt/byblos/target/windows/win16;
	${sudo} mkdir /opt/byblos/target/windows/win16/include;
	${sudo} mkdir /opt/byblos/target/windows/win16/lib;
	${sudo} mkdir /opt/byblos/target/windows/win16/libexec;
	${sudo} mkdir /opt/byblos/target/windows/win32;
	${sudo} mkdir /opt/byblos/target/windows/win32/include;
	${sudo} mkdir /opt/byblos/target/windows/win32/lib;
	${sudo} mkdir /opt/byblos/target/windows/win32/libexec;
	${sudo} mkdir /opt/byblos/target/windows/nt32;
	${sudo} mkdir /opt/byblos/target/windows/nt32/include;
	${sudo} mkdir /opt/byblos/target/windows/nt32/lib;
	${sudo} mkdir /opt/byblos/target/windows/nt32/libexec;
	${sudo} mkdir /opt/byblos/target/windows/nt64;
	${sudo} mkdir /opt/byblos/target/windows/nt64/include;
	${sudo} mkdir /opt/byblos/target/windows/nt64/lib;
	${sudo} mkdir /opt/byblos/target/windows/nt64/libexec;
	${sudo} mkdir /opt/byblos/target/windows/w10arm;
	${sudo} mkdir /opt/byblos/target/windows/w10arm/include;
	${sudo} mkdir /opt/byblos/target/windows/w10arm/lib;
	${sudo} mkdir /opt/byblos/target/windows/w10arm/libexec;
	${sudo} mkdir /opt/byblos/target/linux;
	${sudo} mkdir /opt/byblos/target/linux/gnu32;
	${sudo} mkdir /opt/byblos/target/linux/gnu32/include;
	${sudo} mkdir /opt/byblos/target/linux/gnu32/lib;
	${sudo} mkdir /opt/byblos/target/linux/gnu32/libexec;
	${sudo} mkdir /opt/byblos/target/linux/gnu64;
	${sudo} mkdir /opt/byblos/target/linux/gnu64/include;
	${sudo} mkdir /opt/byblos/target/linux/gnu64/lib;
	${sudo} mkdir /opt/byblos/target/linux/gnu64/libexec;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm32;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm32/include;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm32/lib;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm32/libexec;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm64;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm64/include;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm64/lib;
	${sudo} mkdir /opt/byblos/target/linux/gnuarm64/libexec;
	${sudo} mkdir /opt/byblos/target/linux/gnusparc9;
	${sudo} mkdir /opt/byblos/target/linux/gnusparc9/include;
	${sudo} mkdir /opt/byblos/target/linux/gnusparc9/lib;
	${sudo} mkdir /opt/byblos/target/linux/gnusparc9/libexec;
	${sudo} mkdir /opt/byblos/target/linux/musl32;
	${sudo} mkdir /opt/byblos/target/linux/musl32/include;
	${sudo} mkdir /opt/byblos/target/linux/musl32/lib;
	${sudo} mkdir /opt/byblos/target/linux/musl32/libexec;
	${sudo} mkdir /opt/byblos/target/linux/musl64;
	${sudo} mkdir /opt/byblos/target/linux/musl64/include;
	${sudo} mkdir /opt/byblos/target/linux/musl64/lib;
	${sudo} mkdir /opt/byblos/target/linux/musl64/libexec;
	${sudo} mkdir /opt/byblos/target/linux/muslarm32;
	${sudo} mkdir /opt/byblos/target/linux/muslarm32/include;
	${sudo} mkdir /opt/byblos/target/linux/muslarm32/lib;
	${sudo} mkdir /opt/byblos/target/linux/muslarm32/libexec;
	${sudo} mkdir /opt/byblos/target/linux/muslarm64;
	${sudo} mkdir /opt/byblos/target/linux/muslarm64/include;
	${sudo} mkdir /opt/byblos/target/linux/muslarm64/lib;
	${sudo} mkdir /opt/byblos/target/linux/muslarm64/libexec;
	${sudo} mkdir /opt/byblos/target/macos;
	${sudo} mkdir /opt/byblos/target/macos/intel64+arm64;
	${sudo} mkdir /opt/byblos/target/macos/intel64+arm64/include;
	${sudo} mkdir /opt/byblos/target/macos/intel64+arm64/lib;
	${sudo} mkdir /opt/byblos/target/macos/intel64+arm64/libexec;
	${sudo} mkdir /opt/byblos/target/android;
	${sudo} mkdir /opt/byblos/target/android/arm32;
	${sudo} mkdir /opt/byblos/target/android/arm32/include;
	${sudo} mkdir /opt/byblos/target/android/arm32/lib;
	${sudo} mkdir /opt/byblos/target/android/arm64;
	${sudo} mkdir /opt/byblos/target/android/arm64/include;
	${sudo} mkdir /opt/byblos/target/android/arm64/lib;
	${sudo} mkdir /opt/byblos/target/android/intel32;
	${sudo} mkdir /opt/byblos/target/android/intel32/include;
	${sudo} mkdir /opt/byblos/target/android/intel32/lib;
	${sudo} mkdir /opt/byblos/target/android/intel64;
	${sudo} mkdir /opt/byblos/target/android/intel64/include;
	${sudo} mkdir /opt/byblos/target/android/intel64/lib;
	${sudo} mkdir /opt/byblos/target/ios;
	${sudo} mkdir /opt/byblos/target/ios/arm32;
	${sudo} mkdir /opt/byblos/target/ios/arm32/include;
	${sudo} mkdir /opt/byblos/target/ios/arm32/lib;
	${sudo} mkdir /opt/byblos/target/ios/arm64;
	${sudo} mkdir /opt/byblos/target/ios/arm64/include;
	${sudo} mkdir /opt/byblos/target/ios/arm64/lib;
	${sudo} mkdir /opt/byblos/target/ninten;
	${sudo} mkdir /opt/byblos/target/ninten/agb;
	${sudo} mkdir /opt/byblos/target/ninten/agb/include;
	${sudo} mkdir /opt/byblos/target/ninten/agb/lib;
	${sudo} mkdir /opt/byblos/target/ninten/ntr;
	${sudo} mkdir /opt/byblos/target/ninten/ntr/include;
	${sudo} mkdir /opt/byblos/target/ninten/ntr/lib;
	${sudo} mkdir /opt/byblos/target/ninten/ctr;
	${sudo} mkdir /opt/byblos/target/ninten/ctr/include;
	${sudo} mkdir /opt/byblos/target/ninten/ctr/lib;
	${sudo} mkdir /opt/byblos/tools;
	${sudo} mkdir /opt/byblos/tools/apple86;
	${sudo} mkdir /opt/byblos/tools/applearm;
	${sudo} mkdir /opt/byblos/tools/gnu32;
	${sudo} mkdir /opt/byblos/tools/gnu64;
	${sudo} mkdir /opt/byblos/tools/gnuarm32;
	${sudo} mkdir /opt/byblos/tools/gnuarm64;
	${sudo} mkdir /opt/byblos/tools/mingwarm;
	${sudo} mkdir /opt/byblos/tools/musl32;
	${sudo} mkdir /opt/byblos/tools/musl64;
	${sudo} mkdir /opt/byblos/tools/muslarm32;
	${sudo} mkdir /opt/byblos/tools/muslarm64;
fi

${sudo} find /opt/byblos -type d -exec chmod 755 {} \;;

cwd="$(pwd)";
gnd0=/opt/byblos/system/staging;

test -d "${gnd0}" && ${sudo} rm -rf "${gnd0}";

${sudo} mkdir "${gnd0}";
${sudo} chown -R "${uid}:${uid}" "${gnd0}";
CDPATH= cd "${gnd0}";

# ...

CDPATH= cd "${cwd}";
