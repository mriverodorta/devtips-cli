# Devtips CLI
The Devtips Command Line Interface is a simple bash tool for create new projects based on the [Devtips Starter Kit](http://devtipsstarterkit.com) from [@DevTipsShow](https://twitter.com/DevTipsShow).

## Install
To install the Devtips CLI you need to download the one that fits your Operating System from the folder above. After you have the file on your system, follow the instructions for your OS.

#### Mac/Linux
You should put the cli where you can execute it as a command from everywhere in the terminal. The mostly used place is `/usr/local/bin` and then apply user permission to execute the script.
```
sudo cp devtips.sh /usr/local/bin/devtips
sudo chmod 700 /usr/local/bin/devtips
```
Now you can use the devtips command in the terminal. If it doesn't work maybe you should close the terminal and open it again.

#### Windows
Windows users can put the script anywhere you want. I have them in `C:\prompt-utils` but feel free to find your location. Next you need to include the directory on the **path** environment var. Go to Windows Explorer, right click on Computer, click on properties, click Advanced System Setting on the left side, click on the Environment Variables button, find path variable on User Variables and doble click on it, On the Variable Value put a **;** at the end and paste the address of your scripts folder like this `;C:\prompt-utils`. Accept all the dialogs and open a new command prompt and type `devtips -v`. It should give you back the script version.

## Usage
```
devtips [option|project-name] project-name
Options
  -sass         Create a project with the default Devtips-Starter-Kit
  -jekyll       Create a project with the jekyll version of the Devtips-Starter-Kit
  -gulp         Create a Gulp based project with the Devtips-Starter-Kit
  -h|-help      Show this help message
  -v|-version   Show the version of the Devtips CLI
Example
  devtips -gulp new-project
    Will create a new folder named "new-project"
    with the gulp structure of Devtips-Starter-Kit
```

## Feedback
If you find any errors, open an issue here on github or tweet me at @mriverodorta
