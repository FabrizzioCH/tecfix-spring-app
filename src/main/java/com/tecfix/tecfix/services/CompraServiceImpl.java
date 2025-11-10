package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.CompraDao;
import com.tecfix.tecfix.models.Compra;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompraServiceImpl implements CompraService {

    @Autowired
    private CompraDao compraDao;

    @Override
    public void guardarCompraDesdeCarrito(Compra compra) {
        compraDao.save(compra);

    }
}
