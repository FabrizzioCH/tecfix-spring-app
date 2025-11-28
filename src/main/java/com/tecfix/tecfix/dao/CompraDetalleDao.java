package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.CompraDetalle;
import com.tecfix.tecfix.dto.MonthCountProjection;
import com.tecfix.tecfix.dto.CategoryCountProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface CompraDetalleDao extends JpaRepository<CompraDetalle, Long> {
    @Query("SELECT YEAR(cd.compra.fecha) as year, MONTH(cd.compra.fecha) as month, SUM(cd.cantidad) as count " +
            "FROM CompraDetalle cd WHERE (:start IS NULL OR cd.compra.fecha >= :start) AND (:end IS NULL OR cd.compra.fecha <= :end) " +
            "GROUP BY YEAR(cd.compra.fecha), MONTH(cd.compra.fecha) ORDER BY YEAR(cd.compra.fecha), MONTH(cd.compra.fecha)")
    List<MonthCountProjection> productsSoldByMonth(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);

    @Query("SELECT p.categoria as category, SUM(cd.cantidad) as count FROM CompraDetalle cd JOIN cd.producto p " +
            "WHERE (:start IS NULL OR cd.compra.fecha >= :start) AND (:end IS NULL OR cd.compra.fecha <= :end) " +
            "GROUP BY p.categoria ORDER BY SUM(cd.cantidad) DESC")
    List<CategoryCountProjection> productsByCategory(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);
}
