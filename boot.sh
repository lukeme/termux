#! /data/data/com.termux/files/usr/bin/bash
# 2020-5-11
# ngrok 和 pgsql 启动脚本
# 

ngrok_BIN=/data/data/com.termux/files/home/ngrok_android

case "$1" in
  (ngrok|ng)
    echo -n "ngrok start... "
	case "$2" 
		in (bible|gogs|web)
			$ngrok_BIN -config=ngrok.cfg start $2
		;;
		*)
			echo "Usage: $0 ngrok{bible|gogs|web}"
			exit 1
		;;
	esac
  ;;
  (pgsql|pg)
	case "$2"
		in (start|stop|status)
			pg_ctl -D $PREFIX/var/lib/postgresql $2
		;;
		*)
			echo "Usage: $0 pgsql{start|stop|status}"
			exit 1
		;;
	esac
  ;;
  *)
    echo "Usage: $0 {ngrok|pgsql}"
    exit 1
  ;;
esac
