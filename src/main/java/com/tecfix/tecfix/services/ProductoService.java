package com.tecfix.tecfix.services;

import com.tecfix.tecfix.models.Producto;
import java.util.List;

public interface ProductoService {

    List<Producto> listar();
    Producto guardar(Producto producto);
    Producto buscarPorId(Long id);
    void eliminar(Long id);
}
