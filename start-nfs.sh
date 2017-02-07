#!/bin/sh

exportfs -o "rw,sync,no_subtree_check,no_root_squash,fsid=0" *:/media/storage
rpcbind 
rpc.statd 
rpc.nfsd 
exec rpc.mountd --foreground
