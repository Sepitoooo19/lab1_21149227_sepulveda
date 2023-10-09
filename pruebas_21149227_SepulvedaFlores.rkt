#lang racket

(require "TDAOption_21149227_SepulvedaFlores.rkt")
(require "TDAFlow_21149227_SepulvedaFlores.rkt")
(require "TDAChatbot_21149227_SepulvedaFlores.rkt")
(require "TDASystem_21149227_SepulvedaFlores.rkt")
(require "TDAUser_21149227_SepulvedaFlores.rkt")
(require "TDAChatHistory_21149227_SepulvedaFlores.rkt")


;chatbot 0
(define a1(option 1 "1) Ayudantias" 1 1 "videos" "aprender" "usachpremium"))
(define a2(option 2 "2) Flojear" 2 1  "procrastinar"))
(define a3(option 3 "3) Jugar" 3 1 "juegos" "videojuegos" "consolas"))

(define a4 (flow 1 "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?" a1 a2 a3 a1 a1 a2 a3))

(define a5 (flow-add-option a4 a1))
(define a6 (flow-add-option a5 a2))
(define a7 (flow-add-option a6 a3))

(define a8 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 a4 a4 a4 a4 a4 a4))

;chatbot 1 flujo1
(define b1(option 1 "1) Primer Nivel" 1 1 "calculo1" "fisica1" "algebra1" "idi" ))
(define b2(option 2 "2) Segundo Nivel" 1 1 "calculo2" "fisica2" "algebra2" "progra" ))
(define b3(option 3 "3) Tercer Nivel" 1 1 "edo" "calculo3" "electro" "econo" ))
(define b4 (option 4 "4) Volver" 0 1 "Regresar" "Salir" "Volver"))

;chatbot1 flujo 2

(define c1(option 1 "1) Calculo 1" 1 2 "funciones" "limites" "derivadas"))
(define c2(option 2 "2) Algebra 1" 1 2 "polinomios" "logica" "conjunto"))
(define c3(option 3 "3) Fisica 1" 1 2 "energia" "vectores" "fuerza"))
(define c4(option 4 "4) Cambiar Nivel" 1 1 "Cambiar" "Volver" "Salir"))
;chatbot1 flujo 3
(define d1(option 1 "1) Ayudantias completas" 1 3 "youtube" "uvirtual"))
(define d2(option 2 "2) Capsulas" 1 3 "shorts" "ejercicios"))
(define d3(option 3 "2) Papeo" 1 3 "drive" "guias" "resumenes"))
(define d4(option 4 "4) Agregar más ramos" 1 2 "Volver" "ramos"))
(define d5(option 5 "4) Otro nivel" 1 1 "nivel"))

(define e1(flow 1 "Flujo 1 Chatbot1\n¿De que nivel te gustaría consultar el material?" b1 b2 b3 b4))
(define e2(flow 2 "Flujo 2 Chatbot1\n¿Que ramo quieres ver?" c1 c2 c3 c4))
(define e3(flow 3 "Flujo 3 Chatbot1\n¿Que tipo de material quieres ver?" d1 d2 d3 d4 d5))
(define e4(chatbot 1 "Usach Premium"  "Bienvenido\n¿Que te gustaria hacer?" 1 e1 e2 e3))
(define e6(chatbot-add-flow e4 e3))


;chatbot 2

(define f1(option 1 "1) Echarse en la cama" 2 1 "dormir" "acostarse"))
(define f2(option 2 "2) No hacer nada" 2 1 "nada"))
(define f3(option 3 "3) Volver" 0 1 "Volver" "salir"))
(define f4(flow 1 "Flujo 1 Chatbot2\n ¿Como te gustaria procrastinar?" f1 f2 f3))
(define f5(chatbot 2 "Procrastinacion"  "Bienvenido\n¿Que te gustaria hacer?" 1 f4 f4 f4))
(define f6(chatbot-add-flow f5 f4))

;chatbot 3
(define g1(option 1 "1) Computador" 3 1 "pc" "torre" "ordenador"))
(define g2(option 2 "1) Consola" 3 1 "ps5" "xbox" "switch"))
(define g3(option 3 "1) Celular" 3 1 "smartphone" "android" "apk"))
(define g4(flow 1 "Flujo 1 Chatbot3\n ¿En donde te gustaria jugar?" g1 g2 g3))
(define g5(chatbot 3 "Jugar"  "Bienvenido\n¿Que te gustaria hacer?" 1 g4 g4 g4))
(define g6(chatbot-add-flow g5 g4))

;system
(define h1(system "Chatbots paradigmas" 0 a8 a8 e6 f5 g5))
(define h2(system-add-chatbot h1 a8))

(define h3 (system-add-user h2 "juan"))
(define h4 (system-add-user h3 "pedro"))
(define h5 (system-add-user h4 "pedro"))
(define h6 (system-add-user h5 "diego"))

(define h7 (system-login h6 "benja"))
(define h8 (system-login h7 "juan"))
(define h9 (system-login h8 "pedro"))
(define h10(system-logout h9))

