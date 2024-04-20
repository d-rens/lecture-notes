# lecture-notes
Scripts and templates to for lecture notes in mathematics.

## Usage
Set the directory variable for figures in `main.sh`:
```sh
dir="$HOME/lecture-notes/assets"
short_dir="assets"
```

Call the script within your text editor with `main.sh a` to execute all the functions.
A xournalpp window will open with the given template and on save it's added in the `$dir` and ready to compile in LaTeX.

To call the scripts from the folder in the lecture-notes add the path, e.g. to your .zshrc:
```zsh
export PATH="$HOME/lecture-notes/scripts:$PATH"
```

## Info
The workflow is supposed to consist out of the following programs:
- bash for the scripting
- dmenu to select things
- latex for the document compilation
- xournalpp for the notes by hand

*and meta programs:*
- nvim for vimtex
- zathura as pdf viewer


## Goals
- operatable without any resistance (hotkeys)
- should be minimal

