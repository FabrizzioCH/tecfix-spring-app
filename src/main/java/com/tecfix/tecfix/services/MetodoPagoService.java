package com.tecfix.tecfix.services;

import com.tecfix.tecfix.models.MetodoPago;

import java.util.List;
import java.util.Optional;

public interface MetodoPagoService {
    List<MetodoPago> listarMetodoPagoPorUsuario(Long usuarioId);
    Optional<MetodoPago> obtenerPorIdYUsuario(Long id, Long usuarioId);
}
