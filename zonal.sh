#!/bin/bash

for  server in $(host -t ns megacorpone.com |cut -d" " -f4);
do
 host -l megacorpone.com $server ;
done
