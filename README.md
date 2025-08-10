# Why?
I do not like the official one plus just started learning programming so i decided to make it as a practice project because this is something i will actualy use. Also as this is one of my first "complex" projects it probably is written horribly.

# Futures:
* Dark theme
* Light theme
* Drag and drop
* Adjustable font size
* Cross-platform (tested on Windows/Linux, don`t have Mac but should work)
  
# Minimum system requirements
* Windows 7 SP1 x86/x64
* Linux x64 (tested on Debian 12)
* ~100Mb of disk space

# Usege
 * Run executable:

     * drag and drop your file into main window

       OR
   
     * go to "file" menu, click "open" and select mediafile.


  * Run the executable with path to mediafile as first argument, for connivance use "open with..." from right click menu and select path to your mediainfo-gui executable. For more permanent solution right click on mediafile, go to "properties" click on "change" button click "add" and enter path to mediainfo-gui executable. You also can add the executable to PATH.(EXAMPLE FOR KDE PLASMA, BUT THE PROCESS IS VERY SIMULAR ON OTHER DEs AND OSs)
  
# [Download links](https://github.com/hopper775/mediainfo-GUI/releases)

# Screenshots
Dark theme:

![dark-general](https://github.com/user-attachments/assets/88a50cf7-6fac-4d58-9be5-c16a8af536d2)![dark-audio](https://github.com/user-attachments/assets/654319c6-0481-4539-990a-989d63de1e11)

Light theme:

![light-video](https://github.com/user-attachments/assets/455ed52f-0cc0-480c-978c-ac8d84124028)![light-other](https://github.com/user-attachments/assets/af1b8adf-515b-40fd-9e49-97bbe6cd71c1)

# Build
Note that on Linux most likely you will install packages in virtual environment, then make sure to specify full path to the executable you want to run (e.g. /home/user/Desktop/py-virt-env/bin/pip install PyQt5 MOST LIKELY WILL BE DIFFERENT IN YOUR CASE)
```
#some dependancy`s...
pip install PyQt5
pip install pyqtdarktheme
pip install pymediainfo
pip install pyinstaller #only needed if you want to build the project into executable
#download source code
git clone https://github.com/hopper775/mediainfo-GUI
cd mediainfo-GUI
#Build
pyinstaller main.py -F --hide-console hide-early
cd dist
#Done! run the executable
#On LInux
./main
#On Windows
main.exe
```
# TODO
1. Proper installer
2. Icon
