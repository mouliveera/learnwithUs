## 24-05-2022
- Create a gitHub account
- Copy ssh keys to your profile.
```
ssh-keygen
> Enter
> Enter
> Enter
---
# cd to your home directory
# You can view id_rsa, id_rsa.pub
cd ~/.ssh/
ls -l

cat id_rsa.pub

Add that key to SSH keys in gitHub.
```

Follow: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
---
#### Commands:
- git clone <REPOSITORY_URL> # How to clone a repo
- git branch  # List the gitHub branches
- git checkout -b <"NEW_BRANCH_NAME"> # For creating a new branch
- git checkout <BRANCH> # Change the branch
- git status # List the files modified/added/removed
- git add <fileName> # Adding files to local brach
- git add .  # Add all files at a time
- git add -A # Same as above^^
- git commit # Short description note for the changes
- git push origin <BRANCH_NAME> # Push the changes to remote branch
- git pull # Pull the latest changes from remote branch

#### Tools:
- Markdown page document: https://www.markdownguide.org/basic-syntax/
- Terminals for windows: https://alternativeto.net/software/iterm2/?platform=windows [ubuntu is recommended]

