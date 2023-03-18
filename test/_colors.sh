# https://gist.github.com/unicornist/6ddb669d9e6da9f3cd6a8ee75c3f4469

black="\033[0;30m"
blackb="\033[1;30m"
white="\033[0;37m"
whiteb="\033[1;37m"
red="\033[0;31m"
redb="\033[1;31m"
green="\033[0;32m"
greenb="\033[1;32m"
yellow="\033[0;33m"
yellowb="\033[1;33m"
blue="\033[0;34m"
blueb="\033[1;34m"
purple="\033[0;35m"
purpleb="\033[1;35m"
cyan="\033[0;36m"
cyanb="\033[1;36m"

end="\033[0m"

function black {
	echo -e "$black$@$end"
}

function blackb {
	echo -e "$blackb$@$end"
}

function white {
	echo -e "$white$@$end"
}

function whiteb {
	echo -e "$whiteb$@$end"
}

function red {
	echo -e "$red$@$end"
}

function redb {
	echo -e "$redb$@$end"
}

function green {
	echo -e "$green$@$end"
}

function greenb {
	echo -e "$greenb$@$end"
}

function yellow {
	echo -e "$yellow$@$end"
}

function yellowb {
	echo -e "$yellowb$@$end"
}

function blue {
	echo -e "$blue$@$end"
}

function blueb {
	echo -e "$blueb$@$end"
}

function purple {
	echo -e "$purple$@$end"
}

function purpleb {
	echo -e "$purpleb$@$end"
}

function cyan {
	echo -e "$cyan$@$end"
}

function cyanb {
	echo -e "$cyanb$@$end"
}