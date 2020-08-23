; PID Tuning
; Must be initiated at room temp

M291 P"Must be initated when hot end and bed are at room temp and NO filament loaded." R"WARNING" S3 T0 ; User must click OK or cancel

M929 S1 ; start logging 

M303 H1 S210  ; start the heater tuning process for the hot end

; Tone to get user attention
;
M400			; Clear movement buffer so tones play reliably
M300 S666 P500
G4 P501
M300 S1111 P300
G4 P301

M291 P"Once the process is complete. Press OK" R"Complete?" S3 

M500 ; store the results
M929 S0 ; stop logging 
