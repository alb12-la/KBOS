# Kill Bluetooth On Sleep (KBOS)
Tired of your bluetooth headphones pairing with a MacOs computer you thought was asleep ? This fixes that

KBOS uses `sleepwatcher` and `Blueutil` to turn off bluetooth when your mac falls asleep, then turns it back on when the computer is woken up. 

## Prerequisites
KBOS requires [Homebrew](https://brew.sh/) which is used to install the following packages:
 * [Blueutil](https://formulae.brew.sh/formula/blueutil#default)
 * [sleepwatcher](https://formulae.brew.sh/formula/sleepwatcher#default)

## Installation
 1. Install [Homebrew](https://brew.sh/) manually first. 
 2. run `bash setup.sh` from this directory.


## Future improvements
- Attempt to connect to last connected device on wake. 
- Improve script output and robustness
