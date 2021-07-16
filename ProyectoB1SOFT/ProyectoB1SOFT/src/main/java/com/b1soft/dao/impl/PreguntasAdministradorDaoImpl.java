/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.PreguntasAdministradorDao;
import com.b1soft.modelo.PreguntasAdministrador;
import com.b1soft.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author DELL
 */
@Repository("preguntasAdministradorDao")
public class PreguntasAdministradorDaoImpl implements PreguntasAdministradorDao {

    @Override
    public List<PreguntasAdministrador> getPreguntasPrueba(Long Id_prueba) {
        final Session session = HibernateUtil.getSessionFactory().openSession();
        List<PreguntasAdministrador> listaPreg = new ArrayList<PreguntasAdministrador>();
        try {
        Criteria criteria = session.createCriteria(PreguntasAdministrador.class);
            criteria.add(Restrictions.ne("deleted", 'T'));
            criteria.createAlias("prueba", "pr");		
            criteria.add(Restrictions.eq("pr.Id_prueba", Id_prueba));
            listaPreg = (List<PreguntasAdministrador>) criteria.list();
        } catch (Exception e) {
            e.printStackTrace();
            if(e instanceof RuntimeException) {
                throw (RuntimeException)e;
            }
        } finally {
            session.close();
        }
        return listaPreg;
    }

    @Override
    public List<PreguntasAdministrador> findAll() {
        System.out.println("Llego al Dao");
        List<PreguntasAdministrador> lista = null;
        final Session session = HibernateUtil.getSessionFactory().openSession();
	try {
            Criteria criteria = session.createCriteria(PreguntasAdministrador.class);
            criteria.add(Restrictions.ne("deleted", 'T'));
            lista = (List<PreguntasAdministrador>) criteria.list();
        }
	catch(Exception ex) {
            ex.printStackTrace();
	}
	finally {
            session.close();
	}
	return lista;
    }

    @Override
    public PreguntasAdministrador create(PreguntasAdministrador nuevaPregunta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        Long id = null;
        try {
            transaction.begin();
            id = (Long) session.save(nuevaPregunta);
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        //Ver cómo regresar el objeto creado
        return findById(id);
    }

    @Override
    //Que no regrese objetos eliminados
    public PreguntasAdministrador findById(Long idPregunta) {
    Session session = HibernateUtil.getSessionFactory().openSession();
	PreguntasAdministrador prueba = null;
	try {
        session.clear();
        prueba = (PreguntasAdministrador) session.get(PreguntasAdministrador.class, idPregunta);
        if(prueba.getDeleted().equals('T')) {
            return null;
        }
	} catch(HibernateException e){
            e.printStackTrace();		
	} catch (Exception e) {
            e.printStackTrace();
	} finally {
            session.close();
	}
	return prueba;
    }

    @Override
    public PreguntasAdministrador update(PreguntasAdministrador nuevaPregunta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.update(nuevaPregunta);
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return nuevaPregunta;
    }
    @Override
    public void delete(PreguntasAdministrador nuevaPregunta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.delete(nuevaPregunta);
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

}
