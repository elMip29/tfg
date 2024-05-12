onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /prueba_controlador/ciclo
add wave -noupdate -radix hexadecimal /prueba_controlador/reloj
add wave -noupdate -radix hexadecimal /prueba_controlador/pcero
add wave -noupdate -radix hexadecimal /prueba_controlador/contro/estado
add wave -noupdate /prueba_controlador/contro/prxestado
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/pet.acc -radix hexadecimal} {/prueba_controlador/pet.esc -radix hexadecimal} {/prueba_controlador/pet.ini -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/pet.acc {-height 15 -radix hexadecimal} /prueba_controlador/pet.esc {-height 15 -radix hexadecimal} /prueba_controlador/pet.ini {-height 15 -radix hexadecimal}} /prueba_controlador/pet
add wave -noupdate -divider {Info Estado}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/info_estado.AF -radix hexadecimal} {/prueba_controlador/info_estado.EST -radix hexadecimal -childformat {{/prueba_controlador/info_estado.EST(1) -radix hexadecimal} {/prueba_controlador/info_estado.EST(0) -radix hexadecimal}}}} -subitemconfig {/prueba_controlador/info_estado.AF {-height 15 -radix hexadecimal} /prueba_controlador/info_estado.EST {-height 15 -radix hexadecimal -childformat {{/prueba_controlador/info_estado.EST(1) -radix hexadecimal} {/prueba_controlador/info_estado.EST(0) -radix hexadecimal}} -expand} /prueba_controlador/info_estado.EST(1) {-height 15 -radix hexadecimal} /prueba_controlador/info_estado.EST(0) {-height 15 -radix hexadecimal}} /prueba_controlador/info_estado
add wave -noupdate -divider {Respuesta Memoria}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/resp_m.m_val -radix hexadecimal}} -subitemconfig {/prueba_controlador/resp_m.m_val {-height 15 -radix hexadecimal}} /prueba_controlador/resp_m
add wave -noupdate -divider {Buffer Expulsiones}
add wave -noupdate /prueba_controlador/bex_control
add wave -noupdate -divider {Control Camino Datos}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/s_control.DAT_acc -radix hexadecimal} {/prueba_controlador/s_control.DAT_palabra_esc -radix hexadecimal} {/prueba_controlador/s_control.DAT_bloque_esc -radix hexadecimal} {/prueba_controlador/s_control.EST_acc -radix hexadecimal} {/prueba_controlador/s_control.EST_esc -radix hexadecimal} {/prueba_controlador/s_control.EST_DE -radix hexadecimal -childformat {{/prueba_controlador/s_control.EST_DE(1) -radix hexadecimal} {/prueba_controlador/s_control.EST_DE(0) -radix hexadecimal}}} {/prueba_controlador/s_control.ET_acc -radix hexadecimal} {/prueba_controlador/s_control.ET_esc -radix hexadecimal} {/prueba_controlador/s_control.muxB -radix hexadecimal} {/prueba_controlador/s_control.CMPET -radix hexadecimal} {/prueba_controlador/s_control.ESC_LEC -radix hexadecimal}} -subitemconfig {/prueba_controlador/s_control.DAT_acc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.DAT_palabra_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.DAT_bloque_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_acc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_DE {-height 15 -radix hexadecimal -childformat {{/prueba_controlador/s_control.EST_DE(1) -radix hexadecimal} {/prueba_controlador/s_control.EST_DE(0) -radix hexadecimal}} -expand} /prueba_controlador/s_control.EST_DE(1) {-height 15 -radix hexadecimal} /prueba_controlador/s_control.EST_DE(0) {-height 15 -radix hexadecimal} /prueba_controlador/s_control.ET_acc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.ET_esc {-height 15 -radix hexadecimal} /prueba_controlador/s_control.muxB {-height 15 -radix hexadecimal} /prueba_controlador/s_control.CMPET {-height 15 -radix hexadecimal} /prueba_controlador/s_control.ESC_LEC {-height 15 -radix hexadecimal}} /prueba_controlador/s_control
add wave -noupdate -divider {Respuesta Cache}
add wave -noupdate -radix hexadecimal /prueba_controlador/resp
add wave -noupdate -divider {Peticion Memoria}
add wave -noupdate -radix hexadecimal /prueba_controlador/pet_m
add wave -noupdate -divider {Memoria lista}
add wave -noupdate -radix hexadecimal /prueba_controlador/mem_lista
add wave -noupdate -divider Arbitro
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/conc_arb.conc_fallo_arb -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/conc_arb.conc_fallo_arb {-radix hexadecimal}} /prueba_controlador/conc_arb
add wave -noupdate -radix hexadecimal -childformat {{/prueba_controlador/pet_arb.pet_arb -radix hexadecimal} {/prueba_controlador/pet_arb.pet_arb_exp -radix hexadecimal}} -expand -subitemconfig {/prueba_controlador/pet_arb.pet_arb {-radix hexadecimal} /prueba_controlador/pet_arb.pet_arb_exp {-radix hexadecimal}} /prueba_controlador/pet_arb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {730529 ps} 0}
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
