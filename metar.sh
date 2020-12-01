
if [ "$#" == 2 ]
then

	D=$(echo "$1" | cut -c1-2)
	M=$(echo "$1" | cut -c4-5)
	Y=$(echo "$1" | cut -c7-10)

	START=$(echo $(date -d "$M"/"$D"/"$Y" +'%s'))
	END=$(echo "$START" + 24*60*60 | bc)

	curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$2"'&startTime='"$START"'&endTime='"$END"'' | grep "$2"

elif [ "$#" == 1 ]
then

	YS=$(echo $(date -d yesterday +"%d-%m-%Y"))

	#echo "$YS"

	D=$(echo "$YS" | cut -c1-2)
	M=$(echo "$YS" | cut -c4-5)
	Y=$(echo "$YS" | cut -c7-10)

	#echo "$Y"

	START=$(echo $(date -d "$M"/"$D"/"$Y" +'%s'))

	#echo "$START"

	END=$(echo "$START" + 24*60*60 | bc)

	curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$1"'&startTime='"$START"'&endTime='"$END"'' | grep "$1"


else
	echo zle zadany vstup
	exit -1
	
fi