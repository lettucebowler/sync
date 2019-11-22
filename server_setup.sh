#!/bin/bash

sudo apt install expect
sudo ./scripts/autofill_user_create.sh
mkdir /home/shared/Lettucebox
sudo chown shared /home/shared/Lettucebox
