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

inputfile=$(basename "$1")
fname="${inputfile%.*}"
ext="txt"

DESTINO="${fname}.${ext}"

pandoc -f epub -t plain -o temp.txt "$1"
sed ':a;N;$!ba;s/\n/ /g;s/   / /g;s/  /\n /g;s/\[\]\n//g' temp.txt > "${DESTINO}"
sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' "${DESTINO}" > temp2.txt

cat temp2.txt | tr -d '\n' > temp.txt
mv temp2.txt "${DESTINO}"

cat temp.txt | sed 's/\. /\.\n/g;s/\; /\;\n/g;s/\: /\:\n/g;s/\] /\]\n/g' > "${DESTINO}.sentences.txt"
rm temp.txt

