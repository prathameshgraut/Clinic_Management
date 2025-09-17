package POJO;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name="Doctor")
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Dr_id;

    private String Dr_name;
    private String Education;
    private String Phone;
    private String Email;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Appointment> appointments;

    public Doctor() {}

    // Getters and Setters
    public int getDr_id() { return Dr_id; }
    public void setDr_id(int dr_id) { Dr_id = dr_id; }

    public String getDr_name() { return Dr_name; }
    public void setDr_name(String dr_name) { Dr_name = dr_name; }

    public String getEducation() { return Education; }
    public void setEducation(String education) { Education = education; }

    public String getPhone() { return Phone; }
    public void setPhone(String phone) { Phone = phone; }

    public String getEmail() { return Email; }
    public void setEmail(String email) { Email = email; }

    public List<Appointment> getAppointments() { return appointments; }
    public void setAppointments(List<Appointment> appointments) { this.appointments = appointments; }
}
