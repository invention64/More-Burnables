#!/bin/sh
# install-mod.sh - POSIX sh version of your batch installer

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="/home/$USER/.wine/drive_c/users/$USER/AppData/Roaming/Godot/app_userdata/Atomcraft"

printf 'BASEDIR: %s\nTARGET: %s\n' "$BASEDIR" "$TARGET"

if [ -d "$BASEDIR/Materials" ]; then
    mkdir -p "$TARGET/Materials"
    cp -a "$BASEDIR/Materials/." "$TARGET/Materials/" >/dev/null 2>&1
else
    printf 'Materials folder not found in "%s"\n' "$BASEDIR"
fi

if [ -d "$BASEDIR/Reactions" ]; then
    mkdir -p "$TARGET/Reactions"
    cp -a "$BASEDIR/Reactions/." "$TARGET/Reactions/" >/dev/null 2>&1
else
    printf 'Reactions folder not found in "%s"\n' "$BASEDIR"
fi

exit 0