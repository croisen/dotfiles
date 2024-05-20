## Functions ##
# albumart_mk - adds a specified picture as an album art for an mp3 file (requires ffmpeg)
albumart_mk() {
    if ! command -v ffmpeg &>/dev/null; then
        echo "ffmpeg cannot be found, please install it"
        return 1
    fi

    if [[ -z $1 ]]; then
        echo "Usage: albumart_mk file.mp3 album_pic.png"
        return 0
    fi

    ffmpeg -i $1 -i $2 -map 0:0 -map 1:0 -codec copy -id3v2_version 3 \
        -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" modified_$1
}

# Clears the screen and scrollback buffer for the kitty term
# (dunno if the other terms support this tho)
clear2() {
    printf '\033[2J\033[3J\033[1;1H'
}

# link_config_stow - Uses GNU stow to make symlinks from this git directory
# to ones config directory
link_config_stow() {
    mkdir -p /home/$USER/.config/
    stow --dir=./ --target=/home/$USER/.config ./
}

# Gitall - git add, commit, and push
gitall() {
	git add .

	if [[ -n $1 ]]; then
		git commit -m "$1"
	else
		git commit
	fi

	git push origin HEAD
}

# Up - go up by specified amount of directories
up() {
	if [[ $1 =~ [^0-9] ]]; then
		echo "Please use a whole number"
		return 1
	elif [[ -z $1 ]]; then
		cd ../
	else
		for i in $(seq $1); do
			cd ../
		done
	fi
}

#ytmp* - Downloads music and videos from sites supported by yt-dlp (i.e. YouTube)
ytmp3() {
	if ! command -v yt-dlp &>/dev/null; then
		echo "yt-dlp cannot be found, please get it"
		return 1
	fi
    for arg in $@; do
        yt-dlp -x --audio-format mp3 \
            --audio-quality 0 \
            --embed-thumbnail \
            -o %\(title\)s.%\(ext\)s "$arg"
    done
	return 0
}

ytmp4() {
	if ! command -v yt-dlp &>/dev/null; then
		echo "yt-dlp cannot be found, please get it"
		return 1
	fi

    for arg in $@; do
        yt-dlp --format mp4 \
            --embed-thumbnail \
            -o %\(title\)s.%\(ext\)s "$arg"
    done
	return 0
}

