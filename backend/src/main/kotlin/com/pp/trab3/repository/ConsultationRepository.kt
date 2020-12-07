package com.pp.trab3.repository;

import com.pp.trab3.model.Consultation
import org.springframework.data.jpa.repository.JpaRepository;

interface ConsultationRepository : JpaRepository<Consultation, Long>
