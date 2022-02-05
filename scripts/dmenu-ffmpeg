ffmpeg -video_size 800x600 -framerate 25 -ac 2 -f x11grab -i :0.0+0,0 -ac 2 -f alsa -i pulse -ac 2 -acodec copy output.mpeg -ac 2



ffmpeg \
-f pulse -ac 2 -ar 48000 -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor \
-f pulse -ac 1 -ar 44100 -i alsa_input.usb-AKM_AK5370-00-AK5370.analog-mono \
-filter_complex amix=inputs=2 \
-f x11grab -r 30 -s 1366x768 -i :0.0+0,0 \
-vcodec libx264 -preset veryfast -crf 18 \
-acodec libmp3lame -ar 44100 -q:a 1 \
-pix_fmt yuv420p \
/home/b/Videos/FilterComplexAmix.mkv
