/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.VacanteDao;
import com.b1soft.modelo.Vacante;
import com.b1soft.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;


/**
 *
 * @author Yirz
 */
@Repository("vacanteDao")
public class VacanteDaoImp implements VacanteDao{

    @Override
    public List<Vacante> findAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        List<Vacante> lista=null;
        try{
            transaction.begin();
            Query query=session.createQuery("from Vacante v order by v.id_vacante");
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
    public Vacante create(Vacante entidad) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        try{
            transaction.begin();
            Integer id = (Integer) session.save(entidad);
            transaction.commit();
            entidad.setId_vacante(id);
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
        return entidad;
    }

    @Override
    public Vacante findById(Integer id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        Vacante entidad=null;
        try{
            transaction.begin();
            entidad = session.get(Vacante.class,id);
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
        return entidad;
    }

    @Override
    public Vacante update(Vacante entidad) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        try{
            transaction.begin();
            session.update(entidad);
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
        return entidad;
    }
     public boolean delete(Vacante entidad) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        boolean flag =true;
        try{
            transaction.begin();
            session.delete(entidad);
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
     /*
    public static void main(String[] args) {
        VacanteDaoImp dao = new VacanteDaoImp();
        Vacante entidad=new Vacante();
        //List<Vacante> list = dao.findAll();
        //entidad = dao.findById(1);
        entidad.setId_vacante(1);
        entidad.setNombre_vacante("Java Medio");
        //entidad=dao.create(entidad);
        dao.delete(entidad);
        System.out.println(entidad);
    }*/
}
