package com.tecfix.tecfix.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/// ## Notaciones de JPA
@Entity // Indica que es una entidad de JPA una tabla en la base de datos
@Table(name = "carrito_items")
// Indica el nombre de la tabla en la base de datos, por defecto seria el mismo nombre de la clase

/// ## Notaciones de Lombok
@Data // Genera los getters y setters
@NoArgsConstructor // Genera el constructor sin argumentos
@AllArgsConstructor // Genera el constructor con todos los argumentos
@Builder // Genera el patron builder

public class CarritoItems {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_carrito", nullable = false)
    private Carrito carrito;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_producto", nullable = false)
    private Producto producto;

    @NotNull
    @Positive
    @Column(nullable = false)
    private Integer cantidad;
}
