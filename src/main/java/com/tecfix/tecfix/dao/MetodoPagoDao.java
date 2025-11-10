package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.MetodoPago;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MetodoPagoDao extends JpaRepository<MetodoPago, Long> {
    List<MetodoPago> findByUsuarioId(Long usuarioId);
    Optional<MetodoPago> findByIdAndUsuarioId(Long id, Long usuarioId);
}
