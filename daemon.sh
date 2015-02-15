#! /bin/sh
### BEGIN INIT INFO
# Provides: @name
# Required-Start: $network $local_fs $remote_fs $syslog $network $time
# Required-Stop:
# Should-Start:
# Default-Start: 2
# Default-Stop:
# Short-Description: Runs at system start
# Description: Runs at system start
### END INIT INFO

PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Description"
NAME=
RUNUID=
RUNGID=
BASEDIR=/usr/bin/dir
#ETCDIR=/opt/data/$NAME/etc
RUNDIR=/var/run
PIDFILE=$RUNDIR/$NAME.pid
DAEMON=$BASEDIR/PATH/TO/BINFILE
#DAEMON_ARGS=$ETCDIR/beta.conf

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

# Read configuration variable file if it is present
[ -r /etc/default/$NAME ] && . /etc/default/$NAME

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions

do_start()
{
        # Return
        #   0 if daemon has been started
        #   1 if daemon was already running
        #   2 if daemon could not be started
        start-stop-daemon --start --quiet -c $RUNUID:$RUNGID \
                --pidfile $PIDFILE --chdir $RUNDIR \
                --exec $DAEMON --test > /dev/null \
                || return 1
        start-stop-daemon --start --quiet -c $RUNUID:$RUNGID \
                --pidfile $PIDFILE --chdir $RUNDIR --make-pidfile \
                --background --exec $DAEMON beta \
                || return 2
}

do_stop()
{
        # Return
        #   0 if daemon has been stopped
        #   1 if daemon was already stopped
        #   2 if daemon could not be stopped
        #   other if a failure occurred
        start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 \
                 --pidfile $PIDFILE --name $NAME
        RETVAL="$?"
        [ "$RETVAL" = 2 ] && return 2
        rm -f $PIDFILE
        return "$RETVAL"
}


case "$1" in
        start)
                [ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC" "$NAME"
                do_start
                case "$?" in
                0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
                2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
                esac
                ;;
        stop)
                [ "$VERBOSE" != no ] && log_daemon_msg "Stopping $DESC" "$NAME"
                do_stop
                case "$?" in
                0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
                2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
                esac
                ;;
        restart|force-reload)
                #
                # If the "reload" option is implemented then remove the
                # 'force-reload' alias
                #
                log_daemon_msg "Restarting $DESC" "$NAME"
                do_stop
                case "$?" in
                        0|1)
                                do_start
                                case "$?" in
                                        0) log_end_msg 0 ;;
                                        1) log_end_msg 1 ;; # Old process is still running
                                        *) log_end_msg 1 ;; # Failed to start
                                esac
                                ;;
                        *)
                                # Failed to stop
                                log_end_msg 1
                                ;;
                esac
                ;;
        *)
                echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
                exit 3
                ;;
esac

:
