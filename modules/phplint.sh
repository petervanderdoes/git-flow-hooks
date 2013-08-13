if [ $(gitflow_count_commit_files php) -eq 0 ] ; then
	return 0
fi

h1 "PHPLint module"

ERROR=0
for file in $(gitflow_commit_files php); do
    if php -l $file 2>&1 | grep 'No syntax errors' >/dev/null ; then
    	gitflow_ok $file
    else
        gitflow_fail $file
       	echo $(php -l $file) | sed "s/^/         ${GREY}--> /"
        ERROR=1
    fi 
done

return $ERROR