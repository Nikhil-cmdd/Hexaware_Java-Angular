import { Routes } from '@angular/router';
import { MainMenu } from './components/main-menu/main-menu';
import { ShowTasks } from './components/show-tasks/show-tasks';
import { Login } from './components/login/login';
import { GetTaskById } from './components/get-task-by-id/get-task-by-id';
import { CreateTask } from './components/create-task/create-task';
import { UpdateTask } from './components/update-task/update-task';
import { DeleteTask } from './components/delete-task/delete-task';

export const routes: Routes = [

    { path: '', component: Login },
    {path:'main-menu',component:MainMenu},
  { path: 'show-tasks', component: ShowTasks },
  { path: 'get-task-by-id', component: GetTaskById },
  { path: 'create-task', component: CreateTask },
{ path: 'update-task', component: UpdateTask },
 { path: 'delete-task', component: DeleteTask }
];
