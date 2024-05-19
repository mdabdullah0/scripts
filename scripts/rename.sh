for pdf in *.pdf
do
    mv "$pdf" "$(less "$pdf" | sed -e '/^\s*$/d' -e 's/ \+/ /g' | sed '1q;d').pdf"
done
