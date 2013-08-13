if [ $(gitflow_count_commit_files js) -eq 0 ] ; then
	return 0
fi

JSHINT="jshint"

h1 "JSHint module"

ERROR=0
for file in $(gitflow_commit_files js); do
    if $JSHINT --config="$HOOKS_DIR"/jshint.json $file 2>&1 | grep 'error' >/dev/null ; then
        gitflow_fail $file
        $JSHINT --config="$HOOKS_DIR"/jshint.json $file | sed "s/^/         ${GREY}--> /" | sed '$ d' | sed '$ d'
        ERROR=1
    else
    	gitflow_ok $file
    fi  
done

return $ERROR