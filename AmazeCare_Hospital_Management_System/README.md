# AmazeCare - Hospital Management System

AmazeCare is a comprehensive Hospital Management System designed to streamline operations for patients, doctors, hospital staff, and administrators. It consists of a Spring Boot-based backend (`amazecare-backend`) and an Angular-based frontend (`amazecare-frontend`).

---

## 🏗️ Project Structure


---

## 🚀 Tech Stack

| Layer     | Technology                        |
|-----------|-----------------------------------|
| Frontend  | Angular 20, TypeScript, SCSS      |
| Backend   | Spring Boot, JPA (Hibernate), JWT |
| Database  | H2 (Dev), MySQL/PostgreSQL (Prod) |
| Security  | JWT-based Auth, Role-based Access |

---

## 🔐 Authentication & Authorization

- **JWT Authentication**: Users log in via username/password. A JWT token is returned and stored on the frontend.
- **Interceptors**: Angular HTTP Interceptor attaches the JWT token to all outgoing requests.
- **Role-based Access Control**: Admin, Doctor, Patient, and Employee dashboards enforce access controls accordingly.

See [JWT Interceptor Implementation](#🔧-frontend-angular-key-features) for more.

---

## 📦 Backend: Spring Boot Features

### ✅ Key Features

- **JWT-based Authentication**
- **Role-based Authorization**
- **RESTful APIs for Core Entities**
- **Global Exception Handling**
- **DTO-based Request/Response Mapping**
- **Service Layer Abstraction**
- **Data Validation via Jakarta Validator**
- **Cross-Origin Config for Angular Frontend**

### 📂 Major Backend Packages


### 🔧 Exposed REST APIs

- **Auth**: `/api/auth/login`, `/api/auth/register`
- **Admin**: Manage all entities
- **Doctor**: View appointments, write consultations
- **Employee**: Schedule appointments, request assets
- **Patient**: Book appointments, view doctors, consult history

Models: `Admin`, `Doctor`, `Patient`, `Employee`, `Appointment`, `Consultation`, `Hospital`, `Asset`, `AssetRequest`

---

## 💻 Frontend: Angular Features

### ✅ Key Modules

- **Admin Dashboard**: Full CRUD (Doctors, Patients, Employees, Hospitals, Assets, etc.)
- **Doctor Dashboard**: View appointments, write consultations
- **Patient Dashboard**: Book appointments, view consult history
- **Employee Dashboard**: Schedule appointments, request assets
- **Login Page**: JWT-based login (no registration page)
- **Standalone Components** using Angular 20

### 🧠 JWT Interceptor (from chat "Create JWT Interceptor")

- Adds JWT token to outgoing HTTP requests
- Handles 401/403 errors to redirect to login
- Uses `AuthService` for token handling
