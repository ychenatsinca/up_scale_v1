#!/bin/sh

#init git 
git init

#add files 
git add *.R table.combine *.sh temp*

#commit files 
git commit -m " add bash scripts for running single cpu and combine file job  !"

#set the origin, only for the first time
git remote add origin git@github.com:ychenatsinca/up_scale_v1.git

#add branch name, here is main 
git branch -M main

#push commit files to the server/origin as master or branch 
git push -u origin main


