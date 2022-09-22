package com.solvd.hospital.hospital;

import java.time.LocalDateTime;

public class ReceptionHour {

    private Long id;
    private LocalDateTime receptionTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getReceptionTime() {
        return receptionTime;
    }

    public void setReceptionTime(LocalDateTime receptionTime) {
        this.receptionTime = receptionTime;
    }
}
