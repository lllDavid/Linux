#!/bin/bash

syslog_path="/var/log/auth.log"


result= sudo grep -v 'CRON'  $syslog_path 


