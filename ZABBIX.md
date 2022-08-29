# ZABBIX

Zabbix Server 6.0 LTS

## Intallation
Source web: [Zabbix Download](https://www.zabbix.com/la/download?zabbix=6.0&os_distribution=ubuntu&os_version=22.04_jammy&db=postgresql&ws=apache)

Settings:
* Zabbix Paquetes
* Version Zabbix = 6.0 LTS
* Distribución de so = Ubuntu
* Versión del sistema operativo = 22.04 (jammy)
* Base de datos = PostgresSQL
* Servidor web = Apache

### Download package
```bash
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_6.0-3+ubuntu22.04_all.deb
sudo apt update 
```

### Install server, UI and zabbix agent
```bash
 sudo apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent 
 ```

### Install database postgresql
```bash
sudo apt-get install postgresql
```

### Create initial information to database
```bash
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix 
```

### Import schema and initial data
```bash
zcat /usr/share/doc/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix 
```

### Configure DDBB to Zabbix Server
Editar archivo /etc/zabbix/zabbix_server.conf
```bash
nano /etc/zabbix/zabbix_server.conf
```
```diff
- # DBPassword=
+ DBPassword=[postgresql zabbix]
```

### Install Zabbix sender
```bash
apt-get install zabbix-sender
```

## Web configuration

### Basic settings

1. Default language = English
2. Check of pre-requisites > Next stop
3. Configure DB connection
* Password [postgresql zabbix]
4. Settings
* Zabbix server name = Zabbix LoRaWAN
* Default time zone = UTC-3
* Default theme = Dark
5. Pre-installation summary > Next step
6. Install > Finish

### Ingresar a Zabbix

* User: Admin
* Pass: zabbix

## Change password for 'Admin' user

User settings > Profile > User > Password > Change password

## Import template

Como usuadio Admin:
1. Configuration > Templates > Import
2. [Tengo que convertir template de 6.2 a 6.0]