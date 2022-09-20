package com.solvd.hospital.human;

import com.solvd.hospital.disease.Doctor;
import com.solvd.hospital.information.Contact;

import java.util.List;

public class Employee {

    private Long id;
    private List<Doctor> doctors;
    private Contact contact;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(List<Doctor> doctors) {
        this.doctors = doctors;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }
}
