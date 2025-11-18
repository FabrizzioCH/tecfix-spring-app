package com.tecfix.tecfix.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/// ## Notaciones de JPA
@Entity // Indica que es una entidad de JPA una tabla en la base de datos
@Table(name = "productos")
// Indica el nombre de la tabla en la base de datos, por defecto seria el mismo nombre de la clase

/// ## Notaciones de Lombok
@Data // Genera los getters y setters
@NoArgsConstructor // Genera el constructor sin argumentos
@AllArgsConstructor // Genera el constructor con todos los argumentos
@Builder // Genera el patron builder

public class Producto {

    @Id // Indica que es la llave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // Indica que es la llave primaria y que se genera automaticamente
    private Long id;

    @NotBlank // Validador de Jakarta, no permite nulos ni cadenas vacías
    @Size(max = 100) // Validador de Jakarta, limita el tamaño maximo de la cadena
    @Column(nullable = false, length = 100) // Validador de JPA, no permite nulos y limita el tamaño maximo de la cadena
    private String nombre;

    @Size(max = 1000)
    @Column(length = 1000)
    private String descripcion;

    @NotNull
    @PositiveOrZero
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal precio;

    @Column(nullable = false)
    private boolean disponible = true;

    @Column(name = "creado_en", updatable = false)
    private LocalDateTime creadoEn;

    @Column
    private String imagenUrl;

    private int stock;

    @PrePersist // Ejecuta el metodo antes de insertar el registro en la base de datos
    protected void OnCreate() {
        this.creadoEn = LocalDateTime.now();
    }

    @OneToMany(mappedBy = "producto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Favorito> favoritos = new ArrayList<>();

    @OneToMany(mappedBy = "producto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CarritoItems> carritoItems = new ArrayList<>();

    @OneToMany(mappedBy = "producto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CompraDetalle> compraDetalles = new ArrayList<>();
}