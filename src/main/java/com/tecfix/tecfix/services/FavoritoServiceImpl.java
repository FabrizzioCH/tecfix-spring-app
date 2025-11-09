package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.FavoritoDao;
import com.tecfix.tecfix.dao.ProductoDao;
import com.tecfix.tecfix.models.Favorito;
import com.tecfix.tecfix.models.Producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service
public class FavoritoServiceImpl implements FavoritoService {
    @Autowired
    private FavoritoDao favoritoDao;

    @Autowired
    ProductoDao productoDao;

    @Override
    @Transactional(readOnly = true)
    // Devuelve la lista de productos favoritos de un usuario
    public List<Producto> listar(Long idUsuario) {
        return favoritoDao.findProductosFavoritosByUsuario(idUsuario);
    }

    @Override
    @Transactional
    public void guardar(Favorito favorito) {
        favoritoDao.save(favorito);
    }

    @Override
    @Transactional(readOnly = true)
    public Favorito buscarPorId(Long id) {
        return favoritoDao.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public void eliminar(Long id) {
        favoritoDao.deleteById(id);
    }
}
