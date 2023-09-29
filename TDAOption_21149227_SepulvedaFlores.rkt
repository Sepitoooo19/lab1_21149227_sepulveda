#lang racket

; TDA_Option

(provide (all-defined-out))

; Constructor option
; Esta función construye una option que está formada por una lista que contiene:
; un codigo, un mensaje, un codigo para linkear los chatbots, un codigo inicial para linkear los flow
; y multiples palabras claves

; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword*

; Recorrido: option

; Recursión: No aplica

(define (option code name-message ChatbotCodeLink initialFlowCodeLink . keywords)
  (list code name-message ChatbotCodeLink initialFlowCodeLink keywords))



; Selector - get-code-op
; Función de seleccionar/obtener el codigo de la option
; Dominio: option
; Recorrido: int

(define (get-code-op option)
  (car option))



; Selector - get-message-op
; Función de seleccionar/obtener el mensaje de la option
; Dominio: option
; Recorrido: string

(define (get-message-op option)
  (cadr option))



; Selector - get-CBCL-op
; Función de seleccionar/obtener el ChatbotCodeLink de la option
; Dominio: option
; Recorrido: int

(define (get-CBCL-op option)
  (caddr option))



; Selector - get-IFCL-op
; Función de seleccionar/obtener el InitialFlowCodeLink de la option
; Dominio: option
; Recorrido: int

(define (get-IFCL-op option)
  (cadddr option))



; Selector - get-keywords-op
; Función de seleccionar/obtener los keywords de la option
; Dominio: option
; Recorrido: lista que contiene strings

(define (get-keywords-op option)
  (car(reverse option)))


