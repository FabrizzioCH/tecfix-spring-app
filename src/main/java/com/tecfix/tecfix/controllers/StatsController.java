package com.tecfix.tecfix.controllers;

import com.tecfix.tecfix.services.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/api/stats", produces = MediaType.APPLICATION_JSON_VALUE)
@PreAuthorize("hasRole('ADMIN')")
public class StatsController {

    @Autowired
    private StatsService statsService;

    @GetMapping("/ventas-por-mes")
    public List<Map<String, Object>> ventasPorMes(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate start,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate end
    ) {
        return statsService.ventasPorMes(start, end);
    }

    @GetMapping("/productos-vendidos-por-mes")
    public List<Map<String, Object>> productosVendidosPorMes(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate start,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate end
    ) {
        return statsService.productosVendidosPorMes(start, end);
    }

    @GetMapping("/productos-por-categoria")
    public List<Map<String, Object>> productosPorCategoria(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate start,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate end
    ) {
        return statsService.productosPorCategoria(start, end);
    }

    @GetMapping("/ventas-por-usuario")
    public List<Map<String, Object>> ventasPorUsuario(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate start,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate end
    ) {
        return statsService.ventasPorUsuario(start, end);
    }

    @GetMapping("/proyeccion-ventas")
    public List<Map<String, Object>> proyeccionVentas(
            @RequestParam(defaultValue = "6") int meses,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate start,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate end
    ) {
        return statsService.proyeccionVentas(meses, start, end);
    }
}
