# Week 1 Terminal Cheatsheet

## Navigating
- `pwd`, print working directory, displays the full pathing to the current directory you are in
- `ls`, list, provides a list af all of the contents within the directory you specify to look into, `-attributes hidden` will help identify only hidden files, `-force` will idenitfy all files including thos which are hidden 
- `cd`, change directory, navigational tool within the terminal can use absolute navigation from the root source or relative based from the current directory you are within
- `tab`, acts as a shortcut in navigation can help autocomplete directory or file names
- `.`, refers to the current directory you are in
- `..`, refers to the directory one above the current directory
- `~`, refers to the home directory
- `$`, refers to a variable, variable will only be interpolated if surrounded by double quoted not single quotes

## Files and Folders
- `mkdir`, make directory, creates a new directory
- `ni`, new item, created an empty file, can create multiple files at once just use a comma as a separator between them, can't create a directory or in the case you try to create one in a file that doesn't exist the directories have to exist already
- `contents > file name`, > will place the specified contents into the specified file
- `cat filename`, cat will display the contents of the file specified
- `cp`, will copy a file and keep the original file as well
- `mv`, will move a file, if moved to the same location with a different name it will simply rename the file

## Safety Habits
- `rm`, remove, will delete specified contents, always do a check using ls beforehand to make sure you are only removing what you want to remove, there's no recycling bin, `del, rmdir, ri` are all aliases of rm
- `-WhatIf`, attaching this will perform a dry run, provides an output stating what the output of running the command will be without actually running it e.g What if: Performing the operation "Remove Directory" on target "C:\Projects\practice\drill\".
- `-recurse`, means to apply the command to the thing and everything inside it to any depth
- The key habit for safetu is to run the check, read the check result against the desired goal and ensure output matches the desired outcome, the result of the read will determine whether the next command acted is a fix to reach the desired goal or a commit/run

## Wildcards
- `*`, wildcard, means that anything matches e.g. *.txt will filter for every .txt file

## Extras
- `tree /f` will provide a structure tree breakdown from the current or specified directory down showing all its subdirectories and files within them
- `command -?`, the -? will provide a breakdown of the commands function and use cases

## VS code navigation
- `code .`, will open vs code onto the current directory
- ctrl + shift + p, opens the command pallete, a search bar which allows you to find every available command in vs code and its shortcut if it has one
- ctrl + ', opens the panel terminal which is the same as the powershell, it will open it on the current directory we are in in vs code
- when adding new content on vs code before being saved it will be on the vs code memory but not on the actual disk so when using the cat command it still only has the old bytes, we know its not saved if the white circle is on the vs code tab
- ctrl + p, quick open  