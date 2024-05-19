for i in *.pdf; do echo $i && pdfinfo "$i" | grep "^Pages:"; done > page-nos.txt
for i in *.pdf; do pdfinfo "$i" | grep "^Pages:"; done | awk '{s+=$2} END {print s}' > sum-page-nos.txt
