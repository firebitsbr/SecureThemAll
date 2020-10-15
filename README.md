# SecureThemAll
Automatic Repair Framework based on the modified Cyber Grand Challenge Event Corpus for Linux

###### This project is under development. The current version supports GenProg, MUT-APR and CquenceR, and works on Linux OS.
###### The repair tools to be added are RSRepair, SOSRepair, Prophet, SPR.

### Notes

---
These notes might save you some time:

* Ensure that sh is symlinked to bash, not dash

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Install the necessary dependencies for cb-multios and GenProg before running the project.
<br/>
##### Software:
* [Python (3.7.5)](https://www.python.org/)
* [GenProg v3.2](https://github.com/squaresLab/genprog-code.git)
* [MUT-APR](https://fyassiri.wixsite.com/mutapr)

#### 1) Clone this repo with submodule
``` console
$ git clone --recurse-submodules -j8 https://github.com/epicosy/SecureThemAll.git
```

Or

``` console
$ git clone https://github.com/epicosy/SecureThemAll.git
$ cd SecureThemAll
$ git submodule update --init --recursive
```

#### 2) Install Tools Prerequisites
For now, GenProg doesn't have a init script. It must be setup manually. The source code needs to be compiled.
For MUT-APR, run ```repair_tools/init_mut_aprfl.sh```.

#### 3) Init Benchmark
Execute the ```init.sh``` in the folder ```benchmark/cb-repair```.

## Usage
The following command is a baseline for normal usage:

``` console
$ python3 repair.py GenProg -c BitBlaster --seed 1 --config_path ../repair_tools/genprog.json 
```
---
Note: Make sure you have the polls initialized. Check benchmark's documentation for more information on that. 
---


## Results
During the brief experimentation of the framework's functionality, **GenProg** was able to generate under 3 minutes a patch for the challenge **BitBlaster**, 
which contains [CWE-824: Access of Uninitialized Pointer](http://cwe.mitre.org/data/definitions/824.html) and [CWE-476: Null Pointer Derefernece](http://cwe.mitre.org/data/definitions/476.html) vulnerabilities. 
The results can be found in the ```results``` folder.


## Acknowledgments
Guidance and ideas for some parts from:

* Project structure and abstractions from [The RepairThemAll Framework](https://github.com/program-repair/RepairThemAll)