package com.tecfix.tecfix.security;

import com.tecfix.tecfix.dao.UsuarioDao;
import com.tecfix.tecfix.models.Usuario;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUsuarioDetailService implements UserDetailsService {
    private final UsuarioDao usuarioDao;

    public CustomUsuarioDetailService(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario user = usuarioDao.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado: " + email));
        return new CustomUserDetails(user);
    }
}
