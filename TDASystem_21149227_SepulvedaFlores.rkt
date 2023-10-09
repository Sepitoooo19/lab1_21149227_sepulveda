#lang racket
(require "TDAOption_21149227_SepulvedaFlores.rkt")
(require "TDAFlow_21149227_SepulvedaFlores.rkt")
(require "TDAChatbot_21149227_SepulvedaFlores.rkt")
(require "TDAUser_21149227_SepulvedaFlores.rkt")
(require "TDAChatHistory_21149227_SepulvedaFlores.rkt")
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
  (list name InitialChatbotCodeLink '() '() '() (remove-duplicates chatbot #:key car)))



; Función complementaria no pedida en el laboratorio:

; Constructor System-user

; Esta función construye un system que está formado por una lista que contiene:
; un name, un InitialChatbotCodeLink y 0, 1 o multiples chatbots.
; En este caso, el constructor del system tambien posee en su dominio, además de los argumentos anteriores, un user y un chatHistory

(define(system-user name InitialChatbotCodeLink userList logedUserList chatHistoryList chatbotList)
  (list name InitialChatbotCodeLink userList logedUserList chatHistoryList chatbotList))


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


; Selector - get-chatHistoryList-list
; Función de seleccionar/obtener la lista de historiales del system
; Dominio: system
; Recorrido: list


(define (get-chatHistory-list system)
  (cadr(reverse system)))

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
                   (get-chatHistory-list system)
                   (get-chatbot-list system))
      system
      ))

; Requerimiento Funcional N°10

; Modificador System - system-login
; Esta funcion "logea" un usuario al sistema, además verifica que dicho usuario esté registrado anteriormente y que no haya otro
; usuario logeado

; Dominio: system X user (string)

; Recorrido: System

; Recursión: No aplica
(define (system-login system userName)
  (if(and (not (equal?(filter (equal-name-user userName) (get-user-list system)) '())) (empty? (get-logedUser-list system)))
      (system-user (get-name-system system)
                    (get-ICCL-system system)
                    (get-user-list system)
                    (append  (get-logedUser-list system) (user userName))
                    (get-chatHistory-list system)
                    (get-chatbot-list system))
       system
       ))



; Requerimiento Funcional N°11

; Modificador System - system-logout
; Esta funcion "deslogea" un usuario del sistema 

; Dominio: system X user (string)

; Recorrido: System

; Recursión: No aplica
(define (system-logout system)
        (system-user (get-name-system system)
                    (get-ICCL-system system)
                    (get-user-list system)
                    '()
                    (get-chatHistory-list system)
                    (get-chatbot-list system)))



; Requerimiento Funcional N°12
; Funcion TDA_System - system-talk-rec
; Esta funcion interactua con el sistema y los chatbots de manera recursiva, cabe destacar que solo se pudo implementar para el caso base

; Dominio: system X message (string)

; Recorrido: System

; Recursión: Natural
(define(system-talk-rec system message)
  (if(empty?(get-logedUser-list system)) system
     (if (or(equal? message "hola")(equal? message (number->string 0)))(car(get-chatbot-list system))
         system))
  (system-user (get-name-system system)
               (get-ICCL-system system)
               (get-user-list system)
               (get-logedUser-list system)
               (cons (car (get-logedUser-list system)) (cons(get-chatHistory-list system) (cons (car(get-chatbot-list system)) null))) 
               (get-chatbot-list system)))


; Requerimiento Funcional N°13
; Funcion TDA_System - system-talk-rec
; Esta funcion interactua con el sistema y los chatbots de manera declarativa y se añade al chatHistory,
; cabe destacar que solo se pudo implementar para el caso base

; Dominio: system X message (string)

; Recorrido: System

; Recursión: no aplica

(define (system-talk-norec system message)
  (if(empty?(get-logedUser-list system)) system
     (if (or(equal? message "hola")(equal? message (number->string 0)))(car(get-chatbot-list system))
         system))
  (system-user (get-name-system system)
               (get-ICCL-system system)
               (get-user-list system)
               (get-logedUser-list system)
               (cons (car (get-logedUser-list system)) (cons(get-chatHistory-list system) (cons (car(get-chatbot-list system)) null))) 
               (get-chatbot-list system))) 







;(define (search-flow flows message)
;  (if (empty? (get-flows-cb(get-chatbot-list flows))) '()
;      (if (not(equal? (get-CBCL-op(get-ops-flow (get-flows-cb(get-chatbot-list flows)))) (string->number message))) (cons (car flows)(search-flow message (cdr flows)))
;          (if (equal? (get-id-cb(get-chatbot-list flows)) (get-CBCL-op(get-ops-flow (get-flows-cb(get-chatbot-list flows))))) chatbot
;              (cons (car (get-chatbot-list flows))(cons (search-flow message (cdr (get-chatbot-list flows))) null))))))   
          
          





