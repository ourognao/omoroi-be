#!/bin/sh

# Get the current branch of your branch
current_branch="$(git symbolic-ref --short -q HEAD)"

echo "########## GIT PULL MASTER ##########"
git pull origin master

echo "########## GIT STATUS ##########"
git status

echo "########## GIT PUSH BRANCH TO GITHUB ##########"
git add -A .
git commit -m $current_branch
git push origin $current_branch

echo "########## FIGARO PUSH ENV VARS TO OMOROI (BACKEND - STAGING) ##########"
figaro heroku:set -e staging --app omoroi-be-staging

echo "########## HEROKU PUSH BRANCH TO OMOROI (BACKEND - STAGING) ##########"
git push staging "$current_branch":master

echo "CURRENT_BRANCH: $current_branch"

echo "##########【成功】ステージングデプロイスクリプトが完了しました ##########"
