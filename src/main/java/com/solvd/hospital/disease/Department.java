package com.solvd.hospital.disease;

import com.solvd.hospital.hospital.ReceptionHour;

import java.util.List;

public class Department {

    private Long id;
    private String name;
    private List<Doctor> doctors;
    private List<ReceptionHour> receptionHours;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(List<Doctor> doctors) {
        this.doctors = doctors;
    }

    public List<ReceptionHour> getReceptionHours() {
        return receptionHours;
    }

    public void setReceptionHours(List<ReceptionHour> receptionHours) {
        this.receptionHours = receptionHours;
    }
}




