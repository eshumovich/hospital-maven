package com.solvd.hospital.hospital;

import com.solvd.hospital.disease.Department;
import com.solvd.hospital.human.Patient;
import com.solvd.hospital.information.Address;

import java.util.List;

public class Hospital {

    private Long id;
    private String name;
    private HeadPhysician headPhysician;
    private List<Department> departments;
    private List<Patient> patients;
    private Address address;

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

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    public List<Patient> getPatients() {
        return patients;
    }

    public void setPatients(List<Patient> patients) {
        this.patients = patients;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}


