package com.example.demo.service;

import com.example.demo.model.Patient;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.repo.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {
	@Autowired
	private PatientRepository repository;

	public Patient addPatient(Patient patient) {
	    return repository.save(patient);
	}

	public Patient updatePatient(int id, Patient updated) {
	    Patient existing = repository.findById(id)
	            .orElseThrow(() -> new ResourceNotFoundException("Patient not found with id: " + id));

	    existing.setName(updated.getName());
	    existing.setDob(updated.getDob());
	    existing.setGender(updated.getGender());
	    existing.setContactNumber(updated.getContactNumber());
	    existing.setEmail(updated.getEmail());
	    existing.setAddress(updated.getAddress());

	    return repository.save(existing);
	}

	public List<Patient> getPatientsByName(String name) {
	    return repository.findByNameContainingIgnoreCase(name);
	}

	public Patient login(String email, String password) {
	    return repository.findByEmailAndPassword(email, password)
	            .orElseThrow(() -> new ResourceNotFoundException("Invalid email or password"));
	}

}
