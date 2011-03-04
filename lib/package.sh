#!/bin/sh

cd /wwwroot/images/appkit/exported
tar -cf $1.tar $1.db
gzip $1.tar
