
while true
do
clear
	echo
	printf "Enter Your Name to continue Quiz or close the window to exit: "
	read Full_Name </dev/tty
	echo

cnt=3;until [ $cnt -eq 0 ]; do printf "\rYour Quiz will start in $cnt seconds.... ";sleep 1;cnt=$(expr $cnt - 1);done;

echo

clear
score=0
total_questions=0
while IFS='#' read -r question choices answer
do 
    echo
    echo "========================================================================" 
    echo "                               Quiz                                     " 
    echo "                 Write Only option on the Your Answer                   " 
    echo "========================================================================" 
    echo
    echo $question
	echo
    echo $choices
	echo
	printf "Your Answer:"
	read student_answer </dev/tty
        answer=$(echo $answer | awk '{$1=$1;print}')
	if [ "$student_answer" = "$answer" ]; then
		score=`expr $score + 1`
	fi
	clear
		total_questions=`expr $total_questions + 1`
done <quiz.txt
echo    
echo "Hi There" $Full_Name","
echo    
echo "Your Score is               :  $score out of $total_questions"
echo "Your Score Percentage is    : " $(awk "BEGIN { printf \"%.2f\", $score/$total_questions*100 }")
echo

             printf "Press Enter Key to Continue"
             read Enter_Key </dev/tty

# echo $Full_Name '\t' '\t' $score "/" $total_questions '\t' '\t' $(echo "scale=2; $score/$total_questions*100"|bc -l) "%" '\t' $Quiz_Start_Time '\t' $Quiz_End_Time >> Students_Score.txt

printf "%-30s %-20s %-10s \n" "$Full_Name" "$score "/" $total_questions" $(awk "BEGIN { printf \"%.2f\", $score/$total_questions*100 }")  >> Students_Score.txt
done
echo
