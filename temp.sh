
cat <<END
set terminal wxt
set xdata time
set timefmt "%H-%M"
set xtics format "%H:%M"
plot '-' using 1:2 with boxes
END

while read LINE
do

    TIME=$(echo "$LINE" | cut -f 3 -d ,)
    H=$(echo "$TIME" | cut -c12-13)
    M=$(echo "$TIME" | cut -c15-16)
    TEMP=$(echo "$LINE" | cut -f 6 -d ,)
    
    #echo "$TIME"
    #echo "$H"
    #echo "$M"
    #echo "$TEMP"

    echo "$H"-"$M" "$TEMP"
done

echo e