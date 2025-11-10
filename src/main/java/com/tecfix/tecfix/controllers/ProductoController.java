package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.models.Producto;
import com.tecfix.tecfix.models.Usuario;
import com.tecfix.tecfix.security.CustomUserDetails;
import com.tecfix.tecfix.security.CustomUsuarioDetailService;
import com.tecfix.tecfix.services.ProductoService;
import com.tecfix.tecfix.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    @Autowired
    private UsuarioService usuarioService;
    @Autowired
    private CustomUsuarioDetailService customUsuarioDetailService;

    // Mostrar todos los productos
    @GetMapping("/")
    public String home(@AuthenticationPrincipal CustomUserDetails userDetails, Model model) {
        model.addAttribute("productos", productoService.listar());
        model.addAttribute("titulo", "Inicio");

        if(userDetails != null) {
            model.addAttribute("usuario", userDetails.getNombre());
            if (userDetails.getRol().equals("admin")) {
                return "admin/index";
            }
        }
            return "index";
    }

    @GetMapping("/products/create")
    public String crear(Model model) {
        model.addAttribute("producto", new Producto());
        model.addAttribute("titulo", "Crear Producto");
        return "admin/form";
    }

    @PostMapping("/store")
    public String guardar(Producto producto, RedirectAttributes flash) {
        var id = producto.getId();
        productoService.guardar(producto);
        var accion = (id != null) ? "modificado" : "registrado";
        flash.addFlashAttribute("message", "El producto ha sido " + accion + " exitosamente");
        return "redirect:/";
    }

    @GetMapping("products/edit/{id}")
    public String editar(@PathVariable Long id, Model model) {
        Producto producto = productoService.buscarPorId(id);
        model.addAttribute("producto", producto);
        model.addAttribute("titulo", "Editar Producto");
        return "admin/form";
    }

    @PostMapping("/destroy/{id}")
    public String destroy(@PathVariable Long id, RedirectAttributes flash) {
        productoService.eliminar(id);
        flash.addFlashAttribute("message", "Producto eliminado");
        return "redirect:/";
    }

    @GetMapping("products/show/{id}")
    public String show(@PathVariable Long id, Model model) {
        Producto producto = productoService.buscarPorId(id);
        model.addAttribute("producto", producto);
        model.addAttribute("titulo", "Producto");
        return "detalle-producto";
    }

    @GetMapping("products/carrito")
    public String showCarrito() {
        return "carrito";
    }

    @GetMapping("products/lista")
    public String showProdcts() {
        return "lista-productos";
    }

}
