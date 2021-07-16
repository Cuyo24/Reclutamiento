/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.AddAdminDao;
import com.b1soft.modelo.AddAdmin;
import com.b1soft.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author na_gr
 */
@Repository("AddAdminDao")
public class AddAdminDaoImpl implements AddAdminDao {

    @Override
    public AddAdmin create(AddAdmin eAdmin) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            String id= (String) session.save(eAdmin);
            transaction.commit();
            eAdmin.setId_empleado(id);
        }
        
        catch(HibernateException ex){
            if(transaction != null && transaction.isActive() ){
                transaction.rollback();
            }
        }
        finally{
            if(session!=null){
                session.close();
            }
        }
        return eAdmin;
    }
    
    @Override
    public AddAdmin loginAdmin(AddAdmin aa) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List lista = null;
        AddAdmin entidad=null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("select * from Administrador h where h.correo_admin=:u and h.password=:p").addEntity(AddAdmin.class)
                    .setParameter("u", aa.getCorreo_admin())
                    .setParameter("p", aa.getPassword());
            lista = query.list();
            transaction.commit();

            if(lista.size() > 0){
                entidad = (AddAdmin) lista.get(0);
            }
        }catch(HibernateException ex){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
        
        return entidad;
    }

    @Override
    public AddAdmin findByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List lista = null;
        AddAdmin entidad=null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("select * from Administrador h where h.correo_admin=:u").addEntity(AddAdmin.class)
                    .setParameter("u",email);
            lista = query.list();
            transaction.commit();

            if(lista.size() > 0){
                entidad = (AddAdmin) lista.get(0);
            }
        }catch(HibernateException ex){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
        
        return entidad;
    }
}
