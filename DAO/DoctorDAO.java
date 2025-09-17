package DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import HBDButil.Hibernateutil;
import POJO.Doctor;

public class DoctorDAO {

    public void saveDoctor(Doctor doctor) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(doctor);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Doctor> getAllDoctors() {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Doctor", Doctor.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Doctor getDoctorByName(String doctorName) {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            String hql = "FROM Doctor d WHERE d.dr_name = :doctorName";
            return session.createQuery(hql, Doctor.class)
                         .setParameter("doctorName", doctorName)
                         .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void deleteDoctor(int drId) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            
            Doctor doctor = session.get(Doctor.class, drId);
            if (doctor != null) {
                session.delete(doctor);
                System.out.println("Doctor deleted successfully.");
            } else {
                System.out.println("Doctor not found with ID: " + drId);
            }
            
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }

    public void updateDoctor(Doctor doctor) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            session.update(doctor);  // Updates existing record

            tx.commit();
            System.out.println("Doctor updated successfully.");
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }public Doctor getDoctorById(int id) {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            return session.get(Doctor.class, id);
        }
    }


}
