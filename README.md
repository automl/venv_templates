This branch is a modified *copy* of Stefan Kesselheim's [`sc_venv_template`](https://gitlab.jsc.fz-juelich.de/kesselheim1/sc_venv_template/-/tree/47e3495d4d5cb1113d228bae7ea38deeeea74da5) repo for JSC users.

---

### Basic example protocol

* Have a clone of this repo on your local/workspace
* Use the scripts available to setup, manage environments
* Especially useful for HPCs with preset modules

The commands below can work even with relative path if current directory is the current target project.

### Main step to create a new environment:
```bash
bash setup.sh <env_name> <env_target_dir> <path_to_a_requirements.txt>
```
Defaults for each option above:
* <env_name>: `venv_template`
* <env_target_dir>: `venv_templates/venv/`
* <path_to_a_requirements.txt>: `venv_templates/requirements.txt`

### Main step to source an existing environment:
```bash
source activate.sh <env-name> <env-target-dir>
```

### To use `Poetry` and a `pyproject.toml`
* Run `setup.sh` with a blank `requirements.txt`
* Source the environment as above
* Run `poetry install` or `poetry update` as normal

---
---
---
Below, original repo's README:
---

Supercomputing Environment Template using Python Virtual Environments
=================

# Idea
This project contains a lightweight set of scripts to easily create Python working environments on
typical supercomputer setups, including creating Jupyter Kernels.

On Supercomputers, typically a basic environment based on **Environment Modules**. This setup is carefully
curated and optimized, including compilers, MPI version etc. Extra Python packages can be installed
with pip into user space. This, however, does not create a reproducible environment that can be used
by other users as well.

Conceptually, with Virtual Environments, it is easily possible to create project-based virtual environments.
These scripts streamline the creation and usage of such environments and make it easy for a users to share a setup
and to put it under version control with the main code.

Furthermore, in typical compute setup of scientific projects, one or more packages possibly are in active
development. In the context of these setups, it is intended to include them as submodules and add integrate
them into the workflow. This can e.g. mean that a compilation step is added in the setup step and
setting appropriate environment variables is included in the activation step.

# Details
The setup is configured in the bash script `config.sh`. The user can define a name for the venv and directory
where the venv files are stored. This defaults to the directory name of the containing folder and the "." folder
of the scripts. Please **edit** this file if you want a custom name and location for the venv.

The modules on top of which the the venv should be built are defined in `modules.sh`. Please **edit** the file
to your needs.

The file `requirements.txt` contains a list of packages to be installed during the setup process. Add required
packages to this file to reproducibly add them to the venv.

The script `setup.sh` creates the venv according to the config given in `config.sh`. Please **edit** this
file to add a setup step for submodules (e.g. compilation of libraries). If only plain venvs are used, this file
can remain unchanged. Note that the script *must* be ran at least once after the above configurations to actually create the environment.

The script `activate.sh` sets the environment variables such that the venv can be used. Please **edit** this file
to add environment variables for submodules. Note that the script must be *sourced* to take effect. Example:
```bash
source <path_to_venv>/activate.sh
```

The script `create_kernel.sh` will create a kernel json file in the user's home directory that can be found
by Jupyter and a helper script in the virtual environment folder.



# Intended Workflow
1. Edit `config.sh` to change name an location of the venv if required.
2. Edit `modules.sh` to change the modules loaded prior to the creation of the venv.
3. Edit `requirements.txt` to change the packages to be installed during setup.
4. Edit `setup.sh` and `activate.sh` to add extra steps for custom modules.
5. Create the environment with `bash setup.sh`.
6. Create a kernel with `bash create_kernel.sh`.
