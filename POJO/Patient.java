package POJO;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name="Patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Patient_id;

    private String Patient_name;
    private int Age;
    private String Gender;

    @Column(unique = true)
    private String Phone;

    @Column(unique = true)
    private String Email;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Appointment> appointments;

    public Patient() {}

    // Getters and Setters
    public int getPatient_id() { return Patient_id; }
    public void setPatient_id(int patient_id) { Patient_id = patient_id; }

    public String getPatient_name() { return Patient_name; }
    public void setPatient_name(String patient_name) { Patient_name = patient_name; }

    public int getAge() { return Age; }
    public void setAge(int age) { Age = age; }

    public String getGender() { return Gender; }
    public void setGender(String gender) { Gender = gender; }

    public String getPhone() { return Phone; }
    public void setPhone(String phone) { Phone = phone; }

    public String getEmail() { return Email; }
    public void setEmail(String email) { Email = email; }

    public List<Appointment> getAppointments() { return appointments; }
    public void setAppointments(List<Appointment> appointments) { this.appointments = appointments; }
}
