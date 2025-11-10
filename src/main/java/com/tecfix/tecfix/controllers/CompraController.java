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
                                 @RequestParam("direccionSeleccion") String direccionSeleccion,
                                 @RequestParam("metodoPagoSeleccion") String metodoPagoSeleccion,
                                 Model model) {
        // Convertir a Long y validar que sean IDs numéricos (evita 400 cuando viene "nuevo"/"nueva")
        Long direccionId;
        Long metodoPagoId;
        try {
            direccionId = Long.valueOf(direccionSeleccion);
            metodoPagoId = Long.valueOf(metodoPagoSeleccion);
        } catch (NumberFormatException ex) {
            return "redirect:/compra/fase1?error=seleccion-invalida";
        }

        // Validar que la dirección y el mét odo de pago pertenezcan al usuario autenticado
        Optional<Direccion> direccionOpt = direccionService.obtenerPorIdYUsuario(direccionId, userDetails.getId());
        Optional<MetodoPago> metodoPagoOpt = metodoPagoService.obtenerPorIdYUsuario(metodoPagoId, userDetails.getId());

        if (direccionOpt.isEmpty() || metodoPagoOpt.isEmpty()) {
            // Selección inválida o no pertenecen al usuario
            return "redirect:/compra/fase1?error=seleccion-invalida";
        }

        Direccion direccion = direccionOpt.get();
        MetodoPago metodoPago = metodoPagoOpt.get();

//        RegistrarCompra
        Compra compra = new Compra();
        compra.setUsuario(usuarioService.buscarUsuarioId(userDetails.getId()));
        compra.setDireccion(direccion);
        compra.setMetodoPago(metodoPago);
        compra.setTotal(carritoService.calcularTotalCarrito(carritoService.listarItemsPorUsuario(userDetails.getId())));
        compra.setEstado("Recibida");
        compraService.guardarCompraDesdeCarrito(compra);

//        RegistrarDetalles de la compra
        List<CarritoItems> itemsList = carritoService.listarItemsPorUsuario(userDetails.getId());
        for (CarritoItems carritoItems : itemsList) {
            CompraDetalle detalle = new CompraDetalle();
            detalle.setCompra(compra);
            detalle.setProducto(carritoItems.getProducto());
            detalle.setCantidad(carritoItems.getCantidad());

            productoService.restarStock(carritoItems.getProducto().getId(), carritoItems.getCantidad());

            detalle.setPrecioUnitario(carritoItems.getProducto().getPrecio().doubleValue());
            detalle.setSubtotal(carritoItems.getCantidad()+carritoItems.getProducto().getPrecio().doubleValue());
            compraDetalleService.save(detalle);
        }

        carritoService.vaciarCarrito(userDetails.getId());

        return "redirect:/";
    }
}
