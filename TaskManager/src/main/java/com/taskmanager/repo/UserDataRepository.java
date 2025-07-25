package com.taskmanager.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskmanager.model.UserData;
@Repository
public interface UserDataRepository extends JpaRepository<UserData, Integer> {

	Optional<UserData>findByName(String username);
}