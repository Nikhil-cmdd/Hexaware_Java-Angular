package com.taskmanager.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskmanager.model.Task;

@Repository
public interface TaskRepository extends JpaRepository<Task,Integer> {
}