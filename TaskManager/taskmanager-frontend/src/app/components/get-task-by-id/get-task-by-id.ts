import { Component } from '@angular/core';
import { Task } from '../../models/task';
import { TaskService } from '../../service/task-service';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-get-task-by-id',
  imports: [FormsModule,RouterModule,CommonModule],
  templateUrl: './get-task-by-id.html',
  styleUrl: './get-task-by-id.css'
})
export class GetTaskById {
taskId: number;
  task: Task;
  token: string;

  constructor(private _taskService: TaskService) {
    this.token = localStorage.getItem('jwt');
  }

  fetchTask(): void {
    this._taskService.getTaskById(this.taskId, this.token).subscribe(x => {
      this.task = x;
    });
  }
}