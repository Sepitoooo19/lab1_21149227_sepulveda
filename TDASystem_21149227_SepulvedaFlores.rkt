#lang racket
(require "TDAOption_21149227_SepulvedaFlores.rkt")
(require "TDAFlow_21149227_SepulvedaFlores.rkt")
(require "TDAChatbot_21149227_SepulvedaFlores.rkt")
(require "TDAUser_21149227_SepulvedaFlores.rkt")
(provide (all-defined-out))


; TDA_System

; Requerimiento Funcional N°7

; Constructor System
; Esta función construye un system que está formado por una lista que contiene:
; un name, un InitialChatbotCodeLink y 0, 1 o multiples chatbots.
; Cabe destacar que, a pesar de que no se encuentren en el dominio inicial, el constructor del system tambien posee un user y un chatHistory
; que se implementaran en un futuro
; la funcion verifica que no se repitan los chatbots mediante su id 

; Dominio: name (string) X InitialChatbotCodeLink (Int) X chatbot*

; Recorrido: System

; Recursión: No aplica

(define (system name InitialChatbotCodeLink . chatbot)
  (list name InitialChatbotCodeLink '() '() (remove-duplicates chatbot #:key car)))



; Función complementaria no pedida en el laboratorio:

; Constructor System-user

; Esta función construye un system que está formado por una lista que contiene:
; un name, un InitialChatbotCodeLink y 0, 1 o multiples chatbots.
; En este caso, el constructor del system tambien posee en su dominio, además de los argumentos anteriores, un user y un chatHistory

(define(system-user name InitialChatbotCodeLink userList logedUserList chatbotList)
  (list name InitialChatbotCodeLink userList logedUserList chatbotList))


; Selector - get-name-system
; Función de seleccionar/obtener el name del system
; Dominio: system
; Recorrido: string

(define (get-name-system system)
  (car system))

; Selector - get-ICCL-system
; Función de seleccionar/obtener el initialChatbotCodeLink del system
; Dominio: system
; Recorrido: int

(define (get-ICCL-system system)
  (cadr system))

; Selector - get-chatbot-list
; Función de seleccionar/obtener la lista de usuarios registrados del system
; Dominio: system
; Recorrido: list


(define (get-user-list system)
  (caddr system))

; Selector - get-chatbot-list
; Función de seleccionar/obtener la lista de usuarios logeados del system
; Dominio: system
; Recorrido: list


(define (get-logedUser-list system)
  (cadddr system))


; Selector - get-chatbot-list
; Función de seleccionar/obtener la lista de chatbots del system
; Dominio: system
; Recorrido: list


(define (get-chatbot-list system)
  (car(reverse system)))



; Requerimiento Funcional N°8

; Modificador System - system-add-chatbot
; Esta función añade chatbots al sistema ya creado,
; además de verificar que el chatbot añadido no exista dentro del sistema,
; eso quiere decir que si el chatbot ya existe dentro de este, no se agrega, caso contrario,
; si se agrega

; Dominio: System X Chatbot

; Recorrido: System

; Recursión: No aplica

(define (system-add-chatbot system . chatbot)
  (if (= (get-id-cb(car(get-chatbot-list system)))(get-id-cb(car chatbot))) system
      (cons (get-name-system system)
            (cons (get-ICCL-system system)
                  (cons (append(get-chatbot-list system)
                               chatbot) null)))))


; Requerimiento Funcional N°9

; Modificador System - system-add-user
; Esta funcion "registra" un usuario al sistema, además verifica que dicho usuario no esté registrado anteriormente

; Dominio: system X user (string)

; Recorrido: System

; Recursión: No aplica

(define (system-add-user system userName)
  (if (equal? (filter (equal-name-user userName) (get-user-list system)) '())
      (system-user (get-name-system system)
                   (get-ICCL-system system)
                   (cons (user userName) (get-user-list system))
                   (get-logedUser-list system)
                   (get-chatbot-list system))
      system
      ))



