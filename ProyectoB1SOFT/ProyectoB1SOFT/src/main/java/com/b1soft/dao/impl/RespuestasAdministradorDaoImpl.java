/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.RespuestasAdministradorDao;
import com.b1soft.modelo.PruebasAdministrador;
import com.b1soft.modelo.RespuestasAdministrador;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import com.b1soft.util.HibernateUtil;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author DELL
 */
@Repository("respuestasAdministradorDao")
public class RespuestasAdministradorDaoImpl implements RespuestasAdministradorDao {

    @Override
    public List<RespuestasAdministrador> getRespuestasPregunta(Long Id_pregunta) {
        final Session session = HibernateUtil.getSessionFactory().openSession();
        List<RespuestasAdministrador> listaResp = new ArrayList<RespuestasAdministrador>();
        try {
            Criteria criteria = session.createCriteria(RespuestasAdministrador.class);
            criteria.add(Restrictions.ne("deleted", 'T'));
            criteria.createAlias("pregunta", "pr");		
            criteria.add(Restrictions.eq("pr.Id_pregunta", Id_pregunta));
            listaResp = (List<RespuestasAdministrador>) criteria.list();
        } catch (Exception e) {
            e.printStackTrace();
            if(e instanceof RuntimeException) {
                throw (RuntimeException)e;
            }
        } finally {
            session.close();
        }
        return listaResp;
    }
    
    @Override
    public List<RespuestasAdministrador> findAll() {
        System.out.println("Llego al Dao");
        List<RespuestasAdministrador> lista = null;
        final Session session = HibernateUtil.getSessionFactory().openSession();
	try {
            Criteria criteria = session.createCriteria(RespuestasAdministrador.class);
            criteria.add(Restrictions.ne("deleted", 'T'));
            lista = (List<RespuestasAdministrador>) criteria.list();
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
    public RespuestasAdministrador create(RespuestasAdministrador nuevaRespuesta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        Long id = null;
        try {
            transaction.begin();
            id = (Long) session.save(nuevaRespuesta);
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
    public RespuestasAdministrador findById(Long idRespuesta) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        RespuestasAdministrador prueba = null;
        try {
            session.clear();
            prueba = (RespuestasAdministrador) session.get(RespuestasAdministrador.class, idRespuesta);
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
    public RespuestasAdministrador update(RespuestasAdministrador nuevaRespuesta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.update(nuevaRespuesta);
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
        return nuevaRespuesta;
    }
    public void delete(RespuestasAdministrador nuevaRespuesta) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.delete(nuevaRespuesta);
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
