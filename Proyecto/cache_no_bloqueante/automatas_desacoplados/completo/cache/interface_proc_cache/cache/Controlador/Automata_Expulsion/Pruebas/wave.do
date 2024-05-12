onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /prueba_controlador/ciclo
add wave -noupdate -radix hexadecimal /prueba_controlador/reloj
add wave -noupdate -radix hexadecimal /prueba_controlador/pcero
add wave -noupdate -radix hexadecimal /prueba_controlador/contro/estado
add wave -noupdate /prueba_controlador/contro/prxestado
add wave -noupdate -divider {Buffer Expulsiones}
add wave -noupdate -radix hexadecimal /prueba_controlador/bex_val
add wave -noupdate -expand /prueba_controlador/bex_control
add wave -noupdate -divider {Control Camino Datos}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/s_control.DAT_acc -radix hexadecimal} {/prueba_controlador/s_control.DAT_palabra_esc -radix hexadecimal} {/prueba_controlador/s_control.DAT_bloque_esc -radix hexadecimal} {/prueba_controlador/s_control.EST_acc -radix hexadecimal} {/prueba_controlador/s_control.EST_esc -radix hexadecimal} {/prueba_controlador/s_control.EST_DE -radix hexadecimal -childformat {{/prueba_controlador/s_control.EST_DE(1) -radix hexadecimal} {/prueba_controlador/s_control.EST_DE(0) -radix hexadecimal}}} {/prueba_controlador/s_control.ET_acc -radix hexadecimal} {/prueba_controlador/s_control.ET_esc -radix hexadecimal} {/prueba_controlador/s_control.muxB -radix hexadecimal} {/prueba_controlador/s_control.CMPET -radix hexadecimal} {/prueba_controlador/s_control.EXP -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/s_control.DAT_acc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.DAT_palabra_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.DAT_bloque_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_acc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_DE {-height 15 -radix hexadecimal -childformat {{/prueba_controlador/s_control.EST_DE(1) -radix hexadecimal} {/prueba_controlador/s_control.EST_DE(0) -radix hexadecimal}} -expand} /prueba_controlador/s_control.EST_DE(1) {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_DE(0) {-height 15 -radix hexadecimal} /prueba_controlador/s_control.ET_acc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.ET_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.muxB {-height 15 -radix hexadecimal} /prueba_controlador/s_control.CMPET {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EXP {-radix hexadecimal}} /prueba_controlador/s_control
add wave -noupdate -divider {Peticion Memoria}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/pet_m.m_acc -radix hexadecimal} {/prueba_controlador/pet_m.m_pet -radix hexadecimal} {/prueba_controlador/pet_m.m_esc -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/pet_m.m_acc {-radix hexadecimal} /prueba_controlador/pet_m.m_pet {-radix hexadecimal} /prueba_controlador/pet_m.m_esc {-radix hexadecimal}} /prueba_controlador/pet_m
add wave -noupdate -divider {Memoria lista}
add wave -noupdate -radix hexadecimal /prueba_controlador/mem_lista
add wave -noupdate -divider Arbitro
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/concesion_arb.conc_fallo_arb -radix hexadecimal} {/prueba_controlador/concesion_arb.conc_exp_arb -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/concesion_arb.conc_fallo_arb {-radix hexadecimal} /prueba_controlador/concesion_arb.conc_exp_arb {-radix hexadecimal}} /prueba_controlador/concesion_arb
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/pet_arb_bex.pet_arb -radix hexadecimal} {/prueba_controlador/pet_arb_bex.pet_arb_exp -radix hexadecimal} {/prueba_controlador/pet_arb_bex.pet_bex_arb -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/pet_arb_bex.pet_arb {-radix hexadecimal} /prueba_controlador/pet_arb_bex.pet_arb_exp {-radix hexadecimal} /prueba_controlador/pet_arb_bex.pet_bex_arb {-radix hexadecimal}} /prueba_controlador/pet_arb_bex
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {216640 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 456
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 40000
configure wave -gridperiod 80000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1662584 ps}
