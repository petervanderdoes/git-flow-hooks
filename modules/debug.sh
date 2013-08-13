if [ $(gitflow_count_commit_files php) -eq 0 ] ; then
	return 0
fi

h1 "Debug code detect module"

ERROR=0
for file in $(gitflow_commit_files php); do
    if egrep -n 'debugger|alert' $file >/dev/null ; then
		gitflow_fail $file
		egrep -n 'debugger|alert' $file
        ERROR=1
	else
		gitflow_ok $file
	fi
done

return $ERROR