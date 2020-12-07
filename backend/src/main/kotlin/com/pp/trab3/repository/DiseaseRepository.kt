package com.pp.trab3.repository;

import com.pp.trab3.model.Disease;
import com.pp.trab3.model.Medicine
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface DiseaseRepository : JpaRepository<Disease, Long> {
    @Query("SELECT d FROM Disease d left join d.symptoms s  where s in :symptoms group by d.id having count(s) >= :count")
    fun findBySymptoms(@Param("symptoms") symptoms: List<String>,
                                @Param("count") count: Long)
            : List<Disease>}
