package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.CompraDetalleDao;
import com.tecfix.tecfix.models.CompraDetalle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompraDetalleServiceImpl implements CompraDetalleService {
    @Autowired
    private CompraDetalleDao compraDetalleDao;

    @Override
    public void save(CompraDetalle compraDetalle) {
        compraDetalleDao.save(compraDetalle);
    }


}
