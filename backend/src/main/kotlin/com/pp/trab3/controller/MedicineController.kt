package com.pp.trab3.controller

import com.pp.trab3.exceptions.NotFoundException
import com.pp.trab3.model.Disease
import com.pp.trab3.model.Medicine
import com.pp.trab3.repository.MedicineRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.web.PageableDefault
import org.springframework.web.bind.annotation.*


@RestController
@RequestMapping("/medicine")
class MedicineController  @Autowired constructor(private val repository: MedicineRepository) {

    @GetMapping
    fun findAll(@PageableDefault pageable: Pageable): Page<Medicine> {
        return repository.findAll(pageable)
    }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): Medicine? {
        return repository.findById(id).orElseThrow { NotFoundException() }
    }

    @PostMapping
    fun save(@RequestBody medicine: Medicine){
        medicine.id=null
        repository.save(medicine)
    }

    @PutMapping("/{id}")
    fun update(@RequestBody medicine: Medicine, @PathVariable id: Long){
        medicine.id=id
        repository.save(medicine)
    }
}