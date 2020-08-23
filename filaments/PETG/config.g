; Custom PETG Settings

;M207 S0.9 R0.0 F3000 T3000 Z0.0 					; firmware retraction settings
M307 H0 A102.4 C353.4 D1.2 B0 S1.00 V24.3         	; Bed PID tune for 60c
M307 H1 A353.3 C177.5 D3.8 B0 S1.00 V24.4	     	; Hot end PID tune at 250c
;M566 X1200 Y1200 Z60 E3000        					; jerk settings
;M204 P1000 T4000                    				; Set printing and travel accelerations

