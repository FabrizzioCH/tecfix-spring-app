package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.MetodoPagoDao;
import com.tecfix.tecfix.models.MetodoPago;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MetodoPagoServiceImpl implements MetodoPagoService {

    @Autowired
    private MetodoPagoDao metodoPagoDao;

    @Override
    public List<MetodoPago> listarMetodoPagoPorUsuario(Long usuarioId) {
        return metodoPagoDao.findByUsuarioId(usuarioId);
    }

    @Override
    public Optional<MetodoPago> obtenerPorIdYUsuario(Long id, Long usuarioId) {
        return metodoPagoDao.findByIdAndUsuarioId(id, usuarioId);
    }

    @Override
    public MetodoPago save(MetodoPago metodoPago) {
        return metodoPagoDao.save(metodoPago);
    }
}
