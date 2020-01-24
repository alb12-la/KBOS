# Kill Bluetooth On Sleep (KBOS)
Tired of your bluetooth headphones pairing with a computer you thought was asleep ? This fixes that


# Prerequisites
KBOS requires [Homebrew](https://brew.sh/) which is used to install the following packages:
 * [Blueutil](https://formulae.brew.sh/formula/blueutil#default)
 * [sleepwatcher](https://formulae.brew.sh/formula/sleepwatcher#default)

## Installation
 1. Install [Homebrew](https://brew.sh/) manually first. 
 2. run `bash setup.sh` from this directory.

### Additional arguments
```
-h, --help                show brief help menu
-d, --disable             disables KBOS, but doesn't uninstall anything.
-e, --enable              re-enables KBOS from a disabled state
-u, --uninstall           removes the ~/sleepscripts directory and the KBOS Plist but does NOT uninstall brew, Blueutil, or sleepwatcher. I'll let you handle that on your own https://docs.brew.sh/FAQ#how-do-i-uninstall-a-formula.

```