import { Priority } from "./priority";
import { Status } from "./status";

export class Task {
    taskId: number;
  title: string;
  description: string;
  dueDate: string; 
  priority: Priority;
  status: Status;
}
