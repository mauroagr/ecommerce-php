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

- ZIP all files added and updated between commits. Use when not have automatized deploy. Remember that this operation not remove the deleted files, only the added and updated.
- DONT USE - I THINK HAVE SOME BUG
```
git archive --output=gitupdate.zip HEAD $(git diff --name-only hash_do_ultimo_commit hash_do_ultimo_commit --diff-filter=AM)
```

- Show all added and updated files between commmits
```
git diff --name-status hash_do_ultimo_commit hash_do_ultimo_commit --diff-filter=AM
```



- Remove file that was updated in branch, before add and commit and return to original branch file.
```
git checkout -- caminho/nomedoarquivo
```
