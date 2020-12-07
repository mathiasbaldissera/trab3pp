package com.pp.trab3.controller

import com.pp.trab3.exceptions.NotFoundException
import com.pp.trab3.model.Disease
import com.pp.trab3.repository.DiseaseRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.web.PageableDefault
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/disease")
class DiseaseController  @Autowired constructor(private val repository: DiseaseRepository){
    @GetMapping
    fun findAll(@PageableDefault pageable: Pageable): Page<Disease> {
        return repository.findAll(pageable)
    }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Disease? {
        return repository.findById(id).orElseThrow { NotFoundException() }
    }

    @PostMapping
    fun save(@RequestBody disease: Disease){
        disease.id=null
        repository.save(disease)
    }

    @PutMapping("/{id}")
    fun update(@RequestBody disease: Disease, @PathVariable id: Long){
        disease.id=id
        repository.save(disease)
    }
    @GetMapping("/possibleDiseases")
    fun findPossibleDiseases(@RequestParam symptoms: List<String>): List<Disease> {
        return repository.findBySymptoms(symptoms, symptoms.size.toLong())
    }
}