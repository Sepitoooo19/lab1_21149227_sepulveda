#lang racket

(provide (all-defined-out))
;TDA chatHistory

; Constructor chatHistory
; Esta función construye un chatHistory que está formado unicamente por una lista vacía,
; ya que su contenido depende del TDA User

; Dominio: list

; Recorrido: list

(define(chatHistory history)
  (list '()))

; Selector - get-history
; Función de seleccionar/obtener la lista del historial
; Dominio: history
; Recorrido: list

(define (get-history history)
  (car chatHistory))

