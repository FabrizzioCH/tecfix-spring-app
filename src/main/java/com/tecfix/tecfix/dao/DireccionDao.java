package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.Direccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DireccionDao extends JpaRepository<Direccion, Long> {
    List<Direccion> findByUsuarioId(Long usuarioId);
    Optional<Direccion> findByIdAndUsuarioId(Long id, Long usuarioId);
}
