; Extruder Tuning

M929 S1 ; start logging 

M291 P"Using the console enter M503 to get the current E-Steps value from EEPROM. Press OK if you have it or Cancel if you don't." R"READY?" S3 T0 ; User must click OK or cancel

M503 ; Get current e-steps value

M291 P"Ensure you have light colored PLA filament, ideally white, and a ruler or caliper available." R"READY?" S3 T0 ; User must click OK or cancel
 
G10 P0 S200			; Set extruder temp (tool 0) to 200
M116 ; wait for temp

M291 P"Measure 120mm of filament from the top of the extruder and mark it with a pen. Press OK to extrude 100mm of filament." R"READY?" S3 T0 ; User must click OK or cancel

G1 E100 F60 ; extrude 100mm of filament

M291 P"Using the formula: Old_E_Steps * (100 / (110 - Distance_To_Mark)) = New_E_Steps, capture new E-steps and store with command  M92 E{value}, M500 to store" R"Complete?" S3 

G10 P0 S0			; Set extruder temp (tool 0) to 0
M929 S0 ; stop logging 