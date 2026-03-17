#!/usr/bin/env bash
#
#   MorceReader™ - A terminal experience in a reading
#   Copyright © 2026 Amilcar Antonio Mesquita Rizk
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

APP_DIR="$(dirname "$0")"

filename="$1"

IFS=$'\n'
arr=(`ls -1 $PIPER_VOICES/*.onnx | cat`)

speed=0.9

# length_scale: let it always = 1; adjust speed parameter above instead
length_scale=1.0
# silence between sentences is default to 0.2 on piper
silence=0.4

phoneme_length=$(echo "scale=4; $length_scale / $speed" | bc)

count=${#arr[@]}

while :
do
    clear
    echo "Available voice models"
    echo "----------------------"
    echo

    for ((j = 0; j < count; j++))
    do
        printf "%#3d - %s\n" "$j" $(basename ${arr[$j]})
    done

    echo
    echo "Speed: $speed"
    echo "Phoneme length: $phoneme_length"
    echo "Silence duration: $silence"
    echo
    echo -n "Type a voice number: "
    read i
    echo

    name=$(basename -- "$filename" .epub)
    "$APP_DIR"/../Tools/epub2text.sh "$filename"
    
    

    if [ ! x"$i" == x"" ]
    then
        voice_model=$(basename ${arr[$i]})
        person=$(echo ${voice_model} | cut -d'-' -f2)
        lang=$(echo ${voice_model} | cut -d'-' -f1)
        echo "Listening to: [ $person ] .......... "
        echo "    Language: [ $lang ] "
        
        echo
#        echo -n "Type 1 to read sentence by sentence; 2 to read whole paragraphs: "
#        read op
#    
#        if [[ "$op" -eq 1 ]]; then    
            filename="${name}.txt.sentences.txt"
#        else
#            filename="${name}.txt"
#        fi

        sample_rate=$(cat "$PIPER_VOICES/${voice_model}.json" | jq '.audio.sample_rate')
        
        while IFS=$'\n' read line;do
            if [[ $(echo "$line" | tr -d ' ') != "" ]]; then

                IFS=' ' 
                aLine=( $(echo $line) )
                                
                echo "$line" |  piper --model $PIPER_VOICES/${voice_model} --output-raw 2>/dev/null | aplay -r $sample_rate -f S16_LE -t raw - 2>/dev/null &
                pPID=$!
                "$APP_DIR"/../Letters/print_letters.sh $(echo ${aLine[@]}) #| less
                wait $pPID
            fi
        done < <(cat "${filename}")
        
        echo "------------------------------------------------------------------------------"
        
    else
        break
    fi
done


