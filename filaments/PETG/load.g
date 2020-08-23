; 0:/filaments/PETG/load.g
; Macro used to load PETG, Called by the M701 S”PETG” command

; Custom temp for PETG here
M80				; Turn on PSU
T0				; Activate Hotend
M702			; Unload previous material
M291 R"Filament Handling" P"Heating nozzle for PETG, please wait." S0
M109 S250			; set temp to 250c and wait

; Finish Common Steps
M98 P/macros/general/filament/Load_Common
