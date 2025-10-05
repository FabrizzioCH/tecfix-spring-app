package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Indica que es un componente de Spring que interactua con la base de datos
public interface ProductoDao extends JpaRepository<Producto, Long> {
    // JpaRepository ya incluye métodos como:
    // findAll(), findById(), save(), deleteById(), etc.

    // Puedes agregar consultas personalizadas si lo necesitas, por ejemplo:
    // List<Producto> findByDisponibleTrue();
}
