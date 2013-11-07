echo "Updating scripts"

LOCAL_SOURCE="$HOME/Code/TeslaRift/Live/MidiRemote"
REMOTE_SOURCE="/Applications/Ableton Live 9 Standard.app/Contents/App-Resources/MIDI Remote Scripts/FissureVR"
LIVE_APP="/Applications/Ableton Live 9 Standard.app/"

cp "$LOCAL_SOURCE/FissureVR.py" "$REMOTE_SOURCE/FissureVR.py"
cp "$LOCAL_SOURCE/__init__.py" "$REMOTE_SOURCE/__init__.py"

osascript -e 'quit app "Live"'
open -a "$LIVE_APP"
