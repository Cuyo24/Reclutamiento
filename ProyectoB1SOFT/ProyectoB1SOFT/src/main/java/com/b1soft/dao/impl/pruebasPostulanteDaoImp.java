package com.b1soft.dao.impl;

import com.b1soft.modelo.Vacante_prueba;
import com.b1soft.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class pruebasPostulanteDaoImp {
    public List<Vacante_prueba> findById(Integer idvacante) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List<Vacante_prueba> list = null;
        try {
            transaction.begin();
            Query query = session.createSQLQuery("select * from Vacante_prueba vp where vp.id_vacante=:v").addEntity(Vacante_prueba.class).setParameter("v", idvacante);
            list = query.list();
            transaction.commit();
        } catch (HibernateException ex) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return list;
    }
    
}
