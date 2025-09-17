package DAO;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

import HBDButil.Hibernateutil;
import POJO.Appointment;

public class AppointmentDAO {

    public void saveAppointment(Appointment appointment) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(appointment);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Appointment> getAllAppointments() {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            Query<Appointment> query = session.createQuery("FROM Appointment", Appointment.class);
            return query.getResultList();
        }
    }

    public Appointment getAppointmentById(int id) {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            return session.get(Appointment.class, id);
        }
    }

    public void deleteAppointment(int id) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            // Instead of get, use load
            Appointment appointment = session.load(Appointment.class, id);
            if (appointment != null) {
                session.delete(appointment);
            }

            tx.commit();
            System.out.println("Deleted Appointment: " + appointment);
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

 // ✅ Update existing appointment
    public void updateAppointment(Appointment appointment) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.update(appointment);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }


}
