onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/ciclo
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/reloj
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/pcero
add wave -noupdate -divider {Buffer Expulsiones}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_buffer_exp/bex_control.pe -radix hexadecimal} {/prueba_buffer_exp/bex_control.val_PBL -radix hexadecimal} {/prueba_buffer_exp/bex_control.val_ESC_LEC -radix hexadecimal} {/prueba_buffer_exp/bex_control.pe_val_PBL -radix hexadecimal} {/prueba_buffer_exp/bex_control.pe_val_ESC_LEC -radix hexadecimal}} -expand -subitemconfig {/prueba_buffer_exp/bex_control.pe {-radix hexadecimal} /prueba_buffer_exp/bex_control.val_PBL {-radix hexadecimal} /prueba_buffer_exp/bex_control.val_ESC_LEC {-radix hexadecimal} /prueba_buffer_exp/bex_control.pe_val_PBL {-radix hexadecimal} /prueba_buffer_exp/bex_control.pe_val_ESC_LEC {-radix hexadecimal}} /prueba_buffer_exp/bex_control
add wave -noupdate -divider {Direccion expulsar}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_buffer_exp/dirExpulsion(14) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(13) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(12) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(11) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(10) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(9) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(8) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(7) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(6) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(5) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(4) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(3) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(2) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(1) -radix hexadecimal} {/prueba_buffer_exp/dirExpulsion(0) -radix hexadecimal}} -subitemconfig {/prueba_buffer_exp/dirExpulsion(14) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(13) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(12) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(11) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(10) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(9) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(8) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(7) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(6) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(5) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(4) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(3) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(2) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(1) {-radix hexadecimal} /prueba_buffer_exp/dirExpulsion(0) {-radix hexadecimal}} /prueba_buffer_exp/dirExpulsion
add wave -noupdate -divider {Bloque expulsar}
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/bloque_expulsar
add wave -noupdate -divider Registros
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/dir_bex
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/bloque_bex
add wave -noupdate -radix hexadecimal /prueba_buffer_exp/validez_bex
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {244681 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {944128 ps}
