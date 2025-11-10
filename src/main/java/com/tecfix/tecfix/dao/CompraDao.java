package com.tecfix.tecfix.dao;

import com.tecfix.tecfix.models.Compra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompraDao extends JpaRepository<Compra, Long> {
}
