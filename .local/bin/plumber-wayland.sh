#!/bin/sh

clpbrd="$(wl-paste)"; [ -z "$clpbrd" ] && exit

funcs="plyvid|plyvid-lowquality|plyaudio|send"

func="$(echo $funcs | sed -Ee 's/\|/\n/g' | ~/.local/bin/bemenu.sh -l 7 -p Plumb_clipboard_to: )"

brwsr="firefox-bin"
vidviewer="mpv"
tor="torsocks"
mpverrhndlr=" && true || notify-send 'Mpv closed with an error' "

case $func in
	plyvid) 
	"$vidviewer" "$clpbrd" $mpverrhndlr
	;;
	plyvid-lowquality) 
	"$vidviewer" --ytdl-format='\bestvideo[height<=?480]+bestaudio/worst\' "$clpbrd" $mpverrhndlr
	;;
	plyaudio) 
	"$vidviewer" --no-video --input-ipc-server=/tmp/mpvsocket "$clpbrd" && true || notify-send 'Mpv closed with an error'
	;;
  send)
  kdeconnect-cli --share "$clpbrd" -n "Galaxy S9" && notify-send -t 3000 'Sent: "$clpbrd"'
  ;;
esac

