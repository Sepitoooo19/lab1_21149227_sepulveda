#lang racket
(provide (all-defined-out))

; TDA User

; Constructor User
; Esta función construye un User que está formado por una lista que contiene:
; un name y en un futuro, se le agregará al dominio un chatHistory

; Dominio: name (string)

; Recorrido: User

; Recursión: No aplica


(define (user name)
  (cons (string-downcase name) '() ))


; Selector - get-name-user
; Función de seleccionar/obtener el name del user
; Dominio: user
; Recorrido: string

(define (get-name-user user)
  (car user))
