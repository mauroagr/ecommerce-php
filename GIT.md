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
