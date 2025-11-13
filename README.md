

# **This is a work in progress!!!**

## Foreword

This guide is an attempt to make the power of computation accessible to researchers and scientists everywhere, and in particular, biologists. Whether you have used computers your whole life or are taking your first tentative steps into the digital world, I hope that this guide will enable you to see the power that lies behind the screen.

Andrew Budge


---
## Introduction:

*Biology is becoming an information science* - Leroy Hood

Biological data is being produced in unprecedented amounts. Not only is this data being generated, a significant portion of it is available through publicly accessibly databases. 

---
# The Terminal

## Introduction:

Most modern computer programs use graphically based interfaces, meaning that you 'see' what you are doing. You select options, drag and drop files, search through drop down menus, and click on buttons to accomplish tasks. A graphical user interface (shortened to "gui" or "GUI" and sometimes pronounced "Gooey") is easy to use, intuitive, and works for everyday use.

GUIs are not without limitations though. Typically, GUIs take up more space on a computer and consume more computational resources, as they are not only performing a designated task, but also rendering a visual output. GUIs also do not scale particularly well. If working with a few files, clicking a few options in a GUI to accomplish a task is time efficient and practical. However, when working with hundreds or even thousands of files, using a GUI very quickly becomes time consuming and monotonous.

Command line interfaces (CLIs) have no windows, icons, or menus. There is simply a line where a user will type commands that will be executed by pressing enter. Everything is text based, with results being text that is written to files or displayed on the screen. However, what CLIs lack in visualization and ease of use, they make up for in speed and efficiency. Thousands of files can be processed with a single command, and CLI programs are lightweight, using minimal storage and maximizing a computer's hardware. While the learning curve for CLIs is steeper than for GUIs, once mastered, CLI is incredibly fast and powerful.

With the ever growing amount of available biological data, using the command line and CLI tools has never been more beneficial. Datasets often contain thousands of files, and using a GUI to analyze and study them would not only be inefficient and tedious, but would also lack reproducibility - a cornerstone of good science. Command-line tools are not just advantageous -they are necessary for rigorous, reproducible, and efficient research.

## Command-line basics:

Using the command-line, like any skill, will take time and consistent practice to master. While this book and its contents will provide foundational knowledge, nothing I write or you read will replace actually opening a terminal and running these commands.

The command line is empty to begin with, but where you type starts with a symbol. In most cases, this will be a `$`, but some will use `%`. This is where you will type and execute commands. A command, at its most basic form, is a word or phrase that references a program on your computer. When you type a command and press enter, you are calling that program and telling it to run. Commands can range from simple utilities built into your system to complex programs written in languages such as Python or R. Some commands run independently, while others require you to provide additional information in the form of files or options. This extra information is called arguments.

### Directory Structures and Files: How a a computer stores and accesses information 

Before we type and run our first commands, there are some essentials we need to cover. Knowing how a computer stores information is critical to using a CLI. When using a GUI, we see a collection of icons and folders that represent the underlying structure. Directories (folders) are organized in a hierarchical structure. Think of it as an upside-down tree. The top is the root directory (the trunk), and directories branch out into sub-directories from there, which can contain more subdirectories, and so on. Each directory can contain files and other directories.

Another way to think of it is like a notebook. The whole notebook represents the entire directory structure. Within the notebook, we create specific sections for different topics or notes. These can be thought of as the sub-directories. Within each of these sections, notes and other information can be recorded, like different files such as PDFs or spreadsheets.

You are in control of how the directories and files within your computer are organized. **You are your own best and worst collaborator.** There are innumerable ways to organize information on your computer. The most important attributes of any organizational system are that it is consistent, scalable, and meaningful.

1. Consistent means using the same naming conventions and directory structure across all your projects. Naming one project `experiment_2024_sequencing` and another `seq-exp-2025` will mean trying work with two different naming conventions at the same time. The only thing worse then a trying to understand a poor naming convention is trying to understand a project that uses two. Feel free to experiment in the beginning with what works for you, but when you do find one that does, stick with it. 

2. Scalable means your system works with any number of files. Whether the project involves 10 files or 1000's, your system for naming files and creating directories should be able to handle both. A folder simply named `data` might work fine at first, but becomes quickly become useless when you have multiple datasets. Using descriptive names like `raw_data`, `processed_data`, and `analysis_results`, will ensure that your project will be able to grow effectively.

