package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.Carrito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarritoDao extends JpaRepository<Carrito, Long> {
    List<Carrito> findByUsuarioId(Long usuarioId);
}
