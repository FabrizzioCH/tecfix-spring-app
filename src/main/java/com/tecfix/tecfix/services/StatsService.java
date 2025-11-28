package com.tecfix.tecfix.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface StatsService {
    List<Map<String, Object>> ventasPorMes(LocalDate start, LocalDate end);
    List<Map<String, Object>> productosVendidosPorMes(LocalDate start, LocalDate end);
    List<Map<String, Object>> productosPorCategoria(LocalDate start, LocalDate end);
    List<Map<String, Object>> ventasPorUsuario(LocalDate start, LocalDate end);
    List<Map<String, Object>> proyeccionVentas(int mesesFuturos, LocalDate start, LocalDate end);
}
