Quick setup — if you’ve done this kind of thing before
https://github.com/mdabdullah0/scripts.git
Get started by creating a new file or uploading an existing file. We recommend every repository include a README, LICENSE, and .gitignore.

…or create a new repository on the command line
echo "# scripts" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/mdabdullah0/scripts.git
git push -u origin main
…or push an existing repository from the command line
git remote add origin https://github.com/mdabdullah0/scripts.git
git branch -M main
git push -u origin main
===========


Create repo in GITHUB, named codex

http://GitHub.com/ABCDDD/codex.g/codex.git

git pull http://GitHub.com/ABCDDD/codex.g/codex.git

copy the URL from browser

cd codex ##INSIDE THE WORKING DIRECTORY HAVING FILES AND DIR

git checkout -b version1.0 ##get inside the version1.0 of the package

Add files and DIR in this codex folder,
nano test.ext

git add test.ext * ##FOR ADDING ALL FILES AND FOLDERS FOR PUSHING AT GITHUB

git commit -m "testing"

git push origin version1.0

Put username,
Put PAT, ## get it from GitHub>settings> developer settings

After every step, can see status, get status of the files,

git status
=============



git pull origin
git checkout -b main
git branch main -u origin/main
git remote set-head origin main
git branch --set-upstream-to=origin/main main
git branch -d master
git branch -d -r origin/master






finally done
===============
git init
19/05/24 06:12:22 git status
  146  19/05/24 06:18:01 git config --global user.name "mdabdullah0"
  147  19/05/24 06:18:23 git config --global user.email "give-email"
  148  19/05/24 06:18:26 git status
  151  19/05/24 06:19:55 git pull https://github.com/mdabdullah0/scripts.git
  156  19/05/24 06:21:42 nano README.md
  157  19/05/24 06:22:13 git status
  158  19/05/24 06:22:32 git add *
  159  19/05/24 06:22:36 git status
  167  19/05/24 06:38:31 git commit -m "learning"
  171  19/05/24 06:41:23 git remote add scripts https://github.com/mdabdullah0/scripts.git
  173  19/05/24 06:41:37 git push scripts
  174  19/05/24 06:42:03 git status


recursive
==================

git init
git add
git commit -m 'comment'
git push 'BRANCH'
