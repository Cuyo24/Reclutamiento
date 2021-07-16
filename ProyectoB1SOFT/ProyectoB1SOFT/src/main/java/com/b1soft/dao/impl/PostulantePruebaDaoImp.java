/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao.impl;

import com.b1soft.dao.PostulantePruebaDao;
import com.b1soft.modelo.PostulantePrueba;
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
@Repository("PostulantePruebaDao")
public class PostulantePruebaDaoImp implements PostulantePruebaDao{

    @Override
    public List<PostulantePrueba> findAll() {
         //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List <PostulantePrueba> lista=null;
        try{
            //Para crear un lista de invitaciones creamos una query se usa declaraciones sql 
            transaction.begin();
                Query query=session.createQuery("from Postulante_Prueba v order by v.RFC");
                lista=query.list();
            transaction.commit();
            
        }catch(HibernateException eh){
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
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
    public PostulantePrueba create(PostulantePrueba entidad) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            session.save(entidad);
            transaction.commit();  
        }catch(HibernateException eh){
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
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
    public List<PostulantePrueba> findById(String rfc) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List<PostulantePrueba> entidad=null;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            Query query = session.createSQLQuery("select * from Postulante_Prueba vp where vp.RFC=:v").addEntity(PostulantePrueba.class).setParameter("v",rfc);
            entidad = query.list();
            transaction.commit();
        }catch(HibernateException eh){
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
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
    public PostulantePrueba update(PostulantePrueba entidad) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            session.update(entidad);
            transaction.commit();  
        }catch(HibernateException eh){
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
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
    public boolean delete(PostulantePrueba entidad) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        boolean flag=true;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            session.delete(entidad);
            transaction.commit();  
        }catch(HibernateException eh){
            flag=false;
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
                transaction.rollback();
            }
        }
        finally{
            if(session!=null){
                session.close();
            }
        }
        return flag;
    }
    @Override
    public PostulantePrueba findByRfcAndId(final String rfc,Integer idPrueba) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List<PostulantePrueba> entidad=null;
        PostulantePrueba postulantePrueba=null;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            Query query = session.createSQLQuery("select * from Postulante_Prueba vp where vp.RFC=:v and vp.idPrueba=:p" )
                    .addEntity(PostulantePrueba.class)
                    .setParameter("v",rfc)
                    .setParameter("p", idPrueba);
            entidad = query.list();
            if(entidad.size()>0){
                postulantePrueba=entidad.get(0);
            }
            transaction.commit();
        }catch(HibernateException eh){
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
                transaction.rollback();
            }
        }
        finally{
            if(session!=null){
                session.close();
            }
        }
        return postulantePrueba; 
    }
    
}
