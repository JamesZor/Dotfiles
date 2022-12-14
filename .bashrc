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
alias matlab="/home/james/.matlab_bin/bin/matlab"
alias rmatlab='function _rmatlab() { matlab -nodesktop -nosplash -r "try, run $*, pause, catch, end, quit"; unset -f _rmatlab; }; _rmatlab'
alias cmatlab='function _cmatlab() { matlab -nodesktop -nosplash -r "try, run"; unset -f _cmatlab; }; _cmatlab'
#alias rmatlab='matlab -nodesktop -no'
# java stu commands
# create .jar
alias jarmk='function _jarmk() { jar cfM  $*-jzk340.jar *.java; }; _jarmk'

#Haskell stack
alias ghci='stack ghci'

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# For safety deleting files
alias dfile='rm -i'
# If you are a 101% sure
alias iknowwhatimdoing='rm'

# Goose and gander
alias goose='cd /home/james/VUCampusRadio/Goose\&Gander/ && ranger'

# java 
alias mod3='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/program/module3/" '
alias mod4='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module4/" '
alias mod5='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module5/" '
alias mod6a='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module6/not_graded/" '
alias mod6='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module6/" '
alias mod7='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module7/" '
alias mod8='java -cp "/home/james/Maths/java/libUI.jar:/home/james/Maths/java/code/Module8/" '
alias jcmod='javac -cp "/home/james/Maths/java/*"'
alias jcrun='javac -cp "/home/james/Maths/java/*" *.java  && mod8 Life'
alias jr='javac   *.java  && java '
# Maths folder
alias maths=' cd /home/james/Maths/ && ranger'
alias javf=' cd /home/james/Maths/jave/ && ranger'

export PATH="$(python3 -m site --user-base)/bin:${PATH}"
