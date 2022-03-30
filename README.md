# Linux Bash Scripts
Trying to learn some bash scripting and to automate some of the processes coming up I'll need to get a few fresh installs going.
Of course I guess I could just make a fresh image and use that as a template too using VMware but here I am making scripts!

The main goal is to focus on a Distro and make it easier to get stuff going quicker without remembering a billion different things.

As I grow as a bash scripter so will the scripts, hopefully they will become better and work flawlessly. Right now it appears that I've been working more with Rocky Linux so that will be the focus for now.

Eventually, I may end up working more with some more Ubuntu based scripts again.

For some reason I cannot figure out how to commit to the release, so I'll have to commit the scripts to the Linux Repo, then I'll manually upload the releases. Just to give everyone and my self that it has been worked on.

It also has occured to me that its best to just make the script in Linux. Whenever I've saved the script in Notepad++ and try to grab from github it would throw an error.
The Error Code was - "/bin/bash^M: bad interpreter"

To fix it while in Linux I had to do this - 

Run following command in terminal
sed -i -e 's/\r$//' scriptname.sh

I plan on making a video and a blog post soon on the website. 
