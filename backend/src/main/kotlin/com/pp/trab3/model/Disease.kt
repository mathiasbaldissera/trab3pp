package com.pp.trab3.model

import javax.persistence.ElementCollection
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToMany

@Entity
data class Disease(@Id @GeneratedValue var id: Long?,
                   var name: String?,
                   @ElementCollection var symptoms: List<String>?,
                   @ManyToMany var medicines: List<Medicine>?)