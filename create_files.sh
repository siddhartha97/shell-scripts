#!/bin/bash
if [ -z "$1" ]; then echo "Enter directory name, number of files, programming language""; exit 1; fi
if [ -z "$2" ]; then echo "Enter number of files, programming language"; exit 1; fi
if [ -z "$3" ]; then echo "Enter programming language"; exit 1; fi
echo "Creating directory with $1"; cd $PWD; rm -r $1 > /dev/null 2>&1; mkdir $1; cd $1
echo "Creating $2 $3 files"
mapinit() {
	echo "Creating map into temp directory"
	rm -rf /tmp/hashmap.$1
    mkdir -p /tmp/hashmap.$1
}
mapput() {
	printf "$3" > /tmp/hashmap.$1/$2
}
mapget() {
    cat /tmp/hashmap.$1/$2
}
mapinit hmap
mapput hmap "c" "c"
mapput hmap "c++" "cpp"
mapput hmap "python" "py"
mapput hmap "java" "java"
mapput hmap "go" "go"
mapput hmap "golang" "go"
for i in `seq 1 $2`; do
	prog_lang="$(tr [A-Z] [a-z] <<< "$3")"
	echo "Creating file: $i.$(mapget hmap $prog_lang)"; touch "$i.$(mapget hmap $prog_lang)"
done
subl $PWD/*