package com.pp.trab3.repository;

import com.pp.trab3.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

interface PatientRepository : JpaRepository<Patient, Long>
