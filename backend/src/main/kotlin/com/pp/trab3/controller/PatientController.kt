package com.pp.trab3.controller

import com.pp.trab3.exceptions.NotFoundException
import com.pp.trab3.model.Patient
import com.pp.trab3.repository.PatientRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.web.PageableDefault
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/patient")

class PatientController @Autowired constructor(private val repository: PatientRepository) {

    @GetMapping
    fun findAll(@PageableDefault pageable: Pageable): Page<Patient> {
        return repository.findAll(pageable)
    }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Patient? {
        return repository.findById(id).orElseThrow { NotFoundException() }
    }

    @PostMapping
    fun save(@RequestBody patient: Patient){
        patient.id=null
        repository.save(patient)
    }

    @PutMapping("/{id}")
    fun update(@RequestBody patient: Patient, @PathVariable id: Long){
        patient.id=id
        repository.save(patient)
    }
}