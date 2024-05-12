onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /prueba_ensamblado/ciclo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/reloj
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pcero
add wave -noupdate -divider {PROCESADOR produ./cons.}
add wave -noupdate -divider Productor
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/peticion.acc -radix hexadecimal} {/prueba_ensamblado/peticion.dir -radix hexadecimal} {/prueba_ensamblado/peticion.pe -radix hexadecimal} {/prueba_ensamblado/peticion.ini -radix hexadecimal} {/prueba_ensamblado/peticion.dato_escribir -radix hexadecimal} {/prueba_ensamblado/peticion.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/peticion.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.pe {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.dato_escribir {-height 15 -radix hexadecimal} /prueba_ensamblado/peticion.identificador {-radix hexadecimal}} /prueba_ensamblado/peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/respuesta.dato_leido -radix hexadecimal} {/prueba_ensamblado/respuesta.valido -radix hexadecimal} {/prueba_ensamblado/respuesta.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/respuesta.dato_leido {-height 15 -radix hexadecimal} /prueba_ensamblado/respuesta.valido {-height 15 -radix hexadecimal} /prueba_ensamblado/respuesta.identificador {-radix hexadecimal}} /prueba_ensamblado/respuesta
add wave -noupdate -divider {INTERFACE proc/cache}
add wave -noupdate -divider {PETICION en cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/pe
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.dir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.pe -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.dato_escribir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.pe {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.dato_escribir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion.identificador {-radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/inter_Pr_ca/reg_pet
add wave -noupdate -divider MuxB
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/mux_B/bloque_memoria
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/mux_B/dato_procesador
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/mux_B/salida
add wave -noupdate -divider {Control MuxB}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/control_muxB/conc_fallo_recursos
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/control_muxB/conc_acceso_recursos
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/control_muxB/muxB_interno
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/control_muxB/sel_MuxB
add wave -noupdate -divider MuxE
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/mux_E/dir_bloque_proc
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/mux_E/dir_bloque_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/mux_E/salida
add wave -noupdate -divider MuxD
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/mux_D/palabra_0
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/mux_D/palabra_1
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/mux_D/salida
add wave -noupdate -divider MuxBDF
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dato_proc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dato_fallo -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dir_proc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dir_fallo -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dato_proc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dato_fallo {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dir_proc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF.dir_fallo {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/entrada_BDF
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/salida_BDF.dato_muxbdf -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/salida_BDF.dir_muxbdf -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/salida_BDF.dato_muxbdf {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/salida_BDF.dir_muxbdf {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/muxs_bdf/salida_BDF
add wave -noupdate -divider {CAMPOS cache}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(0) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(3) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(4) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(5) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(6) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(7) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(0) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(1) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(2) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(3) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(4) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(5) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(6) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas(7) {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(0) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(3) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(4) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(5) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(6) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7) -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(0) -radix hexadecimal}}}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(0) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(1) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(2) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(3) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(4) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(5) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(6) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7) {-height 15 -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(0) -radix hexadecimal}} -expand} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(2) {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(1) {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado(7)(0) {-radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/estado/campo_estado
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(0) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(1) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(2) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(3) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(4) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(5) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(6) -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(7) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(0) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(1) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(2) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(3) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(4) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(5) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(6) {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos(7) {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/camino_datos_cache/datos/memoria_datos/campo_datos
add wave -noupdate -divider ARBITRO
add wave -noupdate -divider {Acceso al Bus}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/pet_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/pet_fallo_exp
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/pet_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/bex_depen
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/final_contador
add wave -noupdate -divider {Acceso a los recursos}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/arbitro_recursos/pet_rec_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/arbitro_recursos/pet_rec_acceso
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/arbitro_recursos/conc_rec_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/arbitraje/arbitro_recursos/conc_rec_acceso
add wave -noupdate -divider {CONTROLADOR ACCESO}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/prxestado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/derechos_acceso
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/expulsion_modificado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/contenedor_ocupado
add wave -noupdate -divider {CONTROLADOR ACCESO señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/info_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/conc_arb
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/val_BDF
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/val_BEX
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.DAT_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.DAT_palabra_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.DAT_bloque_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_esc_ocupado -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_DE -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.ET_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.ET_esc -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.DAT_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.DAT_palabra_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.DAT_bloque_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_esc_ocupado {-radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.EST_DE {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.ET_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto.ET_esc {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/s_control_acierto
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_camino
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus.pet_arb -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus.pet_arb_exp -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus.pet_bex_arb -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus.pet_arb {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus.pet_arb_exp {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus.pet_bex_arb {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/pet_arb_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/bdf_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_acceso/resp
add wave -noupdate -divider {CONTROLADOR FALLO}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/estado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/prxestado
add wave -noupdate -divider {CONTROLADOR FALLO señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/conc_arb_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/conc_arb_camino
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/op_LE
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/val_BDF
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/val_BC
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/s_control_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_arb_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_arb_camino
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.pe_bdf -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.validez_bdf -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.pe_val_bdf -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.pe_bdf {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.validez_bdf {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control.pe_val_bdf {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bdf_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/bc_control
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp.listo -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp.finalizada -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp.listo {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp.finalizada {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp.identificador {-radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/resp
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.m_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.m_pet -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.m_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.m_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.m_pet {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.m_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m.identificador {-radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/pet_m
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_fallo/lec_ET_EST
add wave -noupdate -divider {CONTROLADOR EXPULSION}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/estado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/prxestado
add wave -noupdate -divider {CONTROLADOR EXPULSION señales internas}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/s_expulsion
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex.pet_arb -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex.pet_arb_exp -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex.pet_bex_arb -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex.pet_arb {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex.pet_arb_exp {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex.pet_bex_arb {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_arb_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/controladores/automata_expulsion/pet_m
add wave -noupdate -divider {BUFFER EXPULSIONES}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/dirExpulsion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/bloque_expulsar
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/bex_depen
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/dir_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/bloque_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/validez_bex
add wave -noupdate -divider contador
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/cont_bex/final
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bex/cont_bex/bex_counter
add wave -noupdate -divider {BUFFER DIRECCION FALLO}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/dir_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/dato_esc
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/bdf_control
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/dir_fallo_reg
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/dato_esc_reg
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/LE_reg
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bdf/val_bdf
add wave -noupdate -divider {BUFFER CARGA}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bc/acceso_lec
add wave -noupdate /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bc/bc_cntl
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bc/bloque_mem_reg
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/cach/cache/bc/validez_BC
add wave -noupdate -divider {INTERFACE cach./bus}
add wave -noupdate -divider {Memoria Lista}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/modulo_mem_lista/ocupada_mem
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_IN/mpet_info_e
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mpet_cntl_e
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mresp_cntl_s
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_IN/mresp_info_s
add wave -noupdate -divider BUS
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_IN/mpet_info_bus
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mpet_cntl_bus.m_pet -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mpet_cntl_bus.m_pe -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mpet_cntl_bus.m_pet {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mpet_cntl_bus.m_pe {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mpet_cntl_bus
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mresp_cntl_bus.m_val -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mresp_cntl_bus.LE_mem -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mresp_cntl_bus.m_val {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mresp_cntl_bus.LE_mem {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_CON/mresp_cntl_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_no_bloqueante/inter_Pr_BUS_IN/mresp_info_bus
add wave -noupdate -divider {INTEFACE bus/mem.}
add wave -noupdate -divider Peticion
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_pet_cntl_s.m_pet -radix hexadecimal} {/prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_pet_cntl_s.m_pe -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_pet_cntl_s.m_pet {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_pet_cntl_s.m_pe {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_pet_cntl_s
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_datos/m_pet_datos_s
add wave -noupdate -divider Respuesta
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_datos/m_resp_datos_e
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_resp_cntl_e.m_val -radix hexadecimal} {/prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_resp_cntl_e.LE_mem -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_resp_cntl_e.m_val {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_resp_cntl_e.LE_mem {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/memoria/inter_mem_bus_control/m_resp_cntl_e
add wave -noupdate -divider MEMORIA
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/m_peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/m_pe
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/dir
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/dato_escribir
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/memoria/memoria_principal/memoria/dato_leido
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1858309 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 804
configure wave -valuecolwidth 116
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {1321650 ps} {2523163 ps}
