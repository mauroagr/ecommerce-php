Como preparar uma maquina base em linux
Linux Mint

# google chrome
```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable
```

# keeweb 
* Download normal e instalar usando instalador de pacotes

# skype
- Instalar pelo gerenciador de app

# atom beta
```
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update
sudo apt-get install atom-beta
```

# wine
- https://wiki.winehq.org/Ubuntu

# apache
```
sudo apt-get update
sudo apt-get install apache2
```

# php 7.2
```
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update 
sudo apt-get install php7.2
sudo apt-get install php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-soap php7.2-pgsql
```

# mysql
```
https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
sudo apt-get update
sudo apt-get install mysql-server
mysql_secure_installation
```

# postgresql
```
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
https://www.digitalocean.com/community/tutorials/como-instalar-e-utilizar-o-postgresql-no-ubuntu-16-04-pt
```

# composer
```
sudo apt-get update
sudo apt-get install curl php-cli php-mbstring git unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

# nodejs & npm
```
sudo apt-get update
sudo chown -R $USER /usr/local (este aqui acho que nao é necessário rodar)
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
```

# git
```
Para clonar um repositorio
cd /
cd var/www/
sudo chown username: html/ (username é o usario do linux)
cd html/
git clone https://usuariogit@github.com/xpto/xpto.git nomeDaPastaQueSeráCriada/
git branch -a (lista os branch remotos também)
git checkout origin/experimental (para clonar os branchs e ativar)
git checkout experimental (para clonar os branchs e ativar)

```


# Atualizar repositorio laravel
```
cd /
cd var/www/html/pastaRepositorio
composer install
npm install
npm run dev 
ou 
npm run prod
cp .env.example .env
php artisan key:generate

- Operações para criar build
php artisan version:build (atualiza o numero da versão, após algum commit)
```
