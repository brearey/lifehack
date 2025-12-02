#!/bin/bash

echo "Welcome to my images compresser utility. Lorriant. 2025"

help="./compress.sh [tool] [format] [source_format?]"
tools_help="Available tools: webp, jpegoptim, dwebp"

if [ $# -eq 0 ]
  then
    echo "Error: arguments required"
    echo $help
    echo $tools_help
    exit 1
fi

if [ $# -lt 2 ]
  then
    echo "Error: format argument required"
    echo $help
    echo $tools_help
    exit 1
fi

tool=$1
format=$2
source_format=${3:-$format}  # третий аргумент - исходный формат, по умолчанию такой же как format

mkdir -p compressed

case $tool in
    "webp")
        echo "Using cwebp to convert .$source_format files to WebP..."
        for file in *.$source_format; do
            if [ -f "$file" ]; then
                echo "Processing: $file"
                cwebp -q 80 "$file" -o "compressed/${file%.*}.webp"
            fi
        done
        ;;
    "jpegoptim")
        if [[ "$source_format" != "jpg" && "$source_format" != "jpeg" && "$source_format" != "JPG" ]]; then
            echo "Error: jpegoptim supports only jpg and jpeg formats"
            exit 1
        fi
        echo "Using jpegoptim to compress .$source_format files..."
        for file in *.$source_format; do
            if [ -f "$file" ]; then
                cp "$file" "compressed/$file"
            fi
        done
        jpegoptim -m80 --strip-all compressed/*.$source_format
        ;;
    "dwebp")
        echo "Using dwebp to convert .$source_format files to .$format..."
        for file in *.$source_format; do
            if [ -f "$file" ]; then
                echo "Processing: $file"
                dwebp "$file" -o "compressed/${file%.*}.$format"
            fi
        done
        ;;
    *)
        echo "Error: unknown tool '$tool'"
        echo $tools_help
        exit 1
        ;;
esac

echo "Compression completed! Check 'compressed' folder."
