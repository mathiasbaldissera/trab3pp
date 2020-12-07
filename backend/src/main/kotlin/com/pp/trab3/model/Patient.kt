package com.pp.trab3.model

import com.pp.trab3.enum.Sex
import javax.persistence.*

@Entity
data class Patient(@Id @GeneratedValue var id: Long?,
                   var name: String?,
                   var age: Int?,
                   @Enumerated(EnumType.STRING) var sex: Sex?)