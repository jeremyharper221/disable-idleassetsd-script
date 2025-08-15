{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 Times-Bold;\f1\froman\fcharset0 Times-Roman;\f2\fmodern\fcharset0 Courier;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid1\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid1}
{\list\listtemplateid2\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}}{\leveltext\leveltemplateid101\'01\'00;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listname ;}\listid2}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}{\listoverride\listid2\listoverridecount0\ls2}}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sa321\partightenfactor0

\f0\b\fs48 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Disable and Clean Idleassetsd Script\
\pard\pardeftab720\sa240\partightenfactor0

\f1\b0\fs24 \cf0 This guide will walk you through a simple process to fix a problem on macOS where a background service called 
\f2\fs26 idleassetsd
\f1\fs24  can download large video files that take up a lot of disk space. This script will permanently stop that service and safely remove any downloaded files.\
\pard\pardeftab720\sa280\partightenfactor0

\f0\b\fs28 \cf0 What This Script Does\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls1\ilvl0
\fs24 \cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Permanently stops
\f1\b0  the 
\f2\fs26 idleassetsd
\f1\fs24  background service so it can't download files again.\
\ls1\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Deletes
\f1\b0  any large video files that the service has already downloaded.\
\ls1\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Confirms
\f1\b0  that the files are gone.\
\ls1\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Shows a summary
\f1\b0  of your disk space at the end so you can see how much space was freed up.\
\pard\pardeftab720\sa280\partightenfactor0

\f0\b\fs28 \cf0 How to Use\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls2\ilvl0
\fs24 \cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	1	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Save the Script:
\f1\b0  Copy all of the code from the document in the editor and paste it into a new file. You can name the file something like 
\f2\fs26 disable-idleassetsd.sh
\f1\fs24 .\
\ls2\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	2	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Open Terminal:
\f1\b0  Open the Terminal application on your Mac. You can find it by searching for "Terminal" with Spotlight (Command + Space).\
\ls2\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	3	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Go to the Right Folder:
\f1\b0  In the Terminal, type 
\f2\fs26 cd
\f1\fs24  followed by a space and the path to the folder where you saved the file. For example, if you saved the file to your desktop, you would type: 
\f2\fs26 cd ~/Desktop
\f1\fs24 \
\ls2\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	4	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Give it Permission to Run:
\f1\b0  Type the following command and press Enter. This tells your computer that this file is a script that can be run. 
\f2\fs26 chmod +x disable-idleassetsd.sh
\f1\fs24 \
\ls2\ilvl0
\f0\b \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	5	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Run the Script:
\f1\b0  Type the final command below and press Enter. The script needs administrator privileges to work, so you will be prompted to enter your password. 
\f2\fs26 sudo ./disable-idleassetsd.sh
\f1\fs24 \
\pard\pardeftab720\sa280\partightenfactor0

\f0\b\fs28 \cf0 What to Expect\
\pard\pardeftab720\sa240\partightenfactor0

\f1\b0\fs24 \cf0 The script will provide a step-by-step summary of what it is doing. It will ask for your confirmation before deleting the files. At the very end, it will tell you that the process is complete and display a summary of your disk space.\
}
