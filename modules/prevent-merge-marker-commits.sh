h1 "Prevent merge marker commits"

ERROR=0
for file in $(gitflow_commit_files); do
    if grep -Erls "^<<<<<<< |^>>>>>>>" $file >/dev/null ; then
    	gitflow_fail $file
    	ERROR=1
    fi
done

if [ $ERROR -eq 0 ]; then
	gitflow_ok "No merge markers found"
fi

return $ERROR