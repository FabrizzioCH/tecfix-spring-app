package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.CarritoItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CarritoItemsDao extends JpaRepository<CarritoItems, Long> {
    List<CarritoItems> findByCarritoId(Long carritoId);
    List<CarritoItems> findByCarritoUsuarioId(Long usuarioId);
    Optional<CarritoItems> findByCarritoUsuarioIdAndProductoId(Long usuarioId, Long productoId);
}

