package DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import HBDButil.Hibernateutil;
import POJO.Patient;

public class PatientDAO {

    public void savePatient(Patient patient) {
        Transaction tx = null;
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(patient);  // or saveOrUpdate(patient)
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public List<Patient> getAllPatients() {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Patient", Patient.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Patient getPatientByName(String patientName) {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            String hql = "FROM Patient p WHERE p.Patient_name = :patientName";
            return session.createQuery(hql, Patient.class)
                         .setParameter("patientName", patientName)
                         .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public Patient getPatientById(int id) {
        try (Session session = Hibernateutil.getSessionFactory().openSession()) {
            return session.get(Patient.class, id);
        }
    }
}
