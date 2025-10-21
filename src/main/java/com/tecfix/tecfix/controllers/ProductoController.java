package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.models.Producto;
import com.tecfix.tecfix.services.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    // Mostrar todos los productos
    @GetMapping("/")
    public String listar(Model model) {
        model.addAttribute("productos", productoService.listar());
        model.addAttribute("titulo", "Inicio");
        return "index";
    }

    @GetMapping("/products/create")
    public String crear(Model model) {
        model.addAttribute("producto", new Producto());
        model.addAttribute("titulo", "Crear Producto");
        return "form";
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
        return "form";
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
}
