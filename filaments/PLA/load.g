; 0:/filaments/PLA/load.g
; Macro used to load, Called by the M701 S”PLA” command

; Custom temp for PLA here
M80				; Turn on PSU
T0				; Activate Hotend
M702			; Unload previous material
M291 R"Filament Handling" P"Heating nozzle for PLA, please wait." S0
M109 S200			; set temp to 200c and wait

; Finish Common Steps
M98 P/macros/general/filament/Load_Common

