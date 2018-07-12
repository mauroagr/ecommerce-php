## GIT OPERATIONS

- ZIP all files added and updated between commits. Use when not have automatized deploy. Remember that this operation not remove the deleted files, only the added and updated.
```
git archive --output=gitupdate.zip HEAD $(git diff --name-only hash_do_ultimo_commit hash_do_ultimo_commit --diff-filter=AM)
```

- Show all updated files between commmits
```
git diff --name-status hash_do_ultimo_commit hash_do_ultimo_commit --diff-filter=AM
```

