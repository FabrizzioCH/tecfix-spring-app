package com.tecfix.tecfix.services;

import com.tecfix.tecfix.models.Direccion;

import java.util.List;
import java.util.Optional;

public interface DireccionService {

    List<Direccion> listarDireccionesPorUsuario(Long usuarioId);
    Optional<Direccion> obtenerPorIdYUsuario(Long id, Long usuarioId);
}
