package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.security.CustomUserDetails;
import com.tecfix.tecfix.services.CarritoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CarritoController {

    @Autowired
    private CarritoService carritoService;

    @GetMapping("/carrito")
    public String mostrarCarrito(@AuthenticationPrincipal CustomUserDetails userDetails, Model model) {
        if (userDetails != null) {
            model.addAttribute("items", carritoService.listarItemsPorUsuario(userDetails.getId()));
            model.addAttribute("total", carritoService.calcularTotalCarrito(
                    carritoService.listarItemsPorUsuario(userDetails.getId()
                    )));
        }
        return "carrito";
    }

    @PostMapping("/carrito/add/{productoId}")
    public String agregar(@PathVariable Long productoId, @RequestParam(defaultValue = "1") int cantidad,
                          @AuthenticationPrincipal CustomUserDetails userDetails) {
        carritoService.agregarProducto(userDetails.getId(), productoId, cantidad);
        return "redirect:/carrito";
    }

    @PostMapping("/carrito/update/{productoId}")
    public String actualizar(@PathVariable Long productoId, @RequestParam int cantidad,
                             @AuthenticationPrincipal CustomUserDetails userDetails) {
        carritoService.actualizarCantidad(userDetails.getId(), productoId, cantidad);
        return "redirect:/carrito";
    }

    @PostMapping("/carrito/delete/{productoId}")
    public String eliminar(@PathVariable Long productoId, @AuthenticationPrincipal CustomUserDetails userDetails) {
        carritoService.eliminarItem(userDetails.getId(), productoId);
        return "redirect:/carrito";
    }

    @PostMapping("/carrito/clear")
    public String vaciar(@AuthenticationPrincipal CustomUserDetails userDetails) {
        carritoService.vaciarCarrito(userDetails.getId());
        return "redirect:/carrito";
    }
}
