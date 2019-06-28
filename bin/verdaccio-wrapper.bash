#!/bin/bash
# Run Verdaccio as ec2-user.  This is what the systemctl verdaccio daemon will use on startup.

set -e
# Verdaccio should not be run as root, but under a user with regular privelages
runuser -l ec2-user -c '/home/ec2-user/.nvm/versions/node/v12.0.0/bin/verdaccio'

