# Amazecare

Amazecare is a full-stack healthcare management platform. This repository contains the **frontend** (Angular) application. The backend is expected to be a separate service (see below).

---

## Table of Contents
- [Project Overview](#project-overview)
- [Folder Structure](#folder-structure)
- [Frontend (Angular)](#frontend-angular)
  - [Features](#features)
  - [Setup & Run](#setup--run)
- [Backend](#backend)
- [Contributing](#contributing)
- [License](#license)

---

## Project Overview
Amazecare provides a platform for managing hospitals, doctors, patients, appointments, assets, and more. It is designed for hospital administrators, doctors, employees, and patients to interact efficiently.

## Folder Structure
```
amazecare-frontend/
├── src/
│   ├── app/
│   │   ├── components/         # Angular components (UI, dashboards, etc.)
│   │   ├── interceptors/       # HTTP interceptors (e.g., JWT)
│   │   ├── models/             # TypeScript models
│   │   └── services/           # Angular services (API, auth, etc.)
│   ├── main.ts                 # Angular entry point
│   └── styles.scss             # Global styles
├── public/                     # Static assets
├── angular.json                # Angular CLI config
├── package.json                # NPM dependencies
└── README.md                   # Project documentation
```

## Frontend (Angular)
This is the main user interface for Amazecare, built with Angular.

### Features
- User authentication (login/register)
- Role-based dashboards (admin, doctor, employee, patient)
- Manage hospitals, doctors, patients, appointments, assets, and requests
- Responsive design

### Setup & Run
1. **Install dependencies:**
   ```bash
   npm install
   ```
2. **Run the development server:**
   ```bash
   npm start
   # or
   ng serve
   ```
3. **Open in browser:**
   Visit [http://localhost:4200](http://localhost:4200)

> **Note:** Requires Node.js and Angular CLI installed globally.

## Backend
The backend is not included in this repository. It is expected to provide RESTful APIs for authentication, data management, and business logic.

- **Tech stack:** (e.g., Node.js/Express, Django, etc. — update as appropriate)
- **Repository:** (link to backend repo if available)
- **API URL:** Configure the frontend to point to the backend API in the environment files (e.g., `src/environments/environment.ts`).

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a pull request

## License
[MIT](LICENSE) (or specify your license)
