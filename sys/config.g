; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2.1.8 on Sun Feb 09 2020 08:41:29 GMT-0600 (Central Standard Time)

; General preferences
G90                                                    ; send absolute coordinates...
M83                                                    ; ...but relative extruder moves
M550 P"Ender 5 Hemera"                                 ; set printer name
M918 P1 E4 F2000000                                    ; configure direct-connect display

; Network
M552 P0.0.0.0 S1                                       ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                             ; enable HTTP
M586 P1 S1                                             ; enable FTP
M586 P2 S0                                             ; disable Telnet

; Drives
M569 P0 S0                                             ; physical drive 0 goes backwards
M569 P1 S0                                             ; physical drive 1 goes backwards
M569 P2 S0                                             ; physical drive 2 goes backwards
M569 P3 S0                                             ; physical drive 3 goes backwards
M584 X0 Y1 Z2 E3                                       ; set drive mapping
M350 X16 Y16 Z16 E16 I1                                ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E399.78                      ; set steps per mm
M566 X1200.00 Y1200.00 Z24.00 E300.00                  ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z1800.00 E3600.00               ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z100.00 E5000.00                  ; set accelerations (mm/s^2)
M906 X800 Y800 Z800 E980 I30                           ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                       ; set axis minima
M208 X220 Y207 Z300 S0                                 ; set axis maxima

; Endstops
M574 X2 S1 P"xstop"                                    ; configure active-high endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                                    ; configure active-high endstop for high end on Y via pin ystop
M574 Z1 S2                                             ; configure Z-probe endstop for low end on Z

; Z-Probe
M950 S0 C"exp.heater4"                                 ; create servo pin 0 for BLTouch
M558 P9 C"zprobe.in+zprobe.mod" H5 F120 T6000          ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-43 Y3 Z2.0431                               ; set Z probe trigger value, offset and trigger height
M557 X0:180 Y40:195 S40                                ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138         ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                  ; create bed heater output on bedheat and map it to sensor 0
M143 H0 S120                                           ; set temperature limit for heater 0 to 120C
M307 H0 B0 S1.00                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                   ; create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S285                                           ; set temperature limit for heater 1 to 285C
M307 H1 B0 S1.00                                       ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"fan0" Q500                                   ; create fan 0 on pin fan0 and set its frequency
M106 P0 C"F0 Part Cooling Fan" S0 H-1                  ; set fan 0 name and value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                                   ; create fan 1 on pin fan1 and set its frequency
M106 P1 C"F1 Hot End Fan" S1 H1 T45                    ; set fan 1 name and value. Thermostatic control is turned on
M950 F2 C"fan2" Q500                                   ; create fan 2 on pin fan2 and set its frequency
M106 P2 C"F2 Case Fan" S1 H1:0 T45                     ; set fan 2 name and value. Thermostatic control is turned on

; Tools
M563 P0 S"Hemera" D0 H1 F0                             ; define tool 0
G10 P0 X0 Y0 Z0                                        ; set tool 0 axis offsets
G10 P0 R0 S0                                           ; set initial tool 0 active and standby temperatures to 0C

; Custom settings
;M591 D0 P5 C"e0stop" R15:110 E3.0 S0  ; Duet3D laser sensor for extruder drive 0, connected to endstop input 3 (E0), tolerance 40 to 120%, 3mm, S1=Enabled, S0=Disabled

; Duet3D laser sensor for extruder drive 0 is connected to E0 endstop input, 34.243mm/rev, 70% to 130% tolerance, 3mm detection length, S1=Enabled, S0=Disabled
M591 D0 P5 C"e0stop" R70:130 L34.3 E3.0 S0 

M501				                                               ; automatic loading of the config-override file should be enabled
M81					                                               ; Turn off 24VDC power on start up and enable control in the UI

; Soft Power Control
M950 J0 C"^exp.e6stop" ; create GPIO input pin 0 attached to Estop6 expansion connector - Senses Power Button, Low=Button Pressed 
M950 P1 C"!exp.31" ; create GPIO output pin 1 attached to heater7 on expansion connector - Controls Duet2 On=S1 (default), Off=S0
M581 P0 S1 T2 C0         ; When E6 goes Low, execute trigger2.g to complete shutdown

; Miscellaneous
T0                                                     ; select first tool
M575 P1 S1 B57600									; set the PanelDue Baudrate

