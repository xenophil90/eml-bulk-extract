# My workflow to bulk-extract email attachments

This workflow can be used to extract all attachments from a bunch of .eml files.

## 1. Randomly name every .eml file

```
find /path/to/folders -type f -name '*.eml' -execdir helper.sh {} ";"
```
*helper.sh* is part of this repository.

## 2. Copy all the .eml files into one single folder

```
find /path/to/folders -type f -name '*.eml' -exec cp -i {} /path/to/destination  \;
```

## 3. Create one folder per .eml file and extract the .eml contents into that directory

```
for file in *.eml; do
    mkdir $file-Attachements
    ripmime -i $file -v -d $file-Attachements
done
```

## 4. Delete all text files

```
find . -name 'textfile*' -exec rm {} \;
```

## 5. Delete all empty folders

```
find . -empty -type d -delete
```
