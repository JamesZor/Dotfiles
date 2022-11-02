#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
# alias alias_name="command_to_run"
# test to pass arg
alias myalias='function _myalias() { echo "Hello $*"; unset -f _myalias; }; _myalias'

# pe lab
alias loadex='sudo mount /dev/sdc /mnt/usbstick/  && ls /mnt/usbstick/ &&  sudo mv /home/james/Maths/pervasive_computing/exercise_3.LPC1768.bin  /mnt/usbstick/ && ls /mnt/usbstick/ && sudo umount /dev/sdc'
alias loadrex='sudo mount /dev/sdb /mnt/usbstick/  && sudo rm /mnt/usbstick/exercise_3.LPC1768.bin &&  sudo mv /home/james/Maths/pervasive_computing/exercise_3.LPC1768.bin  /mnt/usbstick/ && ls /mnt/usbstick/'

#matlab run 
alias rmatlab='function _rmatlab() { matlab -nodesktop -nosplash -r "try, run $*, pause, catch, end, quit"; unset -f _rmatlab; }; _rmatlab'
alias cmatlab='function _cmatlab() { matlab -nodesktop -nosplash -r "try, run"; unset -f _cmatlab; }; _cmatlab'
#alias rmatlab='matlab -nodesktop -no'
# java stu commands
# create .jar
#alias jarmk='function _jarmk() { jar cvf $*.jar $*.class &&  }'

#Haskell stack
alias ghci='stack ghci'

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias rm='rm -i'
# Goose and gander
alias goose='cd /home/james/VUCampusRadio/Goose\&Gander/ && ranger'

# java 
alias mod3='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/program/module3/" '
alias mod4='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module4/" '
alias jcmod='javac -cp "/home/james/Maths/java/*" '

# Maths folder
alias maths=' cd /home/james/Maths/ && ranger'
alias javf=' cd /home/james/Maths/jave/ && ranger'
