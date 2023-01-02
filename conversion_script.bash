for imgFile in *.HEIC; do
  echo "Reading Image File = "$imgFile""
  echo "Converting "$imgFile" to "$imgFile.png""
  sips -s format png "$imgFile" --out "converted_images/$imgFile.png"
  echo "Conversion completed for "$imgFile" as "$imgFile.png""
  echo "Reading original creation date"
  date=$(stat -f "%SB" -t "%m/%d/%y %H:%M:%S" "$imgFile")
  echo "setting the date to be "$date""
  echo "writing original creation date as modification and creation date"
  SetFile -md "$date" converted_images/${imgFile}.png
  echo "Completed Processing for $imgFile"
  echo "--------------------------------"
done
