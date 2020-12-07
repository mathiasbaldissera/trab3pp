package com.pp.trab3.controller

import com.pp.trab3.exceptions.NotFoundException
import com.pp.trab3.model.Consultation
import com.pp.trab3.repository.ConsultationRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.web.PageableDefault
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/consultation")

class ConsultationController @Autowired constructor(private val repository: ConsultationRepository) {

    @GetMapping
    fun findAll(@PageableDefault pageable: Pageable): Page<Consultation> {
        return repository.findAll(pageable)
    }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Consultation? {
        return repository.findById(id).orElseThrow { NotFoundException() }
    }

    @PostMapping
    fun save(@RequestBody consultation: Consultation){
        consultation.id=null
        repository.save(consultation)
    }
}