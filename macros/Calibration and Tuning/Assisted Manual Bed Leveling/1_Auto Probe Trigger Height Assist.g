; Clear compensation map and Zprobe trigger height
;
M929 S1 ; start logging 
M80 		          ; Ensure Printer is on

M291 P"Grid bed compensation map and ZProbe trigger height will be cleared. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
M561			; Disable any current bed compensation
G29 S2			; Clear mesh bed compensation perameters

; Preheat to probing temps
;
M291 P"Preheating to bed to 60 and nozzle to 210 for accurate probing" R"Proceed?" S3
T0			; Activate first tool
M104 S210		; Set nozzle to 210 and release
M140 S60		; Set bed temp to 60 and release

; home all axis
;
G28			; Home all axis
M190 S60		; Set bed to 60 and wait
M109 S210		; Set nozzle to 210 and wait

; Move nozzle to center of bed at z10
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
M98 P/macros/general/1_Center_Nozzle 
G90			; Absolute positioning
G31 Z0				; Reset zprobe trigger height
G92 Z8				; Reset z to 5 to allow jogging up to touch bed to nozzle

; Dialog to allow user to jog z to touch nozzle to bed gently and then move Z down 10
;
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0


; configure settings for setting Z=0 to limit ability to damage bed
;
M203 Z400			; Set maximum speeds (mm/min)
M913 Z60 			; set Z motors to 40% of their normal current for homing
M566 Z0.4				; Set maximum instantaneous speed changes (mm/min) (Jerk)
M201 Z5	 		; Set maximum accelerations (mm/s^2)

; Move probe to center of bed and get probe trigger heights
;
M291 P"Probe will now move to the center of the bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" S3
G1 Z10			; Drop bed for nozzle clearance
M98 P/macros/general/1_Center_Probe 

;
M291 P"Probe will now measure trigger height 10 times" R"ZProbe Trigger Height Calibration" S3
M291 P"Heights will be found in gcode console if logging is enabled" S3

; G30 S-1 10 times
;

; 1
G1 Z10
G30 S-1

; 2
G1 Z10
G30 S-1

; 3
G1 Z10
G30 S-1

; 4
G1 Z10
G30 S-1

; 5
G1 Z10
G30 S-1

; 6
G1 Z10
G30 S-1

; 7
G1 Z10
G30 S-1

; 8
G1 Z10
G30 S-1

; 9
G1 Z10
G30 S-1

; 10
G1 Z10
G30 S-1

G1 Z10


; Turn off heaters
; 
M104 S0		; Set nozzle to 0 and release
M140 S0		; Set bed to 0 and release

; Set normal settings after stall detection probing
;
M98 P/macros/general/Normal_Settings 

M291 P"Probing complete. Turning off heaters and homing axis."
M291 P"Check log, average values for trigger heights, and enter into config.g for the G31 Z value"

G28 XY		; Home XY

M929 S0 ; stop logging 

; Tone to get user attention
;
M400			; Clear movement buffer so tones play reliably
M300 S666 P600
G4 P601
M300 S1511 P300
G4 P301

