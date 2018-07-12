## GIT OPERATIONS

- ZIP all files added and updated between commits. Use when not have automatized deploy. Remember that this operation not remove the deleted files, only the added and updated.
```
git archive --output=gitupdate.zip HEAD $(git diff --name-only hash_do_ultimo_commit hash_do_ultimo_commit --diff-filter=AM)
```

- Show all updated files between commmits
```
git diff --name-status hash_do_ultimo_commit hash_do_ultimo_commit --diff-filter=AM
```


- Git basic operations
``` 
git checkout -b novobranch (cria um novo branch baseado no atual)
git add .
git commit -m "mensagem"
git checkout branch (seta o repositorio no branch atual)
git merge novobranch (ele vai unir o branch atual setado, com o 'novobranch' e vc poderá deletar o branch que foi criado)
git checkout -d novobranch
``` 

- Remove file that was updated in branch, before add and commit and return to original branch file.
```
git checkout -- caminho/nomedoarquivo
```
