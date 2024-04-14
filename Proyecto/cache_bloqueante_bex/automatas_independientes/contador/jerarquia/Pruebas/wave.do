onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ciclo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/reloj
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pcero
add wave -noupdate -divider {PROCESADOR produ./cons.}
add wave -noupdate -divider Productor
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/peticion.acc -radix hexadecimal} {/prueba_ensamblado/peticion.dir -radix hexadecimal} {/prueba_ensamblado/peticion.pe -radix hexadecimal} {/prueba_ensamblado/peticion.ini -radix hexadecimal} {/prueba_ensamblado/peticion.dato_escribir -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/peticion.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.pe {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.dato_escribir {-height 15 -radix hexadecimal}} /prueba_ensamblado/peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -radix hexadecimal /prueba_ensamblado/respuesta
add wave -noupdate -divider {INTERFACE proc/cache}
add wave -noupdate -divider {PETICION en cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/inter_Pr_ca/pe
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/peticion
add wave -noupdate -divider MuxB
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/mux_B/bloque_memoria
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/mux_B/dato_procesador
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/mux_B/salida
add wave -noupdate -divider MuxE
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/mux_E/dir_bloque_proc
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/mux_E/dir_bloque_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/mux_E/salida
add wave -noupdate -divider MuxD
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/mux_D/palabra_0
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/mux_D/palabra_1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/mux_D/salida
add wave -noupdate -divider {CAMPOS cache}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(0) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(3) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(4) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(5) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(6) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(7) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(0) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(1) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(2) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(3) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(4) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(5) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(6) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(7) {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(0) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(3) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(4) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(5) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(6) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(0) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(1) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(2) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(3) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(4) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(5) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(6) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7) {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(0) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(3) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(4) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(5) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(6) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(7) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(0) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(1) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(2) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(3) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(4) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(5) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(6) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(7) {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos
add wave -noupdate -divider Arbitro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/pet_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/pet_fallo_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/pet_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/forzar_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/conc_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/conc_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/bex_depen
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/arbitraje/final_contador
add wave -noupdate -divider {CONTROLADOR FALLO}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/prxestado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/derechos_acceso
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/expulsion_modificado
add wave -noupdate -divider {CONTROLADOR FALLO señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/pet
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/info_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/s_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/pet_arb
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/resp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_fallo/pet_m
add wave -noupdate -divider {CONTROLADOR EXPULSION}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_expulsion/estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_expulsion/prxestado
add wave -noupdate -divider {CONTROLADOR EXPULSION señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_expulsion/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/controladores/automata_expulsion/pet_m
add wave -noupdate -divider {BUFFER EXPULSIONES}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/dirExpulsion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/bloque_expulsar
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/dir_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/bloque_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/validez_bex
add wave -noupdate -divider contador
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/cont_bex/bex_counter
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/cach/cache/bex/cont_bex/final
add wave -noupdate -divider {INTERFACE cach./bus}
add wave -noupdate -divider {Memoria Lista}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/modulo_mem_lista/ocupada_mem
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_IN/mpet_info_e
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_CON/mpet_cntl_e
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_CON/mresp_cntl_s
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_IN/mresp_info_s
add wave -noupdate -divider BUS
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_CON/mpet_cntl_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_IN/mpet_info_bus
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_IN/mresp_info_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_bloqueante/inter_Pr_BUS_CON/mresp_cntl_bus
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
WaveRestoreCursors {{Cursor 1} {850862 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 264
configure wave -valuecolwidth 116
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
WaveRestoreZoom {470040 ps} {1410136 ps}
