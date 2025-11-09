package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.models.Favorito;
import com.tecfix.tecfix.security.CustomUserDetails;
import com.tecfix.tecfix.security.CustomUsuarioDetailService;
import com.tecfix.tecfix.services.FavoritoService;
import com.tecfix.tecfix.services.ProductoService;
import com.tecfix.tecfix.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/products")
public class FavoritoController {

    @Autowired
    private FavoritoService favoritoService;

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    ProductoService productoService;

    @Autowired
    private CustomUsuarioDetailService customUsuarioDetailService;

    @PostMapping("/add-favorito/{id}")
    public String addFavorito(@PathVariable Long id, @AuthenticationPrincipal CustomUserDetails userDetails) {
        Favorito nuevo = new Favorito();
        nuevo.setUsuario(usuarioService.buscarUsuarioPorEmail(userDetails.getUsername()));
        nuevo.setProducto(productoService.buscarPorId(id));
        favoritoService.guardar(nuevo);
        return "redirect:/";
    }

    @GetMapping("/favoritos")
    public String listarFavoritos(@AuthenticationPrincipal CustomUserDetails userDetails, Model model) {
        Long userId = userDetails.getId();
        model.addAttribute("usuario", userDetails.getNombre());
        model.addAttribute("favoritos", favoritoService.listar(userId));
        return "favoritos";
    }
}
