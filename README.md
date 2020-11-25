# MONITORING project - ansible project

## Installation

- [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

- clone this repository

## Launch Playbook

<pre>
# Go to project Folder
cd deployment
</pre>

<pre>
# Launche VM Vagrant
vagrant up
</pre>

<pre>
# Launch playbook
ansible-playbook [--vault-password-file <em>vault_file_path</em>] -i inventories/<em>environment</em>/hosts playbook/<em>playbook_name.yml</em>
</pre>
