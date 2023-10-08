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



; FUNCION EXTERNA

; Compara si el nombre del usuario (string) es igual al de un TDA User,
; para esta función se utiliza currificación
; Esta funcion es utilizada en el RF9 y RF10 por el momento

; Dominio: user (string) x Tda User
; Recorrido: Bool
; Recursion: No aplica

(define equal-name-user (lambda (a)
                          (lambda (b)
                            (if (string=? a (car b)) #t #f))))