(define i1(system "Chatbots" 1 a8 a8 e4 f5 g5))
(define i2(system-add-chatbot i1 a8))

(define i3 (system-add-user i2 "benja"))
(define i4 (system-add-user i3 "seba"))
(define i5 (system-add-user i4 "seba"))
(define i6 (system-add-user i5 "alejandro"))

(define i7 (system-login i6 "pedro"))
(define i8 (system-login i7 "alejandro"))
(define i9 (system-login i8 "seba"))
(define i10(system-logout i9))

(define j1(system "ola" 2 a8 a8 e4 ))
(define j2(system-add-chatbot j1 a8))

(define j3 (system-add-user j2 "reinaldo"))
(define j4 (system-add-user j3 "jaime"))
(define j5 (system-add-user j4 "jaime"))
(define j6 (system-add-user j5 "bastian"))

(define j7 (system-login j6 "byron"))
(define j8 (system-login j7 "reinaldo"))
(define j9 (system-login j8 "jaime"))
(define j10(system-logout j9))

(define k1(system-talk-rec h9 "hola"))
(define k2(system-talk-norec h9 "0"))

(define l1(system-talk-rec i9 "hola"))
(define l2(system-talk-norec i9 "0"))

(define m1(system-talk-rec j9 "hola"))
(define m2(system-talk-norec j9 "0"))









; |------------------------- Script de pruebas enunciado -----------------------------|


;Chabot0
(define op1 (option  1 "1) Viajar" 1 1 "viajar" "turistear" "conocer"))
(define op2 (option  2 "2) Estudiar" 2 1 "estudiar" "aprender" "perfeccionarme"))
(define f10 (flow 1 "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2 y op1
(define f11 (flow-add-option f10 op1)) ;se intenta añadir opción duplicada            
(define cb0 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 f10 f10 f10 f10))  ;solo añade una ocurrencia de f10
;Chatbot1
(define op3 (option 1 "1) New York, USA" 1 2 "USA" "Estados Unidos" "New York"))
(define op4 (option 2 "2) París, Francia" 1 1 "Paris" "Eiffel"))
(define op5 (option 3 "3) Torres del Paine, Chile" 1 1 "Chile" "Torres" "Paine" "Torres Paine" "Torres del Paine"))
(define op6 (option 4 "4) Volver" 0 1 "Regresar" "Salir" "Volver"))
;Opciones segundo flujo Chatbot1
(define op7 (option 1 "1) Central Park" 1 2 "Central" "Park" "Central Park"))
(define op8 (option 2 "2) Museos" 1 2 "Museo"))
(define op9 (option 3 "3) Ningún otro atractivo" 1 3 "Museo"))
(define op10 (option 4 "4) Cambiar destino" 1 1 "Cambiar" "Volver" "Salir")) 
(define op11 (option 1 "1) Solo" 1 3 "Solo")) 
(define op12 (option 2 "2) En pareja" 1 3 "Pareja"))
(define op13 (option 3 "3) En familia" 1 3 "Familia"))
(define op14 (option 4 "4) Agregar más atractivos" 1 2 "Volver" "Atractivos"))
(define op15 (option 5 "5) En realidad quiero otro destino" 1 1 "Cambiar destino"))
(define f20 (flow 1 "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?" op3 op4 op5 op6))
(define f21 (flow 2 "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?" op7 op8 op9 op10))
(define f22 (flow 3 "Flujo 3 Chatbot1\n¿Vas solo o acompañado?" op11 op12 op13 op14 op15))
(define cb1 (chatbot 1 "Agencia Viajes"  "Bienvenido\n¿Dónde quieres viajar?" 1 f20 f21 f22))
;Chatbot2
(define op16 (option 1 "1) Carrera Técnica" 2 1 "Técnica"))
(define op17 (option 2 "2) Postgrado" 2 1 "Doctorado" "Magister" "Postgrado"))
(define op18 (option 3 "3) Volver" 0 1 "Volver" "Salir" "Regresar"))

(define f30 (flow 1 "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?" op16 op17 op18))
(define cb2 (chatbot 2 "Orientador Académico"  "Bienvenido\n¿Qué te gustaría estudiar?" 1 f30))
;Sistema
(define s0 (system "Chatbots Paradigmas" 0 cb0 cb0 cb0 cb1 cb2))
(define s1 (system-add-chatbot s0 cb0)) ;igual a s0
(define s2 (system-add-user s1 "user1"))
(define s3 (system-add-user s2 "user2"))
(define s4 (system-add-user s3 "user2"))
(define s5 (system-add-user s4 "user3"))
(define s6 (system-login s5 "user8"))
(define s7 (system-login s6 "user1"))
(define s8 (system-login s7 "user2"))
(define s9 (system-logout s8))
(define s10 (system-login s9 "user2"))
(define s11 (system-talk-rec s10 "hola"))
(define s12 (system-talk-norec s10 "0"))
