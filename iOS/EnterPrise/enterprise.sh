
## params need to change:
## exportOptionsPlistPath
## workspace
## scheme
## teamName

## time measure
spendTime() {
start=$1
end=$2
spend=$3
result=$[end-start]
echo $spend"$result""s"
}

currentTime(){
time=&(date +%s)
echo "$time"
}

## clean project
clean() {
xcodebuild - workspace $1 \
-scheme $2 \
clean
}

## archive
archive() {
xcodebuild archive -workspace $1 \
-scheme $2 \
-configuration $3 \
-archivePath $4 \
DEVELOPMENT_TEAM=$5
}

## export
exportArchive() {
xcodebuild \
-exportArchive \
-archivePath $1 \
-exportOptionsPlist $2 \
-exportPath $3
}

startPack() {

read -p "start exporting ipa, select version: d/r? "
param=$REPLY

## or comment text above, uncomment the next line
## param=$1


filepath=$(cd "$(dirname "$0")"; pwd)
archivePath="$(pwd)/xxx.xcarchive"
exportOptionsPlistPath="$(pwd)/xxx.plist" ## export.plist
exportPath="$(pwd)/Artifacts/Release"

### Release / Debug
config="xxx"
### your scheme
scheme="xxx"
### you workspcae
workspace="xxx.xcworkspace"
### your account teamName
teamName="xxx"

if [ param == "d" ]; then # debug
archivePath="$(pwd)/debug.xcarchive"
exportOptionsPlistPath="$(pwd)/xxx.plist" ## export.plist
exportPath="$(pwd)/Artifacts/Debug"
config="Debug"
elif [ param == "r" ];then # release
archivePath="$(pwd)/release.xcarchive"
exportOptionsPlistPath="$(pwd)/xxx.plist" ## export.plist
exportPath="$(pwd)/Artifacts/Release"
config="Release"
fi

## clean
cleanStart=`currentTime`
clean "$workspace" "$scheme"
cleanEndTime=`currentTime`

## archive
archiveStart=`currentTime`
archive "$workspace" "$scheme" "$config" "$archivePath" "$teamName"
archiveEnd=`currentTime`

## export
exportArchiveStart=`currentTime`
exportArchive "$archivePath" "$exportOptionsPlistPath" "$exportPath"
exportArchiveEnd=`currentTime`

rm -rf "$archivePath"

spendTime "$cleanStart" "$cleanEndTime" "cleanSpend: "
spendTime "$archiveStart" "$archiveEnd" "archiveSpend: "
spendTime "$exportArchiveStart" "$exportArchiveEnd" "exportArchiveSpend: "

}

startPack



