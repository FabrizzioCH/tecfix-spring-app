package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.UsuarioDao;
import com.tecfix.tecfix.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsusarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioDao usuarioDao;

    @Override
    public void guardar(Usuario usuario) {
        usuarioDao.save(usuario);
    }

    @Override
    public Usuario buscarUsuarioPorEmail(String email) {
        return usuarioDao.findByEmail(email).orElse(null);
    }


}
