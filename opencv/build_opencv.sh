#!/bin/bash

WD=`pwd`
CV_VERSION="4.5.2"
CV_NAME="opencv-$CV_VERSION"

if [ ! "$CV_SRC" ] ; then
	CV_SRC="$WD/$CV_NAME"

	CV_ZIP="OpenCV%20$CV_VERSION.zip"
	CV_URL="https://sourceforge.net/projects/opencvlibrary/files/$CV_VERSION/$CV_ZIP"
	# standard on MacOSX
	DOWNLOAD_DIR="$HOME/Downloads"

	if [ ! -d "$CV_SRC" ] ; then
	    if [ ! -f "$CV_ZIP" ] && [ -f "$DOWNLOAD_DIR/$CV_ZIP" ] ; then
	        echo "found $DOWNLOAD_DIR/$CV_ZIP"
	        CV_ZIP="$DOWNLOAD_DIR/$CV_ZIP"
	    fi
	    if [ ! -f "$CV_ZIP" ] ; then
	        echo "didn't find `basename $CV_ZIP` in $PWD or $DOWNLOAD_DIR"
	        echo "downloading OpenCV from $CV_URL"

	        curl -L -O -J $CV_URL || exit 1
	    fi

	    echo "unzipping $CV_ZIP"
	    unzip $CV_ZIP -d "$WD/$CV_NAME"
	fi
fi

echo "---- Copying patched build_sdk.py ----"
EXECUTABLE_PATH=$(find opencv-4.5.2/* -name 'build_sdk.py')
cp "$WD/build_sdk.py" "$EXECUTABLE_PATH"
echo "---- Running build_sdk.py ----"
python3 $EXECUTABLE_PATH --no_ccache --modules_list="core imgproc" --no_samples_build

GENERATED_SDK_PATH="OpenCV-android-sdk/sdk/native/libs"


for ARCH in "armeabi-v7a" "x86" "arm64-v8a" "x86_64"
do
	DEST_DIR="../card.io/src/main/jni/lib/"$ARCH
	echo "---- Copying $ARCH files ----"
	mkdir -p $DEST_DIR
	cp $GENERATED_SDK_PATH/$ARCH/libopencv_core.so $DEST_DIR
	cp $GENERATED_SDK_PATH/$ARCH/libopencv_imgproc.so $DEST_DIR
done
