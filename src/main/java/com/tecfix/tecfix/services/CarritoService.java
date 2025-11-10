package com.tecfix.tecfix.services;

import com.tecfix.tecfix.models.Carrito;
import com.tecfix.tecfix.models.CarritoItems;

import java.util.List;

public interface CarritoService {
    Carrito obtenerOCrearCarritoActual(Long usuarioId);

    List<CarritoItems> listarItemsPorUsuario(Long usuarioId);

    void agregarProducto(Long usuarioId, Long productoId, int cantidad);

    void actualizarCantidad(Long usuarioId, Long productoId, int cantidad);

    void eliminarItem(Long usuarioId, Long productoId);

    void vaciarCarrito(Long usuarioId);

    double calcularTotalCarrito(List<CarritoItems> items);
}

