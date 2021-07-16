package com.b1soft.dao;

import com.b1soft.modelo.Vacante_prueba;
import java.util.List;

public interface pruebasPostulanteDao {
        public List<Vacante_prueba> findById(final Integer idvacante);
}
