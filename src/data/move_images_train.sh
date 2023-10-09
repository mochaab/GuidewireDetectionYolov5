#!/bin/bash
from='val'
# Specify the path to the text file
file_path="/home/nami/Dokumente/DeepLearningProjects/GuidewireDetectionYolov5/data/raw/cycle_1_${from}.txt"
item_file_path="/home/nami/Dokumente/DeepLearningProjects/GuidewireDetectionYolov5/data/raw/cycle_1_${from}/"
ext_img=".jpg"
ext_lab=".txt"

# Display the contents of the file
# cat "$file_path"

# Or, redirect the contents to a variable
file_contents=$(cat "$file_path")

destination_directory_img="/home/nami/Dokumente/DeepLearningProjects/GuidewireDetectionYolov5/data/raw/custom/images/v1_${from}"
destination_directory_lab="/home/nami/Dokumente/DeepLearningProjects/GuidewireDetectionYolov5/data/raw/custom/labels/v1_${from}"
# Or, process the contents line by line
while IFS= read -r line; do
    echo "Line: $line"
    source_file_img="${item_file_path}$(basename "$line")${ext_img}"
    source_file_lab="${item_file_path}$(basename "$line")${ext_lab}"
    cp "$source_file_img" "$destination_directory_img"
    cp "$source_file_lab" "$destination_directory_lab"
    
done < "$file_path"