3. Meaningful (or non-trivial) means your file and directory names convey important information at a glance. A file named `data1.txt` tells you nothing about the contents of the file. A file named `2025_E.coli_growth_curve_replicate1.txt` tells you the date, organism, experiment type, and replicate number. Utilizing meaningful names ensures more time is spend performing analysis and less time searching though files to find the right one. 

### Paths: How you and a computer know where files and directories are at

Now that we know how a computer stores information, we can look at how to access it. Imagine you want to visit a friend who just moved to your city. You wouldn't wander around knocking on random doors - you'd ask for their address. Files and directories work the same way. Every file and directory has its own "address" within your computer called a **path**. Paths are how you tell the computer exactly which file or directory you want to work with.

#### What does a path look like?

A path is a string of directory names separated by forward slashes (`/`). Here's an example:
```
/home/user/projects/experiment_data/results.txt
```

This path tells you exactly where the file `results.txt` lives on your computer. Reading from left to right, you start at the root directory (`/`), move into `home`, then `user`, then `projects`, then `experiment_data`, and finally arrive at `results.txt`. Each `/` is like a step down into the next directory.

If we visualize this as a tree structure, it looks like this:
```
/ (root)
└── home/
    └── user/
        └── projects/
            └── experiment_data/
                └── results.txt
```

The path is just the route you take through the branches to reach your destination.

#### Absolute vs Relative Paths

There are two types of paths: absolute and relative.

**Absolute paths** start from the root directory and give the complete address. They always begin with a `/`. No matter where you are on your computer, an absolute path will always point to the same location.
```
/home/user/projects/experiment_data/results.txt
```

Think of it like giving someone your full street address. It doesn't matter where they're starting from - they can find you.

**Relative paths** start from your current location. They don't begin with a `/` and are like giving directions from where you are now.
```
experiment_data/results.txt
```

This path assumes you're already in the `/home/user/projects/` directory. Think of it like telling your friend "I'm two blocks north of the store" - it only makes sense if they know where the store is.
#### Path Shortcuts

There are a few special symbols that make navigating with paths easier:

- **`.`** (single period) = current directory (where you are right now)
- **`..`** (two periods) = parent directory (one level up)
- **`~`** (tilde) = your home directory
- **`/`** (forward slash by itself) = root directory
---
## Navigation: Going from one place to another

Command-line is not a graphical user interface. Rather than using a mouse and clicking on icons and dragging files, you use commands and text to move around. This section will teach some commands of how to navigate and find files within a computer.

### pwd: Where am I?

You have to know where you are in order to know how to get where you want to go. the command `pwd` (Short for print working directory), will print to the terminal where you are currently. Example:

```bash
$ pwd 
/home/user/directory
```

**Reflection:** What ways can this be used beyond finding where you currently are in a computer system?

### ll and ls: What's in here?

In a graphical user interface, it is very easy to see what is in a folder. In command-line, we have to ask to see what is in a particular folder. Two very easy ways to do that are with the commands `ls` and `ll`. Both accomplish the same task, but in different formats.

#### ls

Using the `ls` will print a very simple list of the files and directories in your current working directory. Typically files and directories will be represented by different colored texts (another way to tell is that directories do not have extensions).

```
$ ls 
file1.txt file2.txt sub_directory
```

#### ll

`ll` will print the same information as `ls`, but with more details (in fact, for most systems, `ll` is just an alias for `ls -l`). This includes information such as the size of the file, the date it was last modified, file privileges, the owner of the file, and more.

```
$ ll 
total 24 
-rw-r--r-- 1 user group 1024 Oct 10 14:23 file1.txt 
-rw-r--r-- 1 user group 2048 Oct 11 09:15 file2.txt 
drwxr-xr-x 5 user group 160  Oct 12 16:42 sub_directory
```

### cd: How do I move around?

Now that you know where you are and what is around you, you can move around. `cd` (short for "change directory") is how you can accomplish that. `cd` requires an argument, the path to directory you want to move to.

```
$ cd directory/sub_directory
```

Using `cd` without an argument will take you back to your home directory.  

---
## Creating Directories and files

### mkdir: How do I make a directory?

### touch: How do I make a file?

### mv: How do I move directories and files around?

### cp: How do I copy files and directories?

```bash
$ls
test_file.txt
$ cp test_file.txt subdirectory/test_file_copy.txt
$ ls subdirectory/
test_file_copy.txt
```

### rm: How do I delete files?
### rmdir: How do I remove directories?

---
## Using command-line tools:

