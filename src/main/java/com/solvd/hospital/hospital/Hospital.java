package com.solvd.hospital.hospital;

import com.solvd.hospital.disease.Disease;
import com.solvd.hospital.human.Patient;
import com.solvd.hospital.human.Employee;

import java.util.List;

public class Hospital {

    private Long id;
    private String name;
    private HeadPhysician headPhysician;
    private List<Disease> diseases;
    private List<Patient> patients;
    private List<Employee> employees;

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

    public HeadPhysician getHeadPhysician() {
        return headPhysician;
    }

    public void setHeadPhysician(HeadPhysician headPhysician) {
        this.headPhysician = headPhysician;
    }

    public List<Disease> getDiseases() {
        return diseases;
    }

    public void setDiseases(List<Disease> diseases) {
        this.diseases = diseases;
    }

    public List<Patient> getPatients() {
        return patients;
    }

    public void setPatients(List<Patient> patients) {
        this.patients = patients;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }
}
