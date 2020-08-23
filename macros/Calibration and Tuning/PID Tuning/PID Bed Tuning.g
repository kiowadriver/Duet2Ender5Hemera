; PID Tuning
; Must be initiated at room temp

M291 P"Must be initated when hot end and bed are at room temp." R"WARNING" S3 T0 ; User must click OK or cancel

M929 S1 ; start logging 

M303 H0 S60  ; start the heater tuning process for the hot end

M291 P"Wait for autotune to complete and then press OK to store settings. Press OK once complete (3 phases)" R"Complete?" S3 

M500 ; store the results
M929 S0 ; stop logging 
