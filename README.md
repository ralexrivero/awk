# awk essential
<!-- ansi regular-->
```bash
 █████  ██     ██ ██   ██ 
██   ██ ██     ██ ██  ██  
███████ ██  █  ██ █████   
██   ██ ██ ███ ██ ██  ██  
██   ██  ███ ███  ██   ██ 
```

awk command line tool essential

* Text manipulation
* Automation

## Environment

<!-- ubuntu -->
[![Ubuntu](https://img.shields.io/static/v1?label=&message=Ubuntu&color=E95420&logo=Ubuntu&logoColor=E95420&labelColor=2F333A)](https://ubuntu.com/) <!-- bash -->
[![Bash](https://img.shields.io/static/v1?label=&message=GNU%20Bash&color=4EAA25&logo=GNU%20Bash&logoColor=4EAA25&labelColor=2F333A)](https://www.gnu.org/software/bash/) <!-- vim -->
[![Vim](https://img.shields.io/static/v1?label=&message=Vim&color=019733&logo=Vim&logoColor=019733&labelColor=2F333A)](https://www.vim.org/) <!-- vs code -->
[![VS Code](https://img.shields.io/static/v1?label=&message=Visual%20Studio%20Code&color=5C2D91&logo=Visual%20Studio%20Code&logoColor=5C2D91&labelColor=2F333A)](https://code.visualstudio.com/)

* OS: ``ubuntu``
* IDE: ``vim``, ``VS Code``
* Shell: ``bash``
* Style guidelines: ``shellcheck``
* ``awk``

## Execute awk commands

>use the ``awk -f`` flag followed by the file containing the awk command

```bash
vagrant@ubuntu-xenial:~/awk$ cat names.txt 
Igor Mc Gregor
Tomas Steele
Wayne Johnson
Molly Black
Levy Woodstock
vagrant@ubuntu-xenial:~/awk$ cat swap.awk 
{print $2, $1}
vagrant@ubuntu-xenial:~/awk$ awk -f swap.awk names.txt 
Mc Igor
Steele Tomas
Johnson Wayne
Black Molly
Woodstock Levy
vagrant@ubuntu-xenial:~/awk$ 
```

### flags

> field separator with ``-F`` followed by the _separator string or character_

```bash
agrant@ubuntu-xenial:~/awk$ cat comma.txt 
one,two,three,four,five
vagrant@ubuntu-xenial:~/awk$ awk -F , '{print $2}' comma.txt 
two
vagrant@ubuntu-xenial:~/awk$ 
```

_interactive mode_
```bash
vagrant@ubuntu-xenial:~/awk$ awk -F - '{print $2}'
one-two-three
two
^C
vagrant@ubuntu-xenial:~/awk$ 
```

### variables

> set variable with ``-v`` flag

```bash
vagrant@ubuntu-xenial:~/awk$ awk -v hi=HELLO '{print hi, $0}' names.txt 
HELLO Igor Mc Gregor
HELLO Tomas Steele
HELLO Wayne Johnson
HELLO Molly Black
HELLO Levy Woodstock
vagrant@ubuntu-xenial:~/awk$ 
```

## specify multiple files

```bash
vagrant@ubuntu-xenial:~/awk$ awk -v hi=HELLO '{print hi, $0}' names.txt names2.txt 
HELLO Igor Mc Gregor
HELLO Tomas Steele
HELLO Wayne Johnson
HELLO Molly Black
HELLO Levy Woodstock
HELLO Ronald Rivero
HELLO Walt Whitman
vagrant@ubuntu-xenial:~/awk$
```

## regular expresions

> regular expresions must be enclosed in quotes

accept the ``,!:;`` characters as separators

```bash
vagrant@ubuntu-xenial:~/awk$ awk -F '[,!:;]' '{print $4}'
one two,three:four;five
five
^C
vagrant@ubuntu-xenial:~/awk$ 
```

## record separator
or line separator is specified by ``RS``
separate the fields by ``,`` and the records (lines) by ``!``

```bash
vagrant@ubuntu-xenial:~/awk$ cat bigline.txt 
one,two,three!four,five,six!seven,eight,nine!ten,eleven,twelve
vagrant@ubuntu-xenial:~/awk$ awk 'BEGIN{RS="!";FS=","} {print $2}' bigline.txt 
two
five
eight
eleven
vagrant@ubuntu-xenial:~/awk$ 
```

## special case in separator
> ``RS=""`` empty string as separator takes the line as one field

```bash
vagrant@ubuntu-xenial:~/awk$ cat address.txt 
Alex Wolf
873 New Hamps Blvd
New York, NY 3334

Young Cheng
1253 Craws Street
Rockford, IL 4356

Marck Zoom
8 Washersmith Ave
San Francisco, CA 18636

vagrant@ubuntu-xenial:~/awk$ awk 'BEGIN {RS="";FS="\n"} {name=$1; address=$2; zip=$3; print "name:" name, "address:" address, "city:" zip} ' address.txt 
name:Alex Wolf address:873 New Hamps Blvd city:New York, NY 3334
name:Young Cheng address:1253 Craws Street city:Rockford, IL 4356
name:Marck Zoom address:8 Washersmith Ave city:San Francisco, CA 18636
vagrant@ubuntu-xenial:~/awk$ 
```

## Author

<!-- twitter -->
[![Twitter](https://img.shields.io/twitter/follow/ralex_uy?style=social)](https://twitter.com/ralex_uy) <!-- linkedin --> [![Linkedin](https://img.shields.io/badge/LinkedIn-+21K-blue?style=social&logo=linkedin)](https://www.linkedin.com/in/ronald-rivero/) <!-- github --> [![Github](https://img.shields.io/github/followers/ralexrivero?style=social)](https://github.com/ralexrivero/) <!-- vagrant --> [![Vagrant](https://img.shields.io/static/v1?label=&message=Vagrant%20Profile&color=1868F2&logo=vagrant&labelColor=2F333A)](https://app.vagrantup.com/ralexrivero) <!-- docker --> [![Docker](https://img.shields.io/static/v1?label=&message=Docker%20Profile&color=2496ED&logo=Docker&labelColor=2F333A)](https://hub.docker.com/u/ralexrivero)
