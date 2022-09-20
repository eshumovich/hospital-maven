package com.solvd.hospital.disease;

import com.solvd.hospital.hospital.ReceptionHour;
import com.solvd.hospital.human.Employee;

import java.util.List;

public class Department {

    private Long id;
    private String name;
    private List<Employee> employees;
    private ReceptionHour receptionHour;

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

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    public ReceptionHour getReceptionHour() {
        return receptionHour;
    }

    public void setReceptionHour(ReceptionHour receptionHour) {
        this.receptionHour = receptionHour;
    }
}


