#!/bin/bash


i=1 #used to increase the format basename[001].jpeg
order=$( printf "%03d" $i) #printf gives the format "00" to i, i increments accordingly to the program 
newname=$1$order.$2#newname holds "1stargument00i.2ndargument"
for file in *; #loop through each item in the directory this bash script is executing
do
	if [ -d ] #if [ True ] meaning if it is a directory skip it go to next item
	then
		continue
	fi
	
	if [ ! -e  "$newname" ] && [ $file != "renumber.sh" ] #if newname doesn't exist and is not renumber.sh
	#we are already looping through the names inside the directory via the first for loop above... so when "-e" looks for newname is only going to look for it in the current directory where we are executing the bash script
	then
		mv $file $newname  #rename file to newname
	else
		#echo $newname exists
  	while [ -e "$newname" ]; #Once newname does not exist on directory get out of loop
  	do
			if [ $file = $newname ] #since newname exists... is newname the current file im looking at?
			then
				break  #if yes get out
			else
				#echo $newname exists but it doesn\'t match current file $file so I am gonna add 1 and keep trying inside the while loop
				((i++))
				order=$( printf "%03d" $i)
				newname=$1$order.$2
			fi
		done
		if [ ! -e  "$newname" ] && [ $file != "renumber.sh" ]
		then
			#echo newname was not found so I am going to change the file name to newname
			mv $file $newname
		fi
	fi
done
		
		
		
		
  
  

