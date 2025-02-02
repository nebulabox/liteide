#!/bin/sh

export BUILD_ROOT=$PWD

if [ -z $LITEIDE_ROOT ]; then
	export LITEIDE_ROOT=$PWD/../liteidex
fi

echo deploy liteide/LiteIDE.app
echo QTDIR=$QTDIR
echo GOROOT=$GOROOT
echo BUILD_ROOT=$BUILD_ROOT
echo LITEIDE_ROOT=$LITEIDE_ROOT
echo .

if [ -z $QTDIR ]; then
	echo 'error, QTDIR is null'
	exit 1
fi

export PATH=$QTDIR/bin:$PATH

rm -rf liteide/LiteIDE.app/Contents/Resources/qt.conf
echo "Need sign the app before release, e.g,"
echo "macdeployqt liteide/LiteIDE.app -sign-for-notarization=\"Apple Development: xxx (G78xxxxJ)\" "
macdeployqt liteide/LiteIDE.app

