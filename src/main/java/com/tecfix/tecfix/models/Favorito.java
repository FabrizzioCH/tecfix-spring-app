package com.tecfix.tecfix.models;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/// ## Notaciones de JPA
@Entity // Indica que es una entidad de JPA una tabla en la base de datos
@Table(name = "favoritos")
// Indica el nombre de la tabla en la base de datos, por defecto seria el mismo nombre de la clase

/// ## Notaciones de Lombok
@Data // Genera los getters y setters
@NoArgsConstructor // Genera el constructor sin argumentos
@AllArgsConstructor // Genera el constructor con todos los argumentos
@Builder // Genera el patron builder
public class Favorito {
    @Id // Indica que es la llave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // Indica que es la llave primaria y que se genera automaticamente
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "id_producto", nullable = false)
    private Producto producto;
}
