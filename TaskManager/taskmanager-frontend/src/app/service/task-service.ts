import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Task } from '../models/task';

@Injectable({
  providedIn: 'root'
})
export class TaskService {
   private baseUrl = 'http://localhost:2003/api/tasks';
   constructor(private _http: HttpClient) { }

  getAllTasks(token: string): Observable<Task[]> {
    const headers_object = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });
    const httpOptions = { headers: headers_object };

    return this._http.get<Task[]>(`${this.baseUrl}/getAllTasks`, httpOptions);
  }
  getTaskById(taskId: number, token: string): Observable<Task> {
    const headers_object = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });
    const httpOptions = { headers: headers_object };

    return this._http.get<Task>(`${this.baseUrl}/getTaskById/${taskId}`, httpOptions);
  }
  createTask(task: Task, token: string): Observable<Task> {
    const headers_object = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });
    const httpOptions = { headers: headers_object };

    return this._http.post<Task>(`${this.baseUrl}/createTask`, task, httpOptions);
  }
  updateTask(taskId: number, task: Task, token: string): Observable<string> {
    const headers_object = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });
    const httpOptions = { headers: headers_object, responseType: 'text' as 'json' };

    return this._http.put<string>(`${this.baseUrl}/updateTask/${taskId}`, task, httpOptions);
  }

  deleteTask(taskId: number, token: string): Observable<string> {
    const headers_object = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });
    const httpOptions = { headers: headers_object, responseType: 'text' as 'json' };

    return this._http.delete<string>(`${this.baseUrl}/deleteTask/${taskId}`, httpOptions);
  }
}
