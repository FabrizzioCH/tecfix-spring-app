package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.models.*;
import com.tecfix.tecfix.security.CustomUserDetails;
import com.tecfix.tecfix.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class CompraController {

    @Autowired
    private DireccionService direccionService;

    @Autowired
    private MetodoPagoService metodoPagoService;

    @Autowired
    private CarritoService carritoService;

    @Autowired
    private CompraService compraService;

    @Autowired
    private CompraDetalleService compraDetalleService;

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    private ProductoService productoService;

    @GetMapping("/compra/fase1")
    public String compraFase1(@AuthenticationPrincipal CustomUserDetails userDetails, Model model) {
        model.addAttribute("usuario", userDetails.getNombre());
        model.addAttribute("direcciones", direccionService.listarDireccionesPorUsuario(userDetails.getId()));
        model.addAttribute("metodosPago", metodoPagoService.listarMetodoPagoPorUsuario(userDetails.getId()));
        model.addAttribute("total", carritoService.calcularTotalCarrito(
                carritoService.listarItemsPorUsuario(userDetails.getId()
                )));
        return "fase1-compra";
    }

    @PostMapping("/compra/procesar")
    public String procesarCompra(@AuthenticationPrincipal CustomUserDetails userDetails,
                                 @RequestParam(name = "direccionSeleccion", required = false) String direccionSeleccion,
                                 @RequestParam(name = "metodoPagoSeleccion", required = false) String metodoPagoSeleccion,
                                 @RequestParam(name = "calle", required = false) String calle,
                                 @RequestParam(name = "ciudad", required = false) String ciudad,
                                 @RequestParam(name = "provincia", required = false) String provincia,
                                 @RequestParam(name = "cp", required = false) String cp,
                                 @RequestParam(name = "numero", required = false) String numero,
                                 @RequestParam(name = "alias", required = false) String alias,
                                 @RequestParam(name = "referencia", required = false) String referencia,
                                 @RequestParam(name = "tipoTarjeta", required = false) String tipoTarjeta,
                                 @RequestParam(name = "numTarjeta", required = false) String numTarjeta,
                                 @RequestParam(name = "nombreTarjeta", required = false) String nombreTarjeta,
                                 @RequestParam(name = "expiracion", required = false) String expiracion,
                                 @RequestParam(name = "cvv", required = false) String cvv,
                                 Model model) {

        // Determinar dirección final
        Direccion direccion = null;
        try {
            if (direccionSeleccion != null && direccionSeleccion.equals("nueva")) {
                Direccion d = new Direccion();
                d.setCalle(calle);
                d.setCiudad(ciudad);
                d.setEstado(provincia);
                d.setCodigoPostal(cp);
                d.setNumero(numero);
                d.setAlias(alias);
                d.setReferencia(referencia);
                d.setUsuario(usuarioService.buscarUsuarioId(userDetails.getId()));
                direccion = direccionService.save(d);
            } else if (direccionSeleccion != null) {
                // intenta parsear id
                try {
                    Long idDir = Long.parseLong(direccionSeleccion);
                    direccion = direccionService.obtenerPorIdYUsuario(idDir, userDetails.getId()).orElse(null);
                } catch (NumberFormatException nf) {
                    direccion = null;
                }
            }

            // Determinar método de pago final
            MetodoPago metodoPago = null;
            if (metodoPagoSeleccion != null && metodoPagoSeleccion.equals("nuevo")) {
                MetodoPago m = new MetodoPago();
                m.setTipo(tipoTarjeta != null ? (tipoTarjeta.equals("CREDITO") ? "Tarjeta de crédito" : "Tarjeta de débito") : "Tarjeta");
                m.setProveedor(null);
                // Guardamos sólo los últimos 4 dígitos en numeroCuenta por seguridad
                if (numTarjeta != null) {
                    String onlyDigits = numTarjeta.replaceAll("\\s+", "");
                    if (onlyDigits.length() > 4) {
                        m.setNumeroCuenta(onlyDigits.substring(onlyDigits.length() - 4));
                    } else {
                        m.setNumeroCuenta(onlyDigits);
                    }
                }
                m.setFechaExpiracion(expiracion);
                m.setCodigoSeguridad(cvv);
                m.setUsuario(usuarioService.buscarUsuarioId(userDetails.getId()));
                metodoPago = metodoPagoService.save(m);
            } else if (metodoPagoSeleccion != null) {
                try {
                    Long idMp = Long.parseLong(metodoPagoSeleccion);
                    metodoPago = metodoPagoService.obtenerPorIdYUsuario(idMp, userDetails.getId()).orElse(null);
                } catch (NumberFormatException nf) {
                    metodoPago = null;
                }
            }

            // Guardar compra
            Compra compra = new Compra();
            compra.setUsuario(usuarioService.buscarUsuarioId(userDetails.getId()));
            compra.setDireccion(direccion);
            compra.setMetodoPago(metodoPago);
            compra.setTotal(carritoService.calcularTotalCarrito(carritoService.listarItemsPorUsuario(userDetails.getId())));
            compra.setEstado("Recibida");
            compraService.guardarCompraDesdeCarrito(compra);

            // Registrar detalles de la compra
            List<CarritoItems> itemsList = carritoService.listarItemsPorUsuario(userDetails.getId());
            for (CarritoItems carritoItems : itemsList) {
                CompraDetalle detalle = new CompraDetalle();
                detalle.setCompra(compra);
                detalle.setProducto(carritoItems.getProducto());
                detalle.setCantidad(carritoItems.getCantidad());

                productoService.restarStock(carritoItems.getProducto().getId(), carritoItems.getCantidad());

                // Fix: subtotal should be cantidad * precio
                double precio = carritoItems.getProducto().getPrecio().doubleValue();
                detalle.setSubtotal(carritoItems.getCantidad() * precio);
                compraDetalleService.save(detalle);
            }

            carritoService.vaciarCarrito(userDetails.getId());

            return "redirect:/";

        } catch (Exception e) {
            // Manejo simple de errores: volver a la página con mensaje
            model.addAttribute("error", "No se pudo procesar la compra: " + e.getMessage());
            return "fase1-compra";
        }
    }
}
