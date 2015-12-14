# Backing up `~/.ssh`

## Create Tar
```
tar -cvf sensitive.tar ~/.ssh
```
## Encrypt
```
openssl enc -aes256 -in sensitive.tar -out sensitive.tar.enc -salt
```
## Decrypt
```
openssl enc -aes256 -in sensitive.tar.enc -out sensitive.tar -salt -d
```
## Expand
```
tar -xvf sensitive.tar
```
