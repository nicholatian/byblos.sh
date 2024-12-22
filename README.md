# `byblos.sh` installation script

_A one-liner script to download and install the Byblos SDK._

Licenced under the
[Artisan Software Licence, v1.1](https://asl.xion.mt/v1.1).

Artisan Software Licence, version 1.1.

Copyright &copy; 2024 Alexander Nicholi.  
Some rights reserved. See licence text either via the hyperlink above,
in the `COPYING` file of this repository, or embedded at the end of
this document for complete terms and conditions.

-----

## Usage

```sh
wget -O- -UwUget xion.mt/byblos.sh | sh
```

Alternatively:

```sh
curl -fsSL xion.mt/byblos.sh | sh
```

## What is Byblos?

Byblos is actually (eventually) two distinct software development kits.
Byblos 1 is an interim SDK using existing toolchains on GNU/Linux to
target many platforms including popular proprietary ones such as macOS
and Windows. Byblos 2 is a proper SDK in planning that will use the
new proto-_Anodyne_ tools such as Oraci&oacute;n, FCC, Sirius C\* and
more to target all of the same platforms and more.

Both versions of Byblos are evolutions of the proof-of-concept that
began with the [Slick Makefiles](https://github.com/aquefir/slick):
show that all meta-build scripts like CMake, SCons and IDEs like XCode
and Visual Studio are unnecessary to target a limitless matrix of
platforms by authoring a single plain GNU Makefile that does it all.

## Compatibility matrix

### Running the script

This script is POSIX-compatible and one may verify this by piping it to
`dash` instead of their default shell `sh`. `bash` and `zsh` should
therefore work just as well.

### Host platforms

This script configures and installs software to be run on a
`glibc`-based GNU/Linux distribution. It is not compatible with `musl`.
It is not compatible with any BSD. It is not compatible with macOS.
It is not compatible with any WSL interposer. It is not compatible with
any Android/Busybox platform.

### Host &micro;arches

This script configures and installs software for the following _host_
&micro;arches:
- x86-64 v1 (baseline)
- AArch64 ARMv8.0

### Target platforms &amp; &micro;arches

This script configures and installs software that can _target_ the
following platforms and &micro;arches:
- Microsoft Windows
	- ~~Windows 3.1 on i286 and later~~
	- Windows 95/98/Me on i386 and later
	- Windows NT 4.0+ on i386 and later
	- Windows NT 5.1+ on x86-64 v1 and later
	- Windows 10 for ARM64 (ARMv8.0+)
- GNU/Linux
	- Generic Linux with `glibc`
		- ~~i386 and later (32-bit)~~
		- x86-64 v1 and later
		- ~~AArch32 ARMv6 and later~~
		- AArch64 ARMv8.0 and later
		- ~~SPARC V9~~
	- Generic Linux with `musl`
		- ~~i386 and later (32-bit)~~
		- x86-64 v1 and later
		- ~~AArch32 ARMv6 and later~~
		- AArch64 ARMv8.0 and later
- Apple macOS
	- ~~macOS 10.4+ for x86-64~~
	- macOS 11.0+ for ARM64 (ARMv8.2+)
- ~~Generic Android APK~~
	- ~~x86 32-bit~~
	- ~~x86-64 64-bit~~
	- ~~AArch32 ARMv7~~
	- ~~AArch64 ARMv8.0~~
- ~~Apple iOS~~
	- ~~AArch32 for Apple A4 SoC and later~~
	- ~~AArch64 for Apple A7 SoC and later~~
- ~~Nintendo handhelds~~
	- ~~ARMv4T for Game Boy Advance~~
	- ~~ARMv5TE and ARMv4T for Nintendo DS~~
	- ~~ARMv6 for Nintendo 3DS~~

Struck-out platforms do not have immediate support just yet, but are
slated for eventual release. Windows 3.1 requires integration of the
OpenWatcom 2 toolchain. macOS on x86-64 requires integration on an
Intel-based Mac. SPARC requires setup of a SunFire compile farm that is
currently being refurbished. All Android and iOS targets require more
research. Nintendo platforms are all homebrew-based and also need more
research. The Nintendo Switch is not under consideration via Homebrew
due to it being a current-generation product. Targeting the Nintendo
Switch with official SDKs is outside the scope of this public project
due to encumberment via non-disclosure agreements.

-----

Copyright &copy; 2024 Alexander Nicholi. All rights reserved.

Redistribution and use in source and binary forms are permitted,
provided that **all** of the following conditions are met:

1. Derivative works of the source code cannot be distributed unless
   either:
	1. express written consent has been given by the copyright holder(s)
	   to do so, **or**
	2. all modifications are given solely in the form of
	   &ldquo;patch&rdquo; files that modify the original source code to
	   produce the derivative work;
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
&ldquo;AS IS&rdquo; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
DAMAGE.
