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

LETTERS_DIR="$(dirname "$0")"

source "$LETTERS_DIR"/letters-arrays.sh 

print_words() {
    local letter="$1"

    local lines=()
    
    for ((iN=0; iN<7; iN++)); do
        lines[$iN]=""
    done
    
    for ((iN=0; iN<${#letter}; iN++)); do
        local char="${letter:$iN:1}"
        local char_array
        
        case "$char" in
            "0") char_array=("${zero[@]}") ;;
            "1") char_array=("${one[@]}") ;;
            "2") char_array=("${two[@]}") ;;
            "3") char_array=("${three[@]}") ;;
            "4") char_array=("${four[@]}") ;;
            "5") char_array=("${five[@]}") ;;
            "6") char_array=("${six[@]}") ;;
            "7") char_array=("${seven[@]}") ;;
            "8") char_array=("${eight[@]}") ;;
            "9") char_array=("${nine[@]}") ;;
            "A") char_array=("${A[@]}") ;;
            "$(echo "Á")") char_array=("${acute_A[@]}") ;;
            "$(echo "Â")") char_array=("${circumflex_A[@]}") ;;
            "$(echo "À")") char_array=("${grave_A[@]}") ;;
            "$(echo "Ã")") char_array=("${tilde_A[@]}") ;;
            "$(echo "Å")") char_array=("${ring_A[@]}") ;;
            "$(echo "Ǎ")") char_array=("${caron_A[@]}") ;;
            "$(echo "Æ")") char_array=("${AE[@]}") ;;
            "$(echo "Ä")") char_array=("${trema_A[@]}") ;;
            "B") char_array=("${B[@]}") ;;
            "C") char_array=("${C[@]}") ;;
            "Č") char_array=("${caron_C[@]}") ;;
            "Ç") char_array=("${C_cedilla[@]}") ;;
            "D") char_array=("${D[@]}") ;;
            "E") char_array=("${E[@]}") ;;
            "$(echo "Ë")") char_array=("${trema_E[@]}") ;;
            "$(echo "É")") char_array=("${acute_E[@]}") ;;
            "$(echo "Ê")") char_array=("${circumflex_E[@]}") ;;
            "F") char_array=("${F[@]}") ;;
            "G") char_array=("${G[@]}") ;;
            "H") char_array=("${H[@]}") ;;
            "I") char_array=("${I[@]}") ;;
            "$(echo "í")") char_array=("${acute_I[@]}") ;;
            "$(echo "Ǐ")") char_array=("${caron_I[@]}") ;;
            "$(echo "Î")") char_array=("${circumflex_I[@]}") ;;
            "$(echo "Ï")") char_array=("${trema_I[@]}") ;;
            "J") char_array=("${J[@]}") ;;
            "K") char_array=("${K[@]}") ;;
            "L") char_array=("${L[@]}") ;;
            "Ł") char_array=("${L_cortado[@]}") ;;
            "M") char_array=("${M[@]}") ;;
            "N") char_array=("${N[@]}") ;;
            "O") char_array=("${O[@]}") ;;
            "$(echo "Ó")") char_array=("${acute_O[@]}") ;;
            "$(echo "Ô")") char_array=("${circumflex_O[@]}") ;;
            "$(echo "Õ")") char_array=("${tilde_O[@]}") ;;
            "$(echo "Ö")") char_array=("${trema_O[@]}") ;;
            "$(echo "Ø")") char_array=("${O_cortado[@]}") ;;
            "P") char_array=("${P[@]}") ;;
            "Q") char_array=("${Q[@]}") ;;
            "R") char_array=("${R[@]}") ;;
            "S") char_array=("${S[@]}") ;;
            "ẞ") char_array=("${scharfes_S[@]}") ;;
            "$(echo "Ș")") char_array=("${S_cedilla[@]}") ;;
            "T") char_array=("${T[@]}") ;;
            "$(echo "Ț")") char_array=("${T_cedilla[@]}") ;;
            "U") char_array=("${U[@]}") ;;
            "$(echo "Ú")") char_array=("${acute_U[@]}") ;;
            "$(echo "Ü")") char_array=("${trema_U[@]}") ;;
            "V") char_array=("${V[@]}") ;;
            "W") char_array=("${W[@]}") ;;
            "X") char_array=("${X[@]}") ;;
            "Y") char_array=("${Y[@]}") ;;
            "Z") char_array=("${Z[@]}") ;;
            "Ž") char_array=("${caron_Z[@]}") ;;
            "a") char_array=("${a[@]}") ;;
            "$(echo "á")") char_array=("${acute_a[@]}") ;;
            "$(echo "â")") char_array=("${circumflex_a[@]}") ;;
            "$(echo "à")") char_array=("${grave_a[@]}") ;;
            "$(echo "ã")") char_array=("${tilde_a[@]}") ;;
            "$(echo "å")") char_array=("${ring_a[@]}") ;;
            "$(echo "ǎ")") char_array=("${caron_a[@]}") ;;
            "$(echo "æ")") char_array=("${ae[@]}") ;;
            "$(echo "ä")") char_array=("${trema_a[@]}") ;;
            "b") char_array=("${b[@]}") ;;
            "c") char_array=("${c[@]}") ;;
            "ç") char_array=("${c_cedilla[@]}") ;;
            "$(echo "č")") char_array=("${caron_c[@]}") ;;
            "d") char_array=("${d[@]}") ;;
            "e") char_array=("${e[@]}") ;;
            "$(echo "ë")") char_array=("${trema_e[@]}") ;;
            "$(echo "é")") char_array=("${acute_e[@]}") ;;
            "$(echo "ê")") char_array=("${circumflex_e[@]}") ;;
            "f") char_array=("${f[@]}") ;;
            "g") char_array=("${g[@]}") ;;
            "h") char_array=("${h[@]}") ;;
            "i") char_array=("${i[@]}") ;;
            "$(echo "í")") char_array=("${acute_i[@]}") ;;
            "$(echo "ǐ")") char_array=("${caron_i[@]}") ;;
            "$(echo "î")") char_array=("${circumflex_i[@]}") ;;
            "$(echo "ï")") char_array=("${trema_i[@]}") ;;
            "j") char_array=("${j[@]}") ;;
            "k") char_array=("${k[@]}") ;;
            "l") char_array=("${l[@]}") ;;
            "ł") char_array=("${l_cortado[@]}") ;;
            "m") char_array=("${m[@]}") ;;
            "n") char_array=("${n[@]}") ;;
            "o") char_array=("${o[@]}") ;;
            "$(echo "ó")") char_array=("${acute_o[@]}") ;;
            "$(echo "ô")") char_array=("${circumflex_o[@]}") ;;
            "$(echo "õ")") char_array=("${tilde_o[@]}") ;;
            "$(echo "ö")") char_array=("${trema_o[@]}") ;;
            "$(echo "ø")") char_array=("${o_cortado[@]}") ;;
            "p") char_array=("${p[@]}") ;;
            "q") char_array=("${q[@]}") ;;
            "r") char_array=("${r[@]}") ;;
            "s") char_array=("${s[@]}") ;;
            "ß") char_array=("${scharfes_s[@]}") ;;
            "$(echo "ș")") char_array=("${s_cedilla[@]}") ;;
            "t") char_array=("${t[@]}") ;;
            "$(echo "ț")") char_array=("${t_cedilla[@]}") ;;
            "u") char_array=("${u[@]}") ;;
            "$(echo "ú")") char_array=("${acute_u[@]}") ;;
            "$(echo "ü")") char_array=("${trema_u[@]}") ;;
            "v") char_array=("${v[@]}") ;;
            "w") char_array=("${w[@]}") ;;
            "x") char_array=("${x[@]}") ;;
            "y") char_array=("${y[@]}") ;;
            "z") char_array=("${z[@]}") ;;
            "ž") char_array=("${caron_z[@]}") ;;
            ".") char_array=("${dot[@]}") ;;
            ",") char_array=("${comma[@]}") ;;
            ":") char_array=("${colon[@]}") ;;
            ";") char_array=("${semicolon[@]}") ;;
            "?") char_array=("${question[@]}") ;;
            "¿") char_array=("${inverted_question[@]}") ;;
            '!') char_array=("${exclamation[@]}") ;;
            '¡') char_array=("${inverted_exclamation[@]}") ;;
            "@") char_array=("${at[@]}") ;;
            "#") char_array=("${hash[@]}") ;;
            "\$") char_array=("${dolar[@]}") ;;
            "%") char_array=("${percent[@]}") ;;
            "&") char_array=("${and[@]}") ;;
            "°") char_array=("${degree[@]}") ;;
            "º") char_array=("${ordinal[@]}") ;;
            "ª") char_array=("${ordinalA[@]}") ;;
            "*") char_array=("${asterisk[@]}") ;;
            " ") char_array=("${space[@]}") ;;
            "+") char_array=("${plus[@]}") ;;
            "-") char_array=("${minus[@]}") ;;
            "_") char_array=("${underline[@]}") ;;
            "—") char_array=("${em_dash[@]}") ;;
            "–") char_array=("${en_dash[@]}") ;;
            "=") char_array=("${equal[@]}") ;;
            "(") char_array=("${open_parenthesis[@]}") ;;
            ")") char_array=("${close_parenthesis[@]}") ;;
            "[") char_array=("${open_bracket[@]}") ;;
            "]") char_array=("${close_bracket[@]}") ;;
            "{") char_array=("${open_brace[@]}") ;;
            "}") char_array=("${close_brace[@]}") ;;
            "<") char_array=("${less_than[@]}") ;;
            ">") char_array=("${greater_than[@]}") ;;
            "'") char_array=("${single_quote[@]}") ;;
            "\"") char_array=("${double_quote[@]}") ;;
            "$(echo "\`")") char_array=("${grave[@]}") ;;
            "^") char_array=("${circumflex[@]}") ;;
            "ˇ") char_array=("${caron[@]}") ;;
            "˚") char_array=("${ring[@]}") ;;
            "~") char_array=("${tilde[@]}") ;;
            "¨") char_array=("${trema[@]}") ;;
            "\\") char_array=("${backslash[@]}") ;;
            "/") char_array=("${slash[@]}") ;;
            "|") char_array=("${pipe[@]}") ;;
            "§") char_array=("${paragraph[@]}") ;;
            "£") char_array=("${pound[@]}") ;;
            "¢") char_array=("${cent[@]}") ;;
            $(echo "´")) char_array=("${acute[@]}") ;;
            "‘") char_array=("${open_single_quote[@]}") ;;
            "“") char_array=("${open_double_quote[@]}") ;;
            "’") char_array=("${close_single_quote[@]}") ;;
            "”") char_array=("${close_double_quote[@]}") ;;
        esac
        
        for ((jN=0; jN<7; jN++)); do
            # if [[ "$char" == "m" || "$char" == "w" ]]; then
            #     lines[$jN]="${lines[$jN]}${char_array[$jN]} "
            # else
                lines[$jN]="${lines[$jN]}${char_array[$jN]}"
            # fi
        done
    done
    
    for line in "${lines[@]}"; do
        echo "$line"
    done
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <string>"
    echo "Example: $0 Hello World!"
    exit 1
fi

nCols=$(tput cols)
str="$1"
nSize="${#str}"

shift

nArgs="$#"

for (( nn=0; nn<$nArgs; nn++ )); do
    TEMP="${str//[^wmŁẞ]/}"
    TEMP1="${1//[^wmŁẞ]/}"
    COUNT=${#TEMP}
    COUNT1=${#TEMP1}

    TEMPae="${str//[^æÆ£—]/}"
    TEMPae1="${1//[^æÆ£—]/}"
    COUNTae=${#TEMPae}
    COUNTae1=${#TEMPae1}

    TEMPsub="${str//[^IÍiíjlłǐǏîÎïÏ]/}"
    TEMPsub1="${1//[^IÍiíjlłǐǏîÎïÏ]/}"
    COUNTsub=${#TEMPsub}
    COUNTsub1=${#TEMPsub1}

    nSize=$(( $(( "${#str}" + ${#1} + 1 )) * 4 + COUNT + COUNT1 + COUNTae + COUNTae + COUNTae1 + COUNTae1 - COUNTsub - COUNTsub1 ))

    if [[ "$nSize" -le "nCols" ]]; then
        str+=" $1"
    else
        print_words "$str"
        echo
        str="$1"
    fi
    shift
done

print_words "$str"
