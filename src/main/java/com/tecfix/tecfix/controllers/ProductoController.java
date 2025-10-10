package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.models.Producto;
import com.tecfix.tecfix.services.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    // Mostrar todos los productos
    @GetMapping
    public String listar(Model model) {
        model.addAttribute("productos", productoService.listar());
        return "index";
    }

    @GetMapping("create")
    public String crear(Model model){
        model.addAttribute("producto", new Producto());
        return "form";
    }

    @PostMapping("store")
    public String guardar(Producto producto){
        productoService.guardar(producto);
        return "redirect:/";
    }

    @GetMapping("edit")
    public String editar(){
        return "edit";
    }
}
