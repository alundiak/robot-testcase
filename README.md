Python within Robot Experiments
===

[Robot Framework](https://robotframework.org/) is an open source automation framework for test automation and robotic process automation (RPA). 

My experiments are preliminary on MacOS where I have Python v3 installed. But sometimes I experiment with Anaconda which brings me another Python executable file. And also sometimes I skip using Python environment.

## Setup Python environment

There are three ways how to do it.

Note that if you frequently change approaches, you may need `Cmd+Shift+P` => `Python: Select Interpreter` + `Developer: Reload Window` to be 200% sure executable properly changed.

### `venv` (suggested)

`venv` is included in the Python Standard Library starting from Python 3.3, so you don’t need to install it separately.

**Activate and Start when needed**

**Create env**:

```sh
python3 -m venv myRobotEnv
```

**Create/Activate env**:

```sh
source myRobotEnv/bin/activate
```

### `virtualenv` (kinda suggested)

`virtualenv` is an external package that you need to install via pip.

```sh
pip3 install virtualenv
```

**Create/Activate env**

```sh
virtualenv myRobotEnv
```

### Using `pipenv` - very optional alternative

`pipenv` combines `pip` and `virtualenv` into a single tool. 

**But** it requires to `pip3 install pipenv` into **global** site-packages so that later be able to create USER located Python envs.

- `pipenv --version` => `pipenv, version 2024.0.1`
  - It creates `Pipfile` and `Pipfile.lock`
-  `pipenv install`
  - creates Virtualenv in location: `~/.local/share/virtualenvs/ttt-E***JpF`
  - To activate this project's virtualenv, run `pipenv shell`.
- Use `pipenv install` package_name which will install dependency and modify `Pipfile`.


## How to deactivate local Python env

- if you installed and use `venv` or `virtualenv` then to deactivate local Python environment run command: `deactivate`
- if you use `pipenv` and env was activated via `pipenv shell` then to deactivate run `exit` (yes from looks like from Terminal)


## Install dependencies into local Python env

```bash
pip3 install -r requirements.txt
```

or `pipenv install -r requirements.txt` if you use `pipenv` approach (it will add/update `Pipfile`).


## Basic Robot installed in local Python environment and can be used

```bash
python3 test_robot.py
```


## Run Robot test files

### Variant 1 - CLI based

Considering proper Python local environment setup and dependencies installation, §robot§ executable should be available:

```bash
$ robot --version
Robot Framework 7.0.1 (Python 3.12.5 on darwin)
```

Then executing this:

```bash
robot test1.robot
# or if many files needed
robot *.robot
```

should get this:

```text
==============================================================================
Hello World Test :: A simple Hello World test                                 
==============================================================================
Hello World Test :: This test case prints Hello World                 | PASS |
------------------------------------------------------------------------------
Hello World Test :: A simple Hello World test                         | PASS |
1 test, 1 passed, 0 failed
==============================================================================
```

### Variant 2 - VS Code Run & Debug feature

`.vscode/launch.json` ia created to execute Robot towards current open `*.robot` file in editor. 

Note, but if Python vs Python3 issue exists among using Python environment, then Robot VS Code extension seems to have bug there. 


```text
Error importing robot.
Python executable: /opt/homebrew/opt/python@3.12/bin/python3.12.

Traceback (most recent call last):
  File "~/.vscode/extensions/robocorp.robotframework-lsp-1.12.0/src/robotframework_debug_adapter/run_robot__main__.py", line 672, in <module>
    main()
  File "~/.vscode/extensions/robocorp.robotframework-lsp-1.12.0/src/robotframework_debug_adapter/run_robot__main__.py", line 649, in main
    import robot
ModuleNotFoundError: No module named 'robot'
```

**Solution:**

- `Cmd+Shift+P` => `Python: Select Interpreter` => Select from local `robotEnv/bin/python3`
  - OPTIONAL might work alternative `Cmd+Shift+P` => `Preferences: Open Workspace Settings (JSON)` => Add/Modify `"python.pythonPath": "./robotEnv/bin/python3"`
- `Cmd+Shift+P` => `Developer: Reload Window`
- Then Open `*.robot` file in Editor, and click "Run and Debug", test should pass.

```text
$  /usr/bin/env /var/folders/92/_xvj***0gn/T/rf-ls-run/run_env_00_jx46zh8g.sh 
  -u ~/.vscode/extensions/robocorp.robotframework-lsp-1.12.0/src/robotframework_debug_adapter/run_robot__main__.py 
  --port 49789 
  --debug 
  ~/projects_py/robot-testcase/hello_world_test.robot 

0.00s - Debugger warning: It seems that frozen modules are being used, which may
0.00s - make the debugger miss breakpoints. Please pass -Xfrozen_modules=off
0.00s - to python to disable frozen modules.
0.00s - Note: Debugging will proceed. Set PYDEVD_DISABLE_FILE_VALIDATION=1 to disable this validation.

==============================================================================
Hello World Test :: A simple Hello World test                                 
==============================================================================
Hello World Test :: This test case prints Hello World                 | PASS |
------------------------------------------------------------------------------
Hello World Test :: A simple Hello World test                         | PASS |
1 test, 1 passed, 0 failed
==============================================================================
```
