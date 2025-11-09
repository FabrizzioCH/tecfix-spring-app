package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.Favorito;
import com.tecfix.tecfix.models.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavoritoDao extends JpaRepository<Favorito, Long> {

    // Devuelve directamente los productos favoritos del usuario
    @Query("SELECT f.producto FROM Favorito f WHERE f.usuario.id = :idUsuario")
    List<Producto> findProductosFavoritosByUsuario(@Param("idUsuario") Long idUsuario);
}
