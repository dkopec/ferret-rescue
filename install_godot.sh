#!/bin/bash

export GODOT_VERSION="3.5.3"
export RELEASE_NAME="stable"
export GODOT_PLATFORM="linux_headless.64"

echo "Download Bineries and Templates"
wget -nv https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM}.zip
wget -nv https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz
echo "Done"
echo "Make and link Directories"
mkdir -v ~/.cache
mkdir -v -p ~/.config/godot
mkdir -v -p ~/.local/share/godot/templates/${GODOT_VERSION}.${RELEASE_NAME}
mkdir -v -p ~/.local/share/godot/export_templates
ln -s ~/.local/share/godot/templates ~/.local/share/godot/export_templates
echo "Done"
echo "Extract and install Binaries and Templates"
unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM}.zip
mv -v Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM} /usr/local/bin/godot
unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz
mv -v templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.${RELEASE_NAME}
echo "Cleanup"
rm -f Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM}.zip
echo "Done"

export GODOT_EXPORT_VERSION="0.0.1"
export GODOT_EXPORT_DIR="build"

mkdir -v -p $GODOT_EXPORT_DIR
ls -lsa
godot --export "HTML5" "$GODOT_EXPORT_DIR/index.html"
zip  -j "$GODOT_EXPORT_DIR/ferret_rescure_$GODOT_EXPORT_VERSION.zip" "$GODOT_EXPORT_DIR"