package com.solvd.hospital.hospital;

import java.time.LocalDateTime;

public class ReceptionHour {

    private Long id;
    private LocalDateTime reception;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getReception() {
        return reception;
    }

    public void setReception(LocalDateTime reception) {
        this.reception = reception;
    }
}
