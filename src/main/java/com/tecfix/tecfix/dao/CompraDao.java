package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.Compra;
import com.tecfix.tecfix.dto.MonthAmountProjection;
import com.tecfix.tecfix.dto.UserSalesProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface CompraDao extends JpaRepository<Compra, Long> {
    @Query("SELECT YEAR(c.fecha) as year, MONTH(c.fecha) as month, SUM(c.total) as amount " +
            "FROM Compra c WHERE (:start IS NULL OR c.fecha >= :start) AND (:end IS NULL OR c.fecha <= :end) " +
            "GROUP BY YEAR(c.fecha), MONTH(c.fecha) ORDER BY YEAR(c.fecha), MONTH(c.fecha)")
    List<MonthAmountProjection> sumSalesByMonth(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);

    @Query("SELECT c.usuario.id as userId, c.usuario.nombre as userName, SUM(c.total) as amount " +
            "FROM Compra c WHERE (:start IS NULL OR c.fecha >= :start) AND (:end IS NULL OR c.fecha <= :end) " +
            "GROUP BY c.usuario.id, c.usuario.nombre ORDER BY SUM(c.total) DESC")
    List<UserSalesProjection> salesByUser(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);
}
