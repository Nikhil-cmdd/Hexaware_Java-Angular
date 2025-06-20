package com.example.demo.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "patients")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Patient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int patientId;

	private String name;

	private LocalDate dob;

	@Enumerated(EnumType.STRING)
	private Gender gender;

	@Column(unique = true)
	private String contactNumber;

	@Column(unique = true)
	private String email;

	private String password;

	private String address;

	public enum Gender {
	    Male, Female, Other
	}
}
