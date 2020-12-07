package com.pp.trab3.model

import javax.persistence.ElementCollection
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
data class Medicine(@Id @GeneratedValue var id: Long?,
                    var name: String?,
                    @ElementCollection var functions: List<String>?)