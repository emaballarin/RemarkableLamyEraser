#pragma once

// erase modes
#define PRESS_MODE 1  // press and hold mode
#define TOGGLE_MODE 2 // toggle mode

// actions:
#define UNDO 1 // undo button
#define REDO 2 // redo button

#define WIDTH 1404
#define HEIGHT 1872

// portrait locations
#define toolX 63 // define one x coordinate for all panel tools
int panelTouch[2] = {toolX, 1820};
int markerTouch[2] = {toolX, 1683};
int eraserTouch[2] = {toolX, 1450};
int undoTouch[2] = {toolX, 1220};
int redoTouch[2] = {toolX, 1090};

// landscape locations
#define toolY 60 // define one y coordinate for all panel tools
int LpanelTouch[2] = {65, toolY};
int LnotebookTouch[2] = {1355, toolY};
int LnotebookLower[2] = {1250, 360};
int LnotebookUpper[2] = {1130, 360};
