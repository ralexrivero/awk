# awk essential
<!-- ansi regular-->
```bash
 █████  ██     ██ ██   ██ 
██   ██ ██     ██ ██  ██  
███████ ██  █  ██ █████   
██   ██ ██ ███ ██ ██  ██  
██   ██  ███ ███  ██   ██ 
```

awk programming language
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

#### built-in variables

``FS`` input field separator
``RS`` input record separator
``OFS`` output field separator
``ORS`` output record separator
``NR`` number of records
``NF`` number of fields
``FILENAME`` Filename
``FNR`` filename record
  * usefull if concatenates more than one file as input
``$0`` Entire line
``NF`` the nth field
  * awk '{print $NF}' text.txt // print the last field
  * awk '{print $(NF-1)}' text.txt // print the last -1 field
``$`` can asign a value to a field
  * awk '{$1="value"; print $0} // print "value" in field 1 and the followed fields

#### user defined variables

> variables are case sensitive
> all are global scope

```bash
vagrant@ubuntu-bionic:~$ awk '{hello=$1; bye=$2; print hello, bye}'
hello goodbye
hello goodbye
^C
vagrant@ubuntu-bionic:~$
```

apply operators to variables

```bash
vagrant@ubuntu-bionic:~$ awk '{a=1; b=2; print a + b}'

3
^C
vagrant@ubuntu-bionic:~$ awk '{a=1; b=2; print a b}'

12
^C
vagrant@ubuntu-bionic:~$ awk '{a=1; b=2; print a, b}'

1 2
^C
vagrant@ubuntu-bionic:~$ 

```
#### operators and arrays

* Math operators
  * +
  * -
  * *
  * /
  * %
  * ^
* Increment and decrement operators
  * ++
  * --
  * accept pre increment/decrement and post increment/decrement

```bash
vagrant@ubuntu-bionic:~$ awk '{a=1; b=2; print a++, ++b}'

1 3
```
* Assignment operators
  * =
  * +=
  * -=
  * *=
  * /=
  * %=
  * ^=
* Comparision operators
  * ==
  * !=
  * <
  * <=
  * \>
  * \>=
return 1 or true, 0 or false
* Regular expression comparison
  * ~
  * !~
* Array subscript
  * []

```bash
vagrant@ubuntu-bionic:~$ awk '{a[1]=$1; a[2]=$2; a[3]=$3; print a[1], a[2], a[3]}'
one two three
one two three
^C
vagrant@ubuntu-bionic:~$ 
```

### specify multiple files

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

### regular expresions

> regular expresions must be enclosed in quotes

accept the ``,!:;`` characters as separators

```bash
vagrant@ubuntu-xenial:~/awk$ awk -F '[,!:;]' '{print $4}'
one two,three:four;five
five
^C
vagrant@ubuntu-xenial:~/awk$ 
```

/abc/
  matches "abc", "xxabcxx""
  does not match "abxxc", "ab", "ABC"

```bash
vagrant@ubuntu-xenial:~/awk$ awk '/on/{print $0}' feaw_greatnesses.txt 
Great the risen and fallen nations, and their poets,
Helmsmen of nations, choose your craft! where
Great the daring and venture of sailors on new
explorations.
vagrant@ubuntu-xenial:~/awk$ 
```
/a.c/
  matches "abc", "axc"
  does not match "ac"

\ removes special meaning
/a\c/
    matches "a.c"
    does not match "ac"

\\\\ escape the \

/^abc/
      matches that begins with "abc"
      does not match "dabc"

/abc$/
      matches that ends with "abc"
      does not match "abcd"

[]
  matches any character in the set

/a[xyz]c/
  matches any single character in the set, but only one
  matches "axc", "ayc", "azc"
  does not match "abc"
  does not match "axyzc"

*ranges*

/a[a-z]c/
  matches a range of characters from a to z
  matches "abc", ... "axc", "ayc", "azc"

*combined ranges*
/a[a-zA-Z]c/
  matches a range of characters from a to z and A to Z
  matches "abc", ... "axc", "ayc", "azc", "aAc", "aYc", "aZc"

/a[^a-z]c/
  matches any single character not in the set
  matches "a.c", "aBc"
  does not match "abc"

*zero o more repeats*
/ab*c/
  matches one or more repeats of "ab"
  matches "abc", "abbbc", "ac"

*one or more repeats*
/ab+c/
  matches one or more repeats of "ab"
  matches "abc", "abbbc"
  does not match "ac"

*zero or one repeats*
/ab?c/
  matches zero or one repeats of "ab"
  matches "abc", "ac"
  does not match "abbbc"

*specific number of repeats*
{n}
  matches exactly n repeats
  /ab{3}c/
  matches "abbbc"
   does not match "abbbbc"

{n,}
  matches at least n repeats
  /ab{3,}c/
  matches "abbbc", "abbbbc"

{n, m}
  repeats from n to m
/ab{3,4}/
  matches "abbbc", "abbbbc"
  does not match "abbbbbbc"

##### quantifiers
/(ab)+c/
    matches one or more repeats of "ab"
    matches "abc", "ababc", "abababc"

*greediness*

### Control structure

Control the flow execution

 if
 for

### record separator (input)
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

### special case in separator (input)
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
vagrant@ubuntu-xenial:~/awk$ ;
```

### field and record separator in output

> default field separator is `` `` _space_
> default record separator is ``\n`` _new line_
``ORS`` _output record separator_
``OFS`` _output field separator_

```bash
vagrant@ubuntu-xenial:~/awk$ cat names2.txt 
Ronald Rivero
Walt Whitman
vagrant@ubuntu-xenial:~/awk$ awk 'BEGIN{OFS=", ";ORS=" / "} {print $2, $1}' names2.txt 
Rivero, Ronald / Whitman, Walt / vagrant@ubuntu-xenial:~/awk$ 
```
The comma between $2 and $1 means that awk will use the OFS

## Author

<!-- twitter -->
[![Twitter](https://img.shields.io/twitter/follow/ralex_uy?style=social)](https://twitter.com/ralex_uy) <!-- linkedin --> [![Linkedin](https://img.shields.io/badge/LinkedIn-+21K-blue?style=social&logo=linkedin)](https://www.linkedin.com/in/ronald-rivero/) <!-- github --> [![Github](https://img.shields.io/github/followers/ralexrivero?style=social)](https://github.com/ralexrivero/) <!-- vagrant --> [![Vagrant](https://img.shields.io/static/v1?label=&message=Vagrant%20Profile&color=1868F2&logo=vagrant&labelColor=2F333A)](https://app.vagrantup.com/ralexrivero) <!-- docker --> [![Docker](https://img.shields.io/static/v1?label=&message=Docker%20Profile&color=2496ED&logo=Docker&labelColor=2F333A)](https://hub.docker.com/u/ralexrivero)
