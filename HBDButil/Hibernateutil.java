package HBDButil;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class Hibernateutil {
    private static SessionFactory sessionFactory;

    static {
        try {
            Configuration cfg = new Configuration().configure("config/config.xml");
            cfg.addAnnotatedClass(POJO.Doctor.class);
            cfg.addAnnotatedClass(POJO.Patient.class);
            cfg.addAnnotatedClass(POJO.Appointment.class);
            cfg.addAnnotatedClass(POJO.User.class);

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();

            sessionFactory = cfg.buildSessionFactory(serviceRegistry);
        } catch (Throwable exception) {
            System.out.println("Session Factory Creation Failed");
            throw new RuntimeException(exception);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
