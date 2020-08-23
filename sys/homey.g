; homey.g
; called to home the Y axis
;
M80 		          ; Ensure Printer is on
G4 P2000			  ; Wait 2 seconds for Vin 
; generated by RepRapFirmware Configuration Tool v2.1.8 on Sun Feb 09 2020 08:41:29 GMT-0600 (Central Standard Time)
G91              ; relative positioning
G1 H2 Z5 F6000   ; lift Z relative to current position
G1 H1 Y212 F3000 ; move quickly to Y axis endstop and stop there (first pass)
G1 H2 Y-5 F6000  ; go back a few mm
G1 H1 Y212 F240  ; move slowly to Y axis endstop once more (second pass)
G1 H2 Z-5 F6000  ; lower Z again
G90              ; absolute positioning

