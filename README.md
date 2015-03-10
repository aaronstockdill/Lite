iNZight *Lite* version 0.9.7
============================
This is the online version of iNZight (http://docker.stat.auckland.ac.nz), with four new modules:

- About
- Visualize
- Time Series
- Help

Underway (10/03/15):
---------------------
- Update help.md files for all modules.
- Add proper error handling in the "Time Series" and "Visualize" modules, including linking "Provide Time Information" with server.R (i.e. conditional panels).
- Add inferential markups to the "Visualize" module once Tom finishes updating iNZightPlots().

Recent Updates (10/03/15):
--------------------------
- Updated help.md files for the "Time Series" and "Visualize" modules.
- Fixed Datatables bug (Christoph).
- Fixed question mark error (Christoph).
- 404 Error fixed in "About" module (Christoph).
- Footer appears at the bottom but sits below the content if window $<$ 767px (Tom).
- New side-panel layout for the "Visualize" module (Chris).
- New "Help" module (Chris).
- Restructured code - new panels have their own directory (Chris).

To do/Known Issues:
-------------------
- [Time Series] Change the way plots are drawn to how it was done in "Visualize".
- [Time Series] Check if it can handle datasets with the "DATE" columns in column 2+.
- [Quick Explore] Merge into 1 tab.
- [Advanced] Nest QE and TS under "Advanced".

Directories:
------------
- data:
This directory holds all the data. The data must be placed in sub-directories, which will come up as data categories within iNZight-Lite.

- gui-elements:
This directory contains the gui functions for all the old modules (from iNZight revamp). 

- panels:
This directory contains the gui, server, help, and other functions for each module. It currently contains the "About", "Time Series", "Visualize", and "Help" modules. This makes it easier to modify code.

- www:
This directory is used for web-related files such as .css and .gif/.jpeg/.png. Images are stored in a sub-directory called "images".

Main files:
-----------

- README:
Documentation for iNZight *Lite*. Update as required.

- global.R:
Defines functions and variables that are used globally. For now, all non-GUI functions are stored here.

- server.R:
Script for shiny server.

- ui.R:
Defines the main GUI.

Note:
-----

This repository will gradually be changed into the following format throughout 2015:

- data:
This directory holds all the data. The data must be placed in sub-directories, which will come up as data categories within iNZight *Lite*. 

- panels:
This directory contains the code and files that set up user selections. There is one sub-directory that contains all the .html and .md files.
Each panel has its own directory within 'panels', and each sub-panel has its own directory within each parent panel.

The file names adhere to the following guidelines:

- N_panel-name
- M_sub-panel-name
- 1_panelname-panel-gui.R
- 2_panelname-panel-server.R
- 3_panelname-panel-help.R
- 4_panelname-panel-other.R

- www:
This directory is used for web-related files such as .css and .gif/.jpeg/.png. Images are stored in a sub-directory called "images".

