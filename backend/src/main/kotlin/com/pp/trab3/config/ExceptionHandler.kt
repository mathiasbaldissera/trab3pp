package com.pp.trab3.config

import com.pp.trab3.exceptions.NotFoundException

import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.ExceptionHandler


@ControllerAdvice
class ExceptionHandler {
    @ResponseStatus(HttpStatus.CONFLICT) // 409
    @ExceptionHandler(NotFoundException::class)
    fun handleConflict(): ResponseEntity.HeadersBuilder<*> {
        return ResponseEntity.notFound()
    }
}