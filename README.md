# salt-minion-upgrade
A small state to manage the upgrade of salt minions from the salt master. Windows and Linux minions are supported.

# intended use

This state upgrades both Windows and Linux minions. It was written with the 3004 root_dir and config_dir changes in mind for Windows minions.

# requirements

Local files for both the windows installer (msi) and bootstrap.sh must be present on the master
