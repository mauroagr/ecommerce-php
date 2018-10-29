## GIT OPERATIONS

- Initialize git repository
```
git init
```

Specify a new remote upstream repository that will be synced with the fork.
```
git remote add origin https://usuario@github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```

- Checkout remote branch
```
git checkout -b test origin/test
git branch --set-upstream-to=origin/remotebranch localbranch
```

- Git basic operations
``` 
git checkout -b novobranch (cria um novo branch baseado no atual)
git add .
git commit -m "mensagem"
git checkout branch (seta o repositorio no branch atual)
git merge novobranch (ele vai unir o branch atual setado, com o 'novobranch' e vc poderá deletar o branch que foi criado)
git checkout -d novobranch

git push --set-upstream origin nomedobranch_local
git reset --hard (this discard all modification in the branch)
git rev-list HEAD --count (show the number of commit from the branch. Can be used to versioning)
git stash (if you are working in branch and need go out from there to make fix in other branch, you can put the edited files without add/commit in space to storage and get the files after)
git stash apply (get the last files from stash operation and NOT remove the 'stashed' files)
git stash pop (get the last files from stash operation and REMOVE it from stash space)
git stash drop stash@{0} (REMOVE the stashed files from stash space)
git reset (if you execute git add ., and will return the files, return to stage, use it)
``` 

- Force the local branch to get status from remote
```
git fetch --all
git reset --hard origin/<branch_name>
``` 

- Get content from specific commit, this is used to find bugs
```
git checkout COMMIT_HASH .
```
- To return a original status from branch after use checkout from commit
```
git reset --hard
```

- Create pull request from one commit
https://poanchen.github.io/blog/2017/11/12/How-to-create-a-GitHub-pull-request-with-a-specific-commits

-Shortcuts
https://medium.freecodecamp.org/bash-shortcuts-to-enhance-your-git-workflow-5107d64ea0ff

- Remove file that was updated in branch, before add and commit and return to original branch file.
```
git checkout -- caminho/nomedoarquivo
```

- Delete remote branch
```
git push origin --delete the_remote_branch
```
- Delete local branch
```
git branch -d nome_branch_local
```


- if you push a branch with bad files, and you will back the master to the last good situations, make:
```
git checkout COMMIT_HASH .
git branch -b new-branch
git branch -D master  # goodbye old master (still in reflog)
git branch -m new-branch master  # the new-branch is now my master
- go to the github and create a backup branch from master.
git push (the updated branch on local)
```

## GIT IGNORE
(https://www.atlassian.com/git/tutorials/saving-changes/gitignore)
### Ignoring a previously committed file
```
echo debug.log >> .gitignore
git rm --cached debug.log
rm 'debug.log'
git commit -m "Start ignoring debug.log"
```
Example mutiples files: find modules/\*/ -name "config\*.xml" -exec git rm --cached {} \;


### Committing an ignored file
```
$ cat .gitignore
*.log
$ git add -f debug.log
$ git commit -m "Force adding debug.log"
```


