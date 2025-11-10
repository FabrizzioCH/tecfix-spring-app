package com.tecfix.tecfix.services;

import com.tecfix.tecfix.models.CarritoItems;

import java.util.List;

public interface CarritoItemsService {
    List<CarritoItems> buscarCarritoItemsPorCarritoId(Long CarritoId);
}
