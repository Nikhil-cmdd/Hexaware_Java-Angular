package com.taskmanager.service;


import com.taskmanager.exception.TaskNotFoundException;
import com.taskmanager.model.Task;
import com.taskmanager.repo.TaskRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public ResponseEntity<Task> getTaskById(int id) throws TaskNotFoundException {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new TaskNotFoundException("Task not found with ID: " + id));
        return new ResponseEntity<>(task, HttpStatus.OK);
    }

    public ResponseEntity<Task> createTask(Task task) {
        Task savedTask = taskRepository.save(task);
        return new ResponseEntity<>(savedTask, HttpStatus.OK);
    }

    public ResponseEntity<String> updateTask(int id, Task updatedTask) throws TaskNotFoundException {
        Task oldTask = taskRepository.findById(id)
                .orElseThrow(() -> new TaskNotFoundException("Task not found with ID: " + id));

        oldTask.setTitle(updatedTask.getTitle());
        oldTask.setDescription(updatedTask.getDescription());
        oldTask.setDueDate(updatedTask.getDueDate());
        oldTask.setPriority(updatedTask.getPriority());
       oldTask.setStatus(updatedTask.getStatus());

        Task newTask = taskRepository.save(oldTask);
        return ResponseEntity.ok("Task with ID " + id + " updated successfully...");
    }

    public ResponseEntity<String> deleteTask(int id) throws TaskNotFoundException {
        if (!taskRepository.existsById(id)) {
            throw new TaskNotFoundException("Task not found with ID: " + id);
        }
        taskRepository.deleteById(id);
        return ResponseEntity.ok("Task with ID " + id + " deleted successfully...");
    }
}
