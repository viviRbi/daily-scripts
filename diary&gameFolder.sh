#!/bin/bash

# Write diary then open game folder

TARGET_DIR="/d/renpy/project/VicousFate"

current_date=$(date "+%A, %B %d, %Y") 
current_time=$(date "+%I:%M %p")  
current_timezone=$(date "+%Z") 

# function
open_target_folder() {
  cd "$TARGET_DIR" || {
    echo "❌ Failed to cd to $TARGET_DIR"
    exit 1
  }
  explorer.exe .
}


speak_hi() {
	powershell.exe -Command "
  Add-Type -AssemblyName System.Speech;
  \$synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer;
  \$synth.Rate = -2; # negative = slower speech
  \$message = 'Hello, V. Today is $current_date, and as the clock strikes $current_time, the world continues its endless dance, moving through time and space.';
  \$synth.Speak(\$message)
"
}

speak_thank_you() {
	powershell.exe -Command "
    Add-Type -AssemblyName System.Speech;
    \$synth = New-Object System.Speech.Synthesis.SpeechSynthesizer;
    \$synth.Rate = -2;
    \$synth.Speak('Thank you for sharing your thoughts with me. In a world constantly moving, it''s the moments of reflection, like this one, that remind us of the romance woven into our experiences. Just as the stars shine quietly above, our lives unfold in a dance of fleeting moments, each one holding its own quiet beauty.')
  "
}


# Start here
open_target_folder

speak_hi

#echo "How do you feel today?"
#read user_feeling

#if [ -z "$user_feeling" ]; then
#  echo "No input detected."
#  speak_thank_you
#  open_target_folder
#  exit 0
#fi

diary_file="$HOME/Desktop/diary.md"


# save to diary file
#echo -e "-------\n$(date "+%Y-%m-%d %I:%M %p")\n$user_feeling" >> "$diary_file"



#speak_thank_you

