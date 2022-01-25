# Linux commands
#### 20 Jan 2022
- Commands learned
```
cat
less
mkdir
Some Git commands[Includes clone]
history
```

#### 21 Jan 2022
- Commands learned
```
- Leared abot date and cal commands.
- Discussed about backups and rename[mv] commands
- To create a EMPTY file  # touch
- Create a file with CAT COMMAND # cat >> filename 
- To find hidden files # ls -la
- List the files with sorting manner # ls -lrt
- Create a directory # mkdir
- Create a file with data # vi filename
- Remove a file # rm filename
- Remove a director/folder # rm -rf directoryName
```

#### 24 Jan 2022
- Discussed topics
```
- Usage of ls, file permissions[chmod].
- r=4, w=2, x=1, user permissions[chown]
- Disk free[df -h] on a instance.
- Disk usage[du -sh *], it lists all file and directories usage.
- Verify app logs[/var/logs/]
- Usage of top command. 
```

#### 25 Jan 2022
- Discussed topics
```
- wc: word count[wc -l, wc <FILENAME>]
- grep: It is a search utility in Linux. Ex: grep WORD <FILENAME>/<DIRECTORY>
- vi editor:
Usage: vi <FILENAME>
Esc + i = Insert mode
Esc + u = Undo
Esc + o = New line[Include Insert]
Esc + i -> Esc + : -> %s/<WORD-WHICH-YOU-WANT-TO-REPLACE>/<RESULTANT-WORD>/g [Ex: %s/Linux/Ubuntu/g]
Esc + :<LINENumber> =  To go to specific line to Edit[Ex: Esc + :10 + Enter]
Esc + 0 = To come to the start of the line in a file
Esc + shift + A = To goto the END of the line
Esc + dd = Delete a line.
Esc + 2 + dd = Delete 2 lines in a row.
Esc + shift G = To go to end of the file.
Esc + gg = To go to start of the file.
Esc + shift V + d = To select and delete lines.
Esc + shift V -> Select lines -> Shift : -> s/<WORD YOU WANT TO REPLACE>/<RESULTANT-WORD>/g

- sed: Stream editor, 
Ex:
Dry run:
sed 's/Ganesh/Sudheer/g' FILENAME

Replace a word in a file:
sed -i 's/Ganesh/Sudheer/g' FILENAME

- find:

- locate:
- awk
```

