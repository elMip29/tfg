onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ciclo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/reloj
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pcero
add wave -noupdate -divider {PROCESADOR produ./cons.}
add wave -noupdate -divider Productor
add wave -noupdate -radix hexadecimal /prueba_ensamblado/peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -radix hexadecimal /prueba_ensamblado/respuesta
add wave -noupdate -divider {INTERFACE proc/L1}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pe
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet
add wave -noupdate -divider {PETICION en L1}
add wave -noupdate -divider MuxB
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/mux_B/bloque_memoria
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/mux_B/dato_procesador
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/mux_B/salida
add wave -noupdate -divider MuxE
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/mux_E/dir_bloque_proc
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/mux_E/dir_bloque_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/mux_E/salida
add wave -noupdate -divider MuxD
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/mux_D/palabra_0
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/mux_D/palabra_1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/mux_D/salida
add wave -noupdate -divider {CAMPOS cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/estado/campo_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/datos/memoria_datos/campo_datos
add wave -noupdate -divider {CONTROLADOR de cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/prxestado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/derechos_acceso
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/expulsion_modificado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/expulsion_lectura
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/mismo_cont_L2
add wave -noupdate -divider {CONTROLADOR señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/info_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/s_control
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/resp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/resp_L2
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_pet -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_exp -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_ini -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_acc {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_pet {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_esc {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_exp {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2.l2_ini {-radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controlador_cache/pet_L2
add wave -noupdate -divider {BUFFER EXPULSIONES}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/dirExpulsion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bloque_expulsar
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/dir_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bloque_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/validez_bex
add wave -noupdate -divider {INTERFACE L1/L2}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pe
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_listo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L2_L1/resp_cache
add wave -noupdate -divider {PETICION en L2}
add wave -noupdate -divider MuxB
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/camino_datos_cache/mux_B/bloque_memoria
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/camino_datos_cache/mux_B/bloque_L1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/camino_datos_cache/mux_B/salida
add wave -noupdate -divider MuxE
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/mux_E/dir_bloque_L1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/mux_E/dir_bloque_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/mux_E/salida
add wave -noupdate -divider {CAMPOS cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/camino_datos_cache/estado/campo_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/camino_datos_cache/datos/memoria_datos/campo_datos
add wave -noupdate -divider {CONTROLADOR de cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/prxestado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/derechos_acceso
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/expulsion_modificado
add wave -noupdate -divider {CONTROLADOR señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/info_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m
add wave -noupdate -divider {INTERFACE cach./bus}
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_CON/mpet_cntl_e
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_IN/mpet_info_e
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_CON/mresp_cntl_s
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_IN/mresp_info_s
add wave -noupdate -divider BUS
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_IN/mpet_info_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_CON/mpet_cntl_bus
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_CON/mresp_cntl_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/inter_Pr_BUS_IN/mresp_info_bus
add wave -noupdate -divider {INTEFACE bus/mem.}
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_pet_cntl_s
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_datos/m_pet_datos_s
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_datos/m_resp_datos_e
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_resp_cntl_e
add wave -noupdate -divider MEMORIA
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/m_peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/m_pe
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/dir
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/dato_escribir
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/dato_leido
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1421055 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 694
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
WaveRestoreZoom {943466 ps} {2303338 ps}
