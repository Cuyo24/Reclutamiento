package com.b1soft.dao;

import com.b1soft.modelo.Postulante;
import java.util.List;

public interface PostulanteDao {
    public List<Postulante> findAll();
    public Postulante create(final Postulante entidad);
    public Postulante findByRFC(final String RFC);
    public Postulante update(final Postulante entidad);
    public boolean delete(final Postulante entidad);
    public Postulante loginPostulante(Postulante aa);
    public Postulante findByEmail(final String email);
}

