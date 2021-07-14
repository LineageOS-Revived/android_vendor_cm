#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  DEVICE=$(echo $TARGET_PRODUCT | cut -d "_" -f2)
  if [ -f $file_path ]; then
    file_size=$(stat -c%s $file_path)
    id=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    datetime=$(grep ro\.build\.date\.utc ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
    rom_version=$(grep ro\.cm\.version ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2 | cut -d "v" -f2);
    custom_build_type=14.1;
    echo "{"														> $file_path.json
    echo "  \"response\": ["												>> $file_path.json
    echo "    {"													>> $file_path.json
    echo "      \"datetime\": $datetime,"										>> $file_path.json
    echo "      \"filename\": \"$file_name\","										>> $file_path.json
    echo "      \"id\": \"$id\","											>> $file_path.json
    echo "      \"romtype\": \"$custom_build_type\","									>> $file_path.json
    echo "      \"size\": $file_size,"											>> $file_path.json
    echo "      \"url\": \"https://sourceforge.net/projects/sirrgb-roms/files/Flounder/LineageOS/$file_name/download\",">> $file_path.json
    echo "      \"version\": \"$rom_version\""										>> $file_path.json
    echo "    }"													>> $file_path.json
    echo "  ]"														>> $file_path.json
    echo "}"														>> $file_path.json
    echo "OTA JSON: $file_path.json"
  fi
fi
