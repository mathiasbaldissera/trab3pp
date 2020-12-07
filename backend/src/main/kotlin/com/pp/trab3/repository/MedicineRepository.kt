package com.pp.trab3.repository;

import com.pp.trab3.model.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param


interface MedicineRepository : JpaRepository<Medicine, Long>