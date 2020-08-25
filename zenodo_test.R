# needs rjson, tidyr, dplyr

# we combine the generic Zenodo API with the file identifier

download.file(paste0(zenodo.api,zenodo.id),destfile=file.path(dataloc,"metadata.json"))
latest <- fromJSON(file=file.path(dataloc,"metadata.json"))

print(paste0("DOI: ",latest$links$doi))
print(paste0("Current: ",latest$links$html))
print(paste0("Latest: ",latest$links$latest_html))

# we download all the csv files
file.list <- as.data.frame(latest$files) %>% select(starts_with("self")) %>% gather()

for ( value in file.list$value ) {
  print(value)
  if ( grepl("csv",value ) ) {
    print("Downloading...")
    file.name <- basename(value)
    download.file(value,destfile=file.path(dataloc,basename(value)))
  }
}

