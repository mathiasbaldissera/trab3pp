package com.pp.trab3.model

import org.hibernate.annotations.CreationTimestamp
import java.time.LocalDateTime
import javax.persistence.*

@Entity
data class Consultation(@Id @GeneratedValue var id: Long?,
                        @ManyToOne var patient: Patient,
                        @ElementCollection val symptoms: List<String>,
                        @ManyToMany val acceptedDiseases: List<Disease>


) {
    @CreationTimestamp
    lateinit var createDate: LocalDateTime
}