package com.b1soft.dao.impl;

import com.b1soft.dao.PostulanteDao;
import com.b1soft.modelo.Postulante;
import com.b1soft.modelo.Vacante;
import com.b1soft.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
@Repository("PostulanteDaoImp")
public class PostulanteDaoImp implements PostulanteDao {

    @Override
    public List<Postulante> findAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List<Postulante> lista = null;
        try {
            transaction.begin();
            Query query = session.createQuery("from Postulante p order by p.RFC");
            lista = query.list();
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
        return lista;

    }

    @Override
    public Postulante create(Postulante entidad) {
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        try{
            transaction.begin();
            String RFC = (String) session.save(entidad);
            transaction.commit();
            entidad.setRFC(RFC);
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
    public Postulante findByRFC(String RFC) {
         Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction=session.getTransaction();
        Postulante entidad=null;
        try{
            transaction.begin();
            entidad = session.get(Postulante.class,RFC);
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
    public Postulante update(Postulante entidad) {
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

    @Override
    public boolean delete(Postulante entidad) {
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
    public Postulante loginPostulante(Postulante aa) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List lista = null;
        Postulante entidad=null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("select * from Postulante h where h.correo=:u and h.password=:p").addEntity(Postulante.class)
                    .setParameter("u", aa.getCorreo())
                    .setParameter("p", aa.getPassword());
            lista = query.list();
            transaction.commit();

            if(lista.size() > 0){
                entidad = (Postulante) lista.get(0);
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
    public Postulante findByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List lista = null;
        Postulante entidad=null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("select * from Postulante h where h.correo=:u").addEntity(Postulante.class)
                    .setParameter("u", email);
            lista = query.list();
            transaction.commit();

            if(lista.size() > 0){
                entidad = (Postulante) lista.get(0);
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

