#lang racket
(require "TDAOption_21149227_SepulvedaFlores.rkt")
(require "TDAFlow_21149227_SepulvedaFlores.rkt")
(require "TDAChatbot_21149227_SepulvedaFlores.rkt")
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

; Recorrido:System

; Recursión: No aplica

(define (system name InitialChatbotCodeLink . chatbot)
  (list name InitialChatbotCodeLink '() '() (remove-duplicates chatbot #:key car)))



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
; Función de seleccionar/obtener la lista de chatbots del system
; Dominio: system
; Recorrido: list


(define (get-chatbot-list system)
  (caddr system))








