package com.example.demo.controller;

import com.example.demo.model.Patient;
import com.example.demo.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RequestMapping("/patients")
@RestController
public class PatientController {



@Autowired
private PatientService service;


@PostMapping("/addPatient")
public Patient addPatient(@RequestBody Patient patient) {
    return service.addPatient(patient);
}


@PutMapping("/updatePatient/{id}")
public Patient updatePatient(@PathVariable int id, @RequestBody Patient patient) {
    return service.updatePatient(id, patient);
}


@GetMapping("/getPatientByName")
public List<Patient> getPatientByName(@RequestParam String name) {
    return service.getPatientsByName(name);
}

@PostMapping("/login")
public Patient login(@RequestBody Patient patient) {
    return service.login(patient.getEmail(), patient.getPassword());
}
}