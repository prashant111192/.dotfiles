
xprop -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}') | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2 
