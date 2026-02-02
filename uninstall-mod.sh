#!/bin/sh
# uninstall-mod.sh
# Only deletes files in $APPDIR that match names in local Materials and Reactions

# directory containing this script
ROOT="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)/"

# target app userdata (uses current user)
APPDIR="/home/$USER/.wine/drive_c/users/$USER/AppData/Roaming/Godot/app_userdata/Atomcraft"

echo "Scanning \"${ROOT}Materials\" and \"${ROOT}Reactions\"..."
echo "Target app userdata: \"${APPDIR}\""
echo

# Check files in Materials and delete only in APPDIR
if [ -d "${ROOT}Materials" ]; then
    for f in "${ROOT}Materials"/*; do
        [ -f "$f" ] || continue
        base="$(basename "$f")"
        if [ -e "${APPDIR}/Materials/${base}" ]; then
            echo "Deleting \"${APPDIR}/Materials/${base}\""
            rm -f -- "${APPDIR}/Materials/${base}" 2>/dev/null || true
        else
            echo "Not found in app userdata: \"${APPDIR}/Materials/${base}\""
        fi
    done
else
    echo "Local Materials directory not found: ${ROOT}Materials"
fi

# Check files in Reactions and delete only in APPDIR
if [ -d "${ROOT}Reactions" ]; then
    for f in "${ROOT}Reactions"/*; do
        [ -f "$f" ] || continue
        base="$(basename "$f")"
        if [ -e "${APPDIR}/Reactions/${base}" ]; then
            echo "Deleting \"${APPDIR}/Reactions/${base}\""
            rm -f -- "${APPDIR}/Reactions/${base}" 2>/dev/null || true
        else
            echo "Not found in app userdata: \"${APPDIR}/Reactions/${base}\""
        fi
    done
else
    echo "Local Reactions directory not found: ${ROOT}Reactions"
fi

echo
echo "Done."
