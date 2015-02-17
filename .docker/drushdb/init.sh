#!/bin/bash

# run db updates... so I don't have to worry about doing this if I change the make file
cd /app && drush @sites updb --yes
