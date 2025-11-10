package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.CompraDetalle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompraDetalleDao extends JpaRepository<CompraDetalle, Long> {
}
