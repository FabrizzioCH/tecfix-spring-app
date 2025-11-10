package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.CarritoDao;
import com.tecfix.tecfix.dao.CarritoItemsDao;
import com.tecfix.tecfix.dao.ProductoDao;
import com.tecfix.tecfix.models.Carrito;
import com.tecfix.tecfix.models.CarritoItems;
import com.tecfix.tecfix.models.Producto;
import com.tecfix.tecfix.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CarritoServiceImpl implements CarritoService {

    @Autowired
    private CarritoDao carritoDao;

    @Autowired
    private CarritoItemsDao carritoItemsDao;

    @Autowired
    private ProductoDao productoDao;

    @Override
    @Transactional
    public Carrito obtenerOCrearCarritoActual(Long usuarioId) {
        // Por simplicidad: un carrito activo por usuario (el más reciente o nuevo)
        List<Carrito> carritos = carritoDao.findByUsuarioId(usuarioId);
        if (carritos.isEmpty()) {
            Carrito carrito = Carrito.builder()
                    .usuario(Usuario.builder().id(usuarioId).build())
                    .build();
            return carritoDao.save(carrito);
        }
        return carritos.get(carritos.size() - 1); // último
    }

    @Override
    @Transactional(readOnly = true)
    public List<CarritoItems> listarItemsPorUsuario(Long usuarioId) {
        return carritoItemsDao.findByCarritoUsuarioId(usuarioId);
    }

    @Override
    @Transactional
    public void agregarProducto(Long usuarioId, Long productoId, int cantidad) {
        Carrito carrito = obtenerOCrearCarritoActual(usuarioId);
        CarritoItems existente = carritoItemsDao.findByCarritoUsuarioIdAndProductoId(usuarioId, productoId).orElse(null);
        if (existente != null) {
            existente.setCantidad(existente.getCantidad() + cantidad);
            carritoItemsDao.save(existente);
            return;
        }
        Producto producto = productoDao.findById(productoId).orElseThrow();
        CarritoItems nuevo = CarritoItems.builder()
                .carrito(carrito)
                .producto(producto)
                .cantidad(cantidad)
                .build();
        carritoItemsDao.save(nuevo);
    }

    @Override
    @Transactional
    public void actualizarCantidad(Long usuarioId, Long productoId, int cantidad) {
                CarritoItems existente = carritoItemsDao.findByCarritoUsuarioIdAndProductoId(usuarioId, productoId).orElseThrow();
        if (cantidad <= 0) {
            eliminarItem(usuarioId, productoId);
            return;
        }
        existente.setCantidad(cantidad);
        carritoItemsDao.save(existente);
    }

    @Override
    @Transactional
    public void eliminarItem(Long usuarioId, Long productoId) {
        CarritoItems existente = carritoItemsDao.findByCarritoUsuarioIdAndProductoId(usuarioId, productoId).orElse(null);
        if (existente != null) {
            carritoItemsDao.delete(existente);
        }
    }

    @Override
    @Transactional
    public void vaciarCarrito(Long usuarioId) {
        List<CarritoItems> items = carritoItemsDao.findByCarritoUsuarioId(usuarioId);
        carritoItemsDao.deleteAll(items);
    }

    @Override
    public double calcularTotalCarrito(List<CarritoItems> items) {
        BigDecimal total = new BigDecimal(0);
        for (CarritoItems item : items) {
            BigDecimal precio = item.getProducto().getPrecio();
            BigDecimal cantidad = new BigDecimal(item.getCantidad());
            total = total.add(precio.multiply(cantidad));
        }
        return total.doubleValue();
    }
}

