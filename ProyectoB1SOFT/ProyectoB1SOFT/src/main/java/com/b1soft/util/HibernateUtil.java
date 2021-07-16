package com.b1soft.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 *
 * @author luisr
 */
public class HibernateUtil {
    private static StandardServiceRegistry serviceRegistry;
    private static SessionFactory sessionFactory;
    
    public static SessionFactory getSessionFactory(){
        if(sessionFactory == null){
            try{
                serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
                MetadataSources sources = new MetadataSources(serviceRegistry);
                Metadata metadata = sources.getMetadataBuilder().build();
                sessionFactory = metadata.getSessionFactoryBuilder().build();
            }catch(Exception e){
                e.printStackTrace();
                if(serviceRegistry != null){
                    StandardServiceRegistryBuilder.destroy(serviceRegistry);
                }
            }
        }
        return sessionFactory;
    }
    
    //Metodo shutdown
    public static void shutdown(){
        if (serviceRegistry!=null){
            StandardServiceRegistryBuilder.destroy(serviceRegistry);
        }
    }
}
