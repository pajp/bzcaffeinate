#!/bin/bash

bzrunning () 
{ 
    ps auxc | grep -q bztransmit
}

log()
{
    logger -t bzcaffeinate "$@"
}

log "starting up"
while true; do
    if bzrunning; then
	if ! kill -0 %1 2> /dev/null ; then
	    caffeinate &
	    log "caffeinated"
	fi
    else
	if kill -0 %1 2> /dev/null ; then
	    log "no bztransmit running, killing caffeinate"
	    kill %1
	fi
    fi
    sleep 10
done
