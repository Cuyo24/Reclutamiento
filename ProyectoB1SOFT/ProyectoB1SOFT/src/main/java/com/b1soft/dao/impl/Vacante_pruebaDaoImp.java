package com.b1soft.dao.impl;

import com.b1soft.dao.Vacante_pruebaDao;
import com.b1soft.modelo.Vacante_prueba;
import com.b1soft.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Yirz
 */
@Repository("vacante_pruebaDao")
public class Vacante_pruebaDaoImp implements Vacante_pruebaDao {

    @Override
    public Vacante_prueba create(Vacante_prueba entidad) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.save(entidad);
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
        return null;
    }

    @Override
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

    @Override
    public Vacante_prueba update(Vacante_prueba entidad) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.update(entidad);
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
        return entidad;
    }

    @Override
    public boolean delete(Vacante_prueba entidad) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        boolean flag = true;
        try {
            transaction.begin();
            session.delete(entidad);
            transaction.commit();
        } catch (HibernateException ex) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            flag = false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return flag;
    }
    /*
    public static void main(String[] args) {
        Vacante_pruebaDaoImp dao = new Vacante_pruebaDaoImp();
        Vacante_prueba entidad = new Vacante_prueba();
        entidad.setId_vacante(15);
        entidad.setId_prueba(1);
        dao.create(entidad);
        entidad.setId_vacante(15);
        entidad.setId_prueba(2);
        dao.create(entidad);
        entidad.setId_vacante(15);
        entidad.setId_prueba(3);
        dao.create(entidad);
        List<Vacante_prueba> lista=dao.findById(15);
        System.out.println(lista);
    }*/
}
