
package com.b1soft.dao.impl;

import com.b1soft.dao.InvitacionDao;
import com.b1soft.modelo.Invitacion;
import com.b1soft.modelo.Sin_Invitacion;
import com.b1soft.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author luisr
 */
@Repository("InvitacionDao")
public class InvitacionDaoImp implements InvitacionDao {

    @Override
    public List<Invitacion> findAll() {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List <Invitacion> lista=null;
        try{
            //Para crear un lista de invitaciones creamos una query se usa declaraciones sql 
            transaction.begin();
                Query query=session.createQuery("from Invitacion v order by v.id_invitacion");
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
    //Este metodo servira para la creacion de la invitacion cuando se postulen para enviar el correo
    @Override
    public Invitacion create(Invitacion eInvitacion) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            Integer id = (Integer) session.save(eInvitacion);
            transaction.commit();
            eInvitacion.setId_invitacion(id);
            
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
        return eInvitacion;    
    }

    @Override
    public Invitacion findById(Integer id_invitacion) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        Invitacion eInvitacion=null;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
                eInvitacion = session.get(Invitacion.class, id_invitacion);
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
        return eInvitacion;    
    }
    @Override
    public Invitacion findByToken(String token) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List<Invitacion> eInvitacion=null;
        Invitacion invitacion=null;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            Query query = session.createSQLQuery("select * from Invitacion vp where vp.token=:v").addEntity(Invitacion.class).setParameter("v",token);
            eInvitacion = query.list();
            transaction.commit();
            if(eInvitacion.size()==1){
                invitacion=eInvitacion.get(0);
            }
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
        return invitacion;    
    }
    @Override
    public Invitacion update(Invitacion eInvitacion) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        try{
            transaction.begin();
            session.update(eInvitacion);    
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
        return eInvitacion;
    }
     
    @Override
    public boolean delete(Invitacion eInvitacion) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        boolean flag=true;
        try{
            transaction.begin();
            session.delete(eInvitacion);    
            transaction.commit();
           
        }catch(HibernateException eh){
            if(transaction != null && transaction.isActive()){
                //rollback regresa la base de datos al estado anterior
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
    @Override
    public List<Sin_Invitacion> findPostulantesSinInvitacion() {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List<Sin_Invitacion> eInvitacion=null;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            Query query = session.createSQLQuery("select * from Sin_Invitacion s").addEntity(Sin_Invitacion.class);
            eInvitacion = query.list();
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
        return eInvitacion;   
    }
    @Override
    public Sin_Invitacion findPostulantesSinInvitacionByRFC(String rfc) {
        //Utileria y configuracion de hibernate
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction= session.getTransaction();
        List<Sin_Invitacion> eInvitacion=null;
        Sin_Invitacion entidad=null;
        try{
            //Casteamos el integer y lo mandamos a la entidad
            transaction.begin();
            Query query = session.createSQLQuery("select * from Sin_Invitacion s where s.RFC=:v").addEntity(Sin_Invitacion.class).setParameter("v", rfc);
            eInvitacion = query.list();
            transaction.commit();
            if(eInvitacion.size()==1)
                entidad=eInvitacion.get(0);
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
    
}