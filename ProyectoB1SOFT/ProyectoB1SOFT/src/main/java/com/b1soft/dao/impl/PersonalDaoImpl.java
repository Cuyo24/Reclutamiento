/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.PersonalDao;
import com.b1soft.modelo.AddAdmin;
import com.b1soft.modelo.Administrador;
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
@Repository
public class PersonalDaoImpl implements PersonalDao {

    @Override
    public List<Administrador> findAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        List<Administrador> lista=null;
        try{
            transaction.begin();
            Query query=session.createQuery("from Administrador v order by v.id_empleado ");
            lista=query.list();
            transaction.commit();
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
        return lista;
    }

    @Override
    public Administrador findById(String id_empleado) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        Administrador ePersonal=null;
        try{
            transaction.begin();
            ePersonal = session.get(Administrador.class,id_empleado);
            transaction.commit();
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
        return ePersonal;
      
    }

    @Override
    public Administrador update(Administrador ePersonal) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        try{
            transaction.begin();
            session.update(ePersonal);
            transaction.commit();
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
        return ePersonal;
    }

    @Override
    public boolean delete(Administrador ePersonal) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        boolean flag =true;
        try{
            transaction.begin();
            session.delete(ePersonal);
            transaction.commit();
        }
        catch(HibernateException ex){
            if(transaction != null && transaction.isActive() ){
                transaction.rollback();
            }
            flag=false;
        }
        finally{
            if(session!=null){
                session.close();
            }
        }
        return flag;
}
    //Metodo para el findAll
    /*public static void main(String[] args) {
        PersonalDaoImpl Dao= new PersonalDaoImpl();
        Administrador mPersonal= new Administrador();
        List<Administrador> list = Dao.findAll();
        System.out.println(list);
    }
    /*
    public static void main(String[] args) {
        PersonalDaoImpl dao = new PersonalDaoImpl();
        Personal entidad=new Personal();
        //List<Persona> list = dao.findAll();
        //entidad = dao.findById(1);
        entidad.setId_personal(1);
        entidad.setNombre_admin("Java Medio");
        //entidad=dao.create(entidad);
        dao.delete(entidad);
        System.out.println(entidad);
    }*/
}
