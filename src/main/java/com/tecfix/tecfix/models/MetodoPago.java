package com.tecfix.tecfix.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/// ## Notaciones de JPA
@Entity // Indica que es una entidad de JPA una tabla en la base de datos
@Table(name = "metodos_pago")
// Indica el nombre de la tabla en la base de datos, por defecto seria el mismo nombre de la clase

/// ## Notaciones de Lombok
@Data // Genera los getters y setters
@NoArgsConstructor // Genera el constructor sin argumentos
@AllArgsConstructor // Genera el constructor con todos los argumentos
@Builder // Genera el patron builder
public class MetodoPago {

    @Id // Indica que es la llave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // Indica que es la llave primaria y que se genera automaticamente
    private Long id;

    private String tipo; // Ejemplo: "Tarjeta de Crédito", "PayPal", etc.
    private String proveedor; // Ejemplo: "Visa", "MasterCard", "PayPal", etc.
    private String numeroCuenta; // Puede ser el número de tarjeta o cuenta asociado al mét odo de pago
    private String fechaExpiracion; // Formato MM/AA
    private String codigoSeguridad; // CVV o código de seguridad

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @OneToMany(mappedBy = "metodoPago", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Compra> compras = new ArrayList<>();
}
