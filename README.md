Python Robot Experiments
===

[Robot Framework](https://robotframework.org/) is an open source automation framework for test automation and robotic process automation (RPA). 

Make sure you use installed Python v3.

## Setup Python environment

If Python v2:

```bash
pip install virtualenv
python -m venv robotEnv
```

If Python v3:

```bash
pip3 install virtualenv
python3 -m venv robotEnv
```

## Activate and Start when needed

```bash
source robotEnv/bin/activate
virtualenv robotEnv
```

## Install dependencies

```bash
pip install -r requirements.txt
pip3 install -r requirements.txt
```


## Basic test if Python and Robot works OK

```bash
python3 test_robot.py
```
