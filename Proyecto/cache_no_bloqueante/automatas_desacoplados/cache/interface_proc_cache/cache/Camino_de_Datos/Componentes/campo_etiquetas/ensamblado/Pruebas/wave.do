onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider prueba
add wave -noupdate /prueba_etiquetas/reloj
add wave -noupdate /prueba_etiquetas/etiq_entrada
add wave -noupdate /prueba_etiquetas/DL
add wave -noupdate /prueba_etiquetas/AF
add wave -noupdate /prueba_etiquetas/final
add wave -noupdate -divider {Memoria Etiquetas}
add wave -noupdate /prueba_etiquetas/etiquetas/etiq_entrada
add wave -noupdate /prueba_etiquetas/etiquetas/DL
add wave -noupdate /prueba_etiquetas/etiquetas/AF
add wave -noupdate /prueba_etiquetas/etiquetas/memoria_etiquetas/campo_etiquetas
add wave -noupdate /prueba_etiquetas/etiquetas/memoria_etiquetas/ET_e
add wave -noupdate /prueba_etiquetas/etiquetas/memoria_etiquetas/DL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 362
configure wave -valuecolwidth 48
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
WaveRestoreZoom {0 ps} {902 ps}
