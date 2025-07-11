import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { AuthRequest } from '../../models/auth-request';
import { AuthService } from '../../service/auth-service';

@Component({
  selector: 'app-login',
    standalone: true,
  imports: [CommonModule,FormsModule,RouterModule],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class Login {
userName: string = '';
  passWord: string = '';
  jwt: string = '';
  authRequest: AuthRequest;

  constructor(private _authService: AuthService, private _router: Router) {
    this.authRequest = new AuthRequest();
  }

  generate(): void {
    this.authRequest.username = this.userName;
    this.authRequest.password = this.passWord;

    this._authService.generateToken(this.authRequest).subscribe({
      next: (token: string) => {
    
        localStorage.setItem("jwt", token);
        this.jwt = token;
        this._router.navigate(['/main-menu']);
      },
      error: (err) => {
        alert("Login failed. Please check your credentials.");
        console.error(err);
      }
    });
  }
}