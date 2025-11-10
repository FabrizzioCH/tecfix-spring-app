package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.CarritoItemsDao;
import com.tecfix.tecfix.models.CarritoItems;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarritoItemsServiceImpl implements CarritoItemsService {

    @Autowired
    private CarritoItemsDao carritoItemsDao;

    @Override
    public List<CarritoItems> buscarCarritoItemsPorCarritoId(Long CarritoId) {
        return carritoItemsDao.findByCarritoId(CarritoId);
    }
}
