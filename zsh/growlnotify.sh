#!/bin/bash
(tail -f ~/.irssi/fnotify | while read heading message; do
   growlnotify -t "${heading}" -m "${message}";
   done)&
