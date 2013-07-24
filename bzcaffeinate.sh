bzrunning () 
{ 
    ps auxc | grep -q bztransmit
}

while true; do
    date
    if bzrunning; then
	if kill -0 %1 2> /dev/null ; then
	    echo "caffeinate already running" 
	else
	    caffeinate &
	    echo "caffeinated"
	fi
    else
	if kill -0 %1 2> /dev/null ; then
	    echo "no bztransmit running, killing caffeinate"
	    kill %1
	fi
    fi
    sleep 600
done
