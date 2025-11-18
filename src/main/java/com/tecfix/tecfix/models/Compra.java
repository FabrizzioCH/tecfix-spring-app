package com.tecfix.tecfix.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/// ## Notaciones de JPA
@Entity // Indica que es una entidad de JPA una tabla en la base de datos
@Table(name = "compras")
// Indica el nombre de la tabla en la base de datos, por defecto seria el mismo nombre de la clase

/// ## Notaciones de Lombok
@Data // Genera los getters y setters
@NoArgsConstructor // Genera el constructor sin argumentos
@AllArgsConstructor // Genera el constructor con todos los argumentos
@Builder // Genera el patron builder

public class Compra {
    @Id // Indica que es la llave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // Indica que es la llave primaria y que se genera automaticamente
    private Long id;

    private LocalDateTime fecha;
    private String estado;
    private Double total;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_metodo_pago", nullable = false)
    private MetodoPago metodoPago;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_direccion", nullable = false)
    private Direccion direccion;

    @OneToMany(mappedBy = "compra", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CompraDetalle> compraDetalles = new ArrayList<>();

    @PrePersist
    protected void OnCreate() {
        this.fecha = LocalDateTime.now();
    }
}
