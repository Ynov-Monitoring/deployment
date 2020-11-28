# MONITORING project - ansible project

## Installation

- [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

- clone this repository

## Command Utils

<pre>
# Go to project Folder
cd deployment
</pre>

<pre>
# Launch VM Vagrant
vagrant up
</pre>

<pre>
# Launch playbook
ansible-playbook [--vault-password-file <em>vault_file_path</em>] -i inventories/<em>environment</em>/hosts playbook/<em>playbook_name.yml</em>

# Example:
# Lancer uniquement la configuration de notre infra
ansible-playbook -i inventories/local playbook/main-infra.yml

# Lancer uniquement l'installation de telegraf sur les client
ansible-playbook -i inventories/client-local playbook/telegraf.yml

# Lancer la configuration global (notre infra + telegraf chez les clients)
ansible-playbook -i inventories/local -i inventories/client-local playbook/main-infra.yml
</pre>

<pre>
# Destroy VM Vagrant without confirmation  
vagrant destroy -f
</pre>
