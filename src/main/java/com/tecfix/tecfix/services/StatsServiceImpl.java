package com.tecfix.tecfix.services;

import com.tecfix.tecfix.dao.CompraDao;
import com.tecfix.tecfix.dao.CompraDetalleDao;
import com.tecfix.tecfix.dto.CategoryCountProjection;
import com.tecfix.tecfix.dto.MonthAmountProjection;
import com.tecfix.tecfix.dto.MonthCountProjection;
import com.tecfix.tecfix.dto.UserSalesProjection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class StatsServiceImpl implements StatsService {

    @Autowired
    private CompraDao compraDao;

    @Autowired
    private CompraDetalleDao compraDetalleDao;

    private LocalDateTime toStart(LocalDate d){ return d == null ? null : d.atStartOfDay(); }
    private LocalDateTime toEnd(LocalDate d){ return d == null ? null : d.atTime(23,59,59,999_000_000); }

    @Override
    public List<Map<String, Object>> ventasPorMes(LocalDate start, LocalDate end) {
        List<MonthAmountProjection> rows = compraDao.sumSalesByMonth(toStart(start), toEnd(end));
        return rows.stream().map(r -> {
            Map<String, Object> m = new HashMap<>();
            m.put("year", r.getYear());
            m.put("month", r.getMonth());
            m.put("amount", Optional.ofNullable(r.getAmount()).orElse(0.0));
            return m;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> productosVendidosPorMes(LocalDate start, LocalDate end) {
        List<MonthCountProjection> rows = compraDetalleDao.productsSoldByMonth(toStart(start), toEnd(end));
        return rows.stream().map(r -> {
            Map<String, Object> m = new HashMap<>();
            m.put("year", r.getYear());
            m.put("month", r.getMonth());
            m.put("count", Optional.ofNullable(r.getCount()).orElse(0L));
            return m;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> productosPorCategoria(LocalDate start, LocalDate end) {
        List<CategoryCountProjection> rows = compraDetalleDao.productsByCategory(toStart(start), toEnd(end));
        return rows.stream().map(r -> {
            Map<String, Object> m = new HashMap<>();
            String cat = r.getCategory();
            m.put("category", cat == null || cat.isBlank() ? "Sin categoría" : cat);
            m.put("count", Optional.ofNullable(r.getCount()).orElse(0L));
            return m;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> ventasPorUsuario(LocalDate start, LocalDate end) {
        List<UserSalesProjection> rows = compraDao.salesByUser(toStart(start), toEnd(end));
        return rows.stream().map(r -> {
            Map<String, Object> m = new HashMap<>();
            m.put("userId", r.getUserId());
            m.put("userName", r.getUserName());
            m.put("amount", Optional.ofNullable(r.getAmount()).orElse(0.0));
            return m;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> proyeccionVentas(int mesesFuturos, LocalDate start, LocalDate end) {
        List<MonthAmountProjection> rows = compraDao.sumSalesByMonth(toStart(start), toEnd(end));
        if (rows.isEmpty()) return Collections.emptyList();

        List<YearMonth> months = new ArrayList<>();
        List<Double> amounts = new ArrayList<>();
        for (MonthAmountProjection r : rows) {
            YearMonth ym = YearMonth.of(r.getYear(), r.getMonth());
            months.add(ym);
            amounts.add(Optional.ofNullable(r.getAmount()).orElse(0.0));
        }
        int n = amounts.size();
        double sumX = 0, sumY = 0, sumXY = 0, sumXX = 0;
        for (int i = 0; i < n; i++) {
            double x = i + 1;
            double y = amounts.get(i);
            sumX += x;
            sumY += y;
            sumXY += x * y;
            sumXX += x * x;
        }
        double denom = n * sumXX - sumX * sumX;
        double a;
        double b;
        if (denom != 0) {
            b = (n * sumXY - sumX * sumY) / denom;
            a = (sumY - b * sumX) / n;
        } else {
            a = (n == 0) ? 0 : (sumY / n);
            b = 0;
        }

        YearMonth last = months.get(months.size() - 1);
        List<Map<String, Object>> out = new ArrayList<>();
        for (int i = 1; i <= mesesFuturos; i++) {
            double x = n + i;
            double yhat = a + b * x;
            if (yhat < 0) yhat = 0;
            YearMonth ym = last.plusMonths(i);
            Map<String, Object> m = new HashMap<>();
            m.put("year", ym.getYear());
            m.put("month", ym.getMonthValue());
            m.put("amount", yhat);
            out.add(m);
        }
        return out;
    }
}
