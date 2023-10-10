# ksk-ripping-guide

### Filenames
The most common naming convention for archive files are:

- [Artist] Title (xHeight) [Publisher]
- [Artist 1 & Artist 2] Title (xHeight) [Publisher] {Self-Tag}
- When circle exists: [Circle (Artist 1 & Artist 2)] Title (xHeight) [Publisher] {Self-Tag}

_*Replace artists with **Various** when there are more than 2 artists._
And the most common naming convention for image files are:

- 3-digit padding (e.g., 001.png, 002.png, etc).
- Archive file name appended by 3-digit padding (e.g. [Artist] Title (x123) [Publisher] - 001.png)

_*ABSOLUTELY do not add self-tag in the image file names._

### Unlimited

https://github.com/WebForks/jewcob-downloader

https://css-ig.net/pingo

The most common way to rip Unlimited Chapters is by using jewcob-downloader. There are several things that you need to know: 

1) The downloader will not restore the modTime attribute into the metadata file and the archive file itself.
2) The downloader will not automatically optimize the image after ripping it.

The downloader can be improved by editing the downloader.py and incorporating automatic image optimization after the ripping process is complete. This requires some knowledge of scripting or Python, and I won't spoon-feed you on how to do it.

Basically: 
1) Download and place pingo alongside the downloader.
2) Edit the ```downloader.py``` file and use ```subprocess.call``` to invoke ```pingo -sb -strip```.
   
  
  
### Ripping doujinshi from FAKKU
Simply select the highest available quality in zip format. ABSOLUTELY do not download the PDF and extract the images yourself. It is advisable to leave the zip file untouched and avoid making any modifications to the files, such as repackaging, optimizing, or renaming the image files.

### Ripping doujinshi from Irodori Comics

https://github.com/WebForks/Irodori-Comics-ripper

https://css-ig.net/pingo

If you have purchased a doujinshi from the Irodori Comics store, you need to extract the images from the PDF. This can be done by using pdfimages, which is available in the poppler-utils package. Unfortunately, this package is only available on Linux.

<u> Windows users can just install Ubuntu by using the Windows Subsystem for Linux (WSL). </u>

To keep the guide concise, a bash script is available to help streamline the process (written by none other than myself, with the assistance of several anonymous contributors): <u> rip.sh </u> . The script will automatically extract, optimize, and package the images for you.

To use the script, place the PDFs and pingo alongside the script, and install the prerequisites:
```sudo apt-get install poppler-utils zip```
Then, simply execute the command ```bash rip.sh```.

#### Extra: Restoring modTime attribute

1) Retrieve the most recent value of the Last-Modified header.
2) Apply it using the command ```touch -a -m -d "Wed, 03 May 2023 00:00:00 +0000" target_file```.

_*Replace ```Wed, 03 May 2023``` with the date obtained from the DevTools._
Do this on the PDF before executing the script.

[mtime.webm](https://github.com/WebForks/ksk-ripping-guide/assets/35718739/c8ef1b7f-8fcc-455a-a60b-8224bd632c1d)
