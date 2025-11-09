package com.tecfix.tecfix.services;

import com.tecfix.tecfix.models.Usuario;

import java.util.Optional;

public interface UsuarioService {
    void guardar(Usuario usuario);
    Usuario buscarUsuarioPorEmail(String email);
}
