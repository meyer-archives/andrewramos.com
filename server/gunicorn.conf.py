backlog = 2048              # The listen queue size for the server socket
bind = "127.0.0.1:29000"     # Or "unix:/tmp/gunicorn.sock"
daemon = False              # Whether work in the background
debug = True #False               # Some extra logging
keepalive = 2               # Time we wait for next connection (in seconds)
logfile = 'logs/gunicorn.log' # Name of the log file
loglevel = 'info'           # The level at which to log
pidfile = 'gunicorn.pid'
workers = 6                 # Number of workers to initialize
umask = 0                   # Umask to set when daemonizing
#user = None                 # Change process owner to user
#group = None                # Change process group to group
#proc_name = None            # Change the process name
spew=False                  # Display trace
timeout=30                  # Worker timeout
#tmp_upload_dir = None       # Set path used to store temporary uploads
#worker_class = "egg:gunicorn#sync"    # The type of request processing to use
#worker_class = 'egg:gunicorn#eventlet'
#worker_connections=1000     # Maximum number of simultaneous connections

after_fork=lambda server, worker: server.log.info(
        "Worker spawned (pid: %s)" % worker.pid)

before_fork=lambda server, worker: True

before_exec=lambda server: server.log.info("Forked child, reexecuting")

when_ready=lambda server: server.log.info("Gunicorn started, listening on %s." % bind)
