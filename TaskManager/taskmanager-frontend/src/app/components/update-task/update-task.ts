import { Component } from '@angular/core';
import { Task } from '../../models/task';
import { TaskService } from '../../service/task-service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-update-task',
  imports: [CommonModule,FormsModule,RouterModule],
  templateUrl: './update-task.html',
  styleUrl: './update-task.css'
})
export class UpdateTask {
taskId: number;
  task: Task = new Task();
  token: string;
  message: string;
    errorMessage: string | null = null;
  tasks: Task[] = [];


  constructor(private _taskService: TaskService) {
    this.token = localStorage.getItem('jwt');
  }
 ngOnInit(): void {
    if (!this.token) {
      this.errorMessage = 'No authentication token found. Please login.';
      return;
    }

    
    this._taskService.getAllTasks(this.token).subscribe({
      next: (x) => this.tasks = x,
      error: (err) => this.errorMessage = 'Error loading tasks: ' + err.message
    });
  }
  update(): void {
    this._taskService.updateTask(this.taskId, this.task, this.token).subscribe(x => {
      this.message = x;

      this._taskService.getAllTasks(this.token).subscribe(updatedTasks => {
          this.tasks = updatedTasks;
        });
      },
      );
  }
}