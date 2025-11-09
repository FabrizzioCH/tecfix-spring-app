package com.tecfix.tecfix.services;


import com.tecfix.tecfix.models.Favorito;
import com.tecfix.tecfix.models.Producto;

import java.util.List;

public interface FavoritoService {
    List<Producto> listar(Long idUsuario);
    void guardar(Favorito favorito);
    Favorito buscarPorId(Long id);
    void eliminar(Long id);
}
