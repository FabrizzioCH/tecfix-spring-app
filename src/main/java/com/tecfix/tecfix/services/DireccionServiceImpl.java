package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.DireccionDao;
import com.tecfix.tecfix.models.Direccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DireccionServiceImpl  implements DireccionService {

    @Autowired
    private DireccionDao direccionDao;

    @Override
    public List<Direccion> listarDireccionesPorUsuario(Long usuarioId) {
        return direccionDao.findByUsuarioId(usuarioId);
    }

    @Override
    public Optional<Direccion> obtenerPorIdYUsuario(Long id, Long usuarioId) {
        return direccionDao.findByIdAndUsuarioId(id, usuarioId);
    }
}
