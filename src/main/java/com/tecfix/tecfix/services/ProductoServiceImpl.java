package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.ProductoDao;
import com.tecfix.tecfix.models.Producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service // Indica que es un componente de servicio en Spring
public class ProductoServiceImpl implements ProductoService {

    @Autowired // Inyecta la dependencia del DAO
    private ProductoDao productoDao;

    @Override
    public List<Producto> listar() {
        return productoDao.findAll();
    }

    @Override
    public Producto guardar(Producto producto) {
        return productoDao.save(producto);
    }

    @Override
    public Producto buscarPorId(Long id) {
        return productoDao.findById(id).orElse(null);
    }

    @Override
    public void eliminar(Long id) {
        productoDao.deleteById(id);
    }
}
