package POJO;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name="Appointment")
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Appointment_id;

    private LocalDateTime Date;
    private String Reason;

    @ManyToOne
    @JoinColumn(name="Patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name="Dr_id")
    private Doctor doctor;

    public Appointment() {}

    // Getters and Setters
    public int getAppointment_id() { return Appointment_id; }
    public void setAppointment_id(int appointment_id) { Appointment_id = appointment_id; }

    public LocalDateTime getAppointment_date() { return Date; }
    public void setAppointment_date(LocalDateTime appointment_date) { Date = appointment_date; }

    public String getReason() { return Reason; }
    public void setReason(String reason) { Reason = reason; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }

    public Doctor getDoctor() { return doctor; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }
}
