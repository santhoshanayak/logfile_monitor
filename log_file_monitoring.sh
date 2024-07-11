#!/bin/bash
email_content="/var/log/email_content"
logdir="/var/log"
logfile=("a.log" "b.log" "c.log" "d.log" "e.log")

if [ -f $email_content ]; then
    rm -f $email_content
fi


for lfile in ${logfile[@]}; do
        da=$(cat "$logdir/$lfile" | head -n 1 | awk -F 'T' '{ print $1 }')
        if [[ "$da" != "$(date +%Y-%m-%d)" ]]
        then
                echo $lfile >> $email_content
        fi
done

if [[ -f $email_content ]]
then
                cat $email_content
fi
