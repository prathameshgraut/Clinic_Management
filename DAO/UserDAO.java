package DAO;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import HBDButil.Hibernateutil;
import POJO.User;

public class UserDAO {

    // ✅ Save new user in DB
    public void saveUser(User user) {
        Transaction tx = null;
        try (Session session = new Hibernateutil().getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(user);
            tx.commit();
            System.out.println("User saved successfully: " + user.getName());
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    // ✅ Validate username & password for login
    public boolean validateUser(String name, String password) {
        try (Session session = new Hibernateutil().getSessionFactory().openSession()) {
            String hql = "FROM User U WHERE U.name = :name AND U.password = :password";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("name", name);
            query.setParameter("password", password);

            User user = query.uniqueResult();

            if (user != null) {
                System.out.println("Login Success: " + name);
                return true;
            } else {
                System.out.println("Login Failed for: " + name);
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get user role (Admin/User)
    public String getUserRole(String name) {
        try (Session session = new Hibernateutil().getSessionFactory().openSession()) {
            String hql = "SELECT U.role FROM User U WHERE U.name = :name";
            Query<String> query = session.createQuery(hql, String.class);
            query.setParameter("name", name);

            String role = query.uniqueResult();
            System.out.println("Role fetched for " + name + ": " + role);
            return role;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
