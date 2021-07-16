/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.PruebasAdministradorDao;
import com.b1soft.modelo.PruebasAdministrador;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.b1soft.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
/**
 *
 * @author DELL
 */
@Repository("pruebasAdministradorDao")
public class PruebasAdministradorDaoImpl implements PruebasAdministradorDao {

    /*public List<PruebasAdministrador> getPruebas() {
        System.out.println("Llego al Dao");
        List<PruebasAdministrador> lista = null;
	//final Session session = sessionFactory.openSession();
        final Session session = HibernateUtil.getSession().openSession();
	try {
            Criteria criteria = session.createCriteria(PruebasAdministrador.class);
            criteria.add(Restrictions.ne("deleted", "T"));
            lista = (List<PruebasAdministrador>) criteria.list();
        }
	catch(Exception ex) {
            ex.printStackTrace();
	}
	finally {
            session.close();
	}
	return lista;
    }*/

    @Override
    public List<PruebasAdministrador> findAll() {
        System.out.println("Llego al Dao");
        List<PruebasAdministrador> lista = null;
        final Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(PruebasAdministrador.class);
            criteria.add(Restrictions.ne("deleted", 'T'));
            lista = (List<PruebasAdministrador>) criteria.list();
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
    public PruebasAdministrador create(PruebasAdministrador nuevaPrueba) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        Long id =null;
        try {
            transaction.begin();
            id = (Long) session.save(nuevaPrueba);
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
    public PruebasAdministrador findById(Long idPrueba) {
        Session session = HibernateUtil.getSessionFactory().openSession();
	 Transaction transaction = session.getTransaction();
        PruebasAdministrador prueba = null;
	try {
            transaction.begin();
            prueba = (PruebasAdministrador) session.get(PruebasAdministrador.class, idPrueba);
            transaction.commit();
	} catch(HibernateException e){
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }		
	} catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
	} finally {
            session.close();
	}
	return prueba;
    }

    @Override
    public PruebasAdministrador update(PruebasAdministrador nuevaPrueba) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.update(nuevaPrueba);
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
        return nuevaPrueba;
    }
    public void delete(PruebasAdministrador nuevaPrueba) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.delete(nuevaPrueba);
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
        //return nuevaPrueba;
    }
    public static void main(String[] args) {
        //List<PruebasAdministrador> list;
        PruebasAdministradorDao dao = new PruebasAdministradorDaoImpl();
        PruebasAdministrador prueba = new PruebasAdministrador();
        prueba.setDeleted('T');
        prueba.setInstrucciones_prueba("Resuelve");
        prueba.setNombre_prueba("Java jr");
        dao.create(prueba);
        //System.out.println(list);
    }
}
