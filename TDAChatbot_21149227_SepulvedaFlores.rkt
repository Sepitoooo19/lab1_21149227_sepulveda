#lang racket
(require "TDAOption_21149227_SepulvedaFlores.rkt")
(require "TDAFlow_21149227_SepulvedaFlores.rkt")
(provide (all-defined-out))

; TDA_Chatbot

; Requerimiento Funcional N°5

; Constructor del Chatbot
; Esta función construye un chatbot que está formado por una lista que contiene:
; un chatbotId, un nombre, un mensaje de bienvenida, un startFlowId y 0, 1 o multiples flows

; Dominio: chatbotID (int) X name (String) X welcomeMessage (String) X startFlowId(int) X  flows*

; Recorrido: Chatbot

; Recursión: No aplica


(define (chatbot id name welcomeMessage startFlowId . flows)
  (list id name welcomeMessage startFlowId (remove-duplicates flows #:key car)))


; Selector - get-id-cb
; Función de seleccionar/obtener el id del chatbot
; Dominio: chatbot
; Recorrido: int

(define (get-id-cb chatbot)
  (car chatbot))


; Selector - get-name-cb
; Función de seleccionar/obtener el nombre del chatbot
; Dominio: chatbot
; Recorrido: string

(define (get-name-cb chatbot)
  (cadr chatbot))


; Selector - get-WelcomeM-cb
; Función de seleccionar/obtener el mensaje de bienvenida del chatbot
; Dominio: chatbot
; Recorrido: string

(define (get-WelcomeM-cb chatbot)
  (caddr chatbot))


; Selector - get-sFL-cb
; Función de seleccionar/obtener el starFlowId del chatbot
; Dominio: chatbot
; Recorrido: int

(define (get-sFL-cb chatbot)
  (cadddr chatbot))


; Selector - get-flows-cb
; Función de seleccionar/obtener los flows del chatbot
; Dominio: chatbot
; Recorrido: list

(define (get-flows-cb chatbot)
  (car(reverse chatbot)))