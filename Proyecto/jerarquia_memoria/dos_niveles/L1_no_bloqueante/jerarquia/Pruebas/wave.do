onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /prueba_ensamblado/ciclo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/reloj
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pcero
add wave -noupdate -divider {PROCESADOR produ./cons.}
add wave -noupdate -divider Productor
add wave -noupdate -radix hexadecimal /prueba_ensamblado/peticion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/respuesta.dato_leido -radix hexadecimal} {/prueba_ensamblado/respuesta.valido -radix hexadecimal} {/prueba_ensamblado/respuesta.identificador -radix decimal}} -expand -subitemconfig {/prueba_ensamblado/respuesta.dato_leido {-radix hexadecimal} /prueba_ensamblado/respuesta.valido {-radix hexadecimal} /prueba_ensamblado/respuesta.identificador {-radix decimal}} /prueba_ensamblado/respuesta
add wave -noupdate -divider {INTERFACE proc/L1}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pe
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.dir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.pe -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.dato_escribir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.pe {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.dato_escribir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/pet_proc
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.dir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.pe -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.dato_escribir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.pe {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.dato_escribir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/inter_Pr_ca/reg_pet
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
add wave -noupdate -divider ARBITRO
add wave -noupdate -divider {Acceso al camino}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_recursos/pet_rec_fallo
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_recursos/pet_rec_acceso
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_recursos/conc_rec_fallo
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_recursos/conc_rec_acceso
add wave -noupdate -divider {Acceso al bus}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/pet_fallo
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/pet_fallo_exp
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/pet_bex
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/L2_ocupada
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/bex_val
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/bex_depen
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/final_contador
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/forzar_exp
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/conc_fallo
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/arbitraje/arbitro_bus/conc_exp
add wave -noupdate -divider {CAMPOS cache}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/etiquetas/memoria_etiquetas/campo_etiquetas
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/estado/campo_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/camino_datos_cache/datos/memoria_datos/campo_datos
add wave -noupdate -divider {CONTROLADOR ACCESO}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/estado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/prxestado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/derechos_acceso
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/expulsion_modificado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/fallo_secundario
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/mismo_cont_L2
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/contenedor_ocupado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/expulsion_lectura
add wave -noupdate -divider {CONTROLADOR ACCESO señales internas}
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.identificador -radix decimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet.identificador {-height 15 -radix decimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/info_estado
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/s_control_acierto
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/conc_arb
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_arb_camino.pet_arb_acceso -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_arb_camino.pet_arb_fallo -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_arb_camino.pet_arb_acceso {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_arb_camino.pet_arb_fallo {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_arb_camino
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_arb_bus
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/bdf_control
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp.listo -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp.finalizada -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp.identificador -radix decimal}} -expand -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp.listo {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp.finalizada {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp.identificador {-height 15 -radix decimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/resp
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_pet -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_exp -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.identificador -radix decimal}} -expand -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_pet {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_exp {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.l2_ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2.identificador {-height 15 -radix decimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_acceso/pet_L2
add wave -noupdate -divider {CONTROLADOR FALLO}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/estado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/prxestado
add wave -noupdate -divider {CONTROLADOR FALLO señales internas}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/acceso_lec
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/conc_arb_bus
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/conc_arb_camino
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/s_control_fallo
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/pet_arb_bus
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/pet_arb_camino
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/bdf_control
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/bc_control
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/resp
add wave -noupdate -childformat {{/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/pet_L2.identificador -radix decimal}} -expand -subitemconfig {/prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/pet_L2.identificador {-radix decimal}} /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_fallo/pet_L2
add wave -noupdate -divider {CONTROLADOR EXPULSION}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/estado
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/prxestado
add wave -noupdate -divider {CONTROLADOR EXPULSION señales internas}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/forzar_exp
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/concesion_arb
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/tipo_exp
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/pet_arb_bex
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/s_expulsion
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/bex_control
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/controladores/automata_expulsion/pet_L2
add wave -noupdate -divider {BUFFER EXPULSIONES}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bex_control
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/dirExpulsion
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bloque_expulsar
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bex_depen
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/dir_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/bloque_bex
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/validez_bex
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/petExp_bex
add wave -noupdate -divider {contador BEX}
add wave -noupdate -radix unsigned /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/cont_bex/bex_counter
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bex/cont_bex/final
add wave -noupdate -divider {BUFFER DIRECCIONES FALLO}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/dir_fallo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/dato_esc
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/bdf_control
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/identificador
add wave -noupdate -divider registro
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/identificador_reg
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/dir_fallo_reg
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/dato_esc_reg
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/LE_reg
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bdf/val_bdf
add wave -noupdate -divider {BUFFER CARGA}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bc/bloque_mem
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bc/acceso_lec
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bc/bc_cntl
add wave -noupdate -divider registro
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bc/bloque_mem_reg
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/cach_L1/cache/bc/validez_BC
add wave -noupdate -divider {INTERFACE L1/L2}
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pe
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.dir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.dato_escribir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.expulsion -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.dato_escribir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.expulsion {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_L1
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.dir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.dato_escribir -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.expulsion -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.dir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.dato_escribir {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.expulsion {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/reg_pet
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L1_L2/pet_listo
add wave -noupdate -radix hexadecimal /prueba_ensamblado/ensamblado/cache_L2/cach_L2/inter_L2_L1/resp_cache
add wave -noupdate -divider {PETICION en L2}
add wave -noupdate /prueba_ensamblado/ensamblado/cache_L1/modulo_L2_lista/ocupada_L2
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
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.ini -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.exp -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.ini {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.exp {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1.identificador {-radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_L1
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/info_estado.AF -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/info_estado.EST -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/info_estado.AF {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/info_estado.EST {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/info_estado
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.DAT_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.DAT_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.EST_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.EST_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.EST_DE -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.ET_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.ET_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.muxB -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.exp -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.DAT_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.DAT_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.EST_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.EST_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.EST_DE {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.ET_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.ET_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.muxB {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control.exp {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/s_control
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp.listo -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp.finalizada -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp.listo {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp.finalizada {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m.m_val -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m.LE_mem -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m.m_val {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m.LE_mem {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/resp_m
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.m_acc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.m_pet -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.m_esc -radix hexadecimal} {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.identificador -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.m_acc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.m_pet {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.m_esc {-height 15 -radix hexadecimal} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m.identificador {-height 15 -radix hexadecimal}} /prueba_ensamblado/ensamblado/cache_L2/cach_L2/cache/controlador_cache/pet_m
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
WaveRestoreCursors {{Cursor 1} {7753035 ps} 0}
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
WaveRestoreZoom {6780261 ps} {8140133 ps}
