#lang racket

; TDA_Flow

; Requerimiento Funcional N°3

; Constructor Flow
; Esta función construye un flow que está formada por una lista que contiene:
; un id, un nombre y 0, 1 o multiples opciones

; Dominio: id (int) X name-msg (String)  X Option*

; Recorrido: Flow

; Recursión: No aplica

(define (flow id name-msg . options)
  (list id name-msg (remove-duplicates options #:key car)))



; Selector - get-id-flow
; Función de seleccionar/obtener el id del flow
; Dominio: flow
; Recorrido: int

(define (get-id-flow flow)
  (car flow))

; Selector - get-namemsg-op
; Función de seleccionar/obtener el nombre del flow 
; Dominio: flow
; Recorrido: string

(define (get-namemsg-flow flow)
  (cadr flow))

; Selector - get-code-op
; Función de seleccionar/obtener el codigo de la option
; Dominio: flow
; Recorrido: list

(define (get-ops-flow flow)
  (caddr flow))
