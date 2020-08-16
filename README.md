# SecureThemAll
Automatic Repair Framework based on the modified Cyber Grand Challenge Event Corpus for Linux

###### This project is under development. The current status supports GenProg and works on Linux OS. The repair tools to be added are Angelix, RSRepair, SearchRepair, SOSRepair, MUT-APR, Prophet, SPR, DeepFix.

---
**Disclaimer**:

* I don't have any particular expertise with CMake, therefore, there might be better/simpler ways to implement the link between the tools and DARPA's CGC Event Corpus. If you know other approach, post an issue related to it.
---

### Notes

---
These notes might save you some time:

* The script ```benchmark/init.sh``` builds all the challenges and polls for the metadata generation. 
The original ```CMakeLists.txt``` config file is replaced to enable the checkout command.
The ```CMakeLists.txt``` changed file builds one specified challenge at a time.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Install the necessary dependencies for cb-multios and GenProg before running the project.
<br/>
##### Software:
* [Python (2.7.17)](https://www.python.org/)
* [Python (3.7.5)](https://www.python.org/)
* [GenProg v3.2](https://github.com/squaresLab/genprog-code.git)
* [cb-multios](https://github.com/trailofbits/cb-multios.git)

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

#### 2) Install Prerequisites

#### 3) Configure the project
Execute the ```init.sh``` in the folder ```benchmark```.
The script builds the challenges and POVs, generates the polls and creates the file ```metadata.json``` which is used by the scripts used by the repair tool.

``` console
$ ./init.sh
```

## Usage
``` console
$ python3 repair.py GenProg -c BitBlaster --pos_tests 10 --seed 1 --config_path ../repair_tools/genprog.json 
```

By default, the count of generate polls is 100. The number can be changed in the ```benchmark\cb-multios\genpolls.sh``` script.

The number of positive and negative tests (Polls and POVs respectively) can be supplied with ```--pos_tests``` and ```--neg_tests``` arguments to the repair script.


## Challenges
The initial set of challenges considered for the framework are the ones listed in the ```linux-final.txt``` file from ```benchmark``` folder. 
The file was created by choosing the challenges in the ```linux-working.txt``` file from the **cb-multios** project and from those excluding the 
ones that contain extra folders (cb, include, support) and challenges that have vulns in the header source files, with the purpose to eliminate complexity and have a simple baseline.

To list the challenges covered, execute:

``` console
$ python3 cb_multi_os_apr.py -o info
```

## Results
During the brief experimentation of the framework's functionality, **GenProg** was able to generate in 2 minutes a patch for the challenge **BitBlaster**, 
which contains [CWE-824: Access of Uninitialized Pointer](http://cwe.mitre.org/data/definitions/824.html) and [CWE-476: Null Pointer Derefernece](http://cwe.mitre.org/data/definitions/476.html) vulnerabilities. 
The results can be found in the ```results``` folder.


## Acknowledgments
Guidance and ideas for some parts from:

* Project structure and abstractions from [The RepairThemAll Framework](https://github.com/program-repair/RepairThemAll)