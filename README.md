# Student Management System

A role-based Student Management System built with **Java 21, Spring Boot, Spring Data JPA, MySQL, and JSP**. The application provides separate workflows for administrators, staff, and students to manage student information, organize courses, and view academic details.

## Features

### Authentication and user roles
- User registration and login pages.
- Role-based landing pages for `ADMIN`, `STAFF`, and `STUDENT`.
- Student login using an enrollment number.
- Session-based login state and logout.

### Administrator
- View the student list.
- Add, edit, and delete student records.
- Access the administration home page.

### Staff
- View student information.
- Add and edit student records.
- Delete student records.

### Student
- View a student profile.
- Browse courses associated with the student's department.
- View courses grouped by semester.

### Course management
- Add, edit, delete, and list courses.
- Filter courses by department and semester.
- Display course code, name, department, semester, and credits.

### Dashboard
- Display the total student count.
- Display department-wise and year-wise student counts.
- Present summary data for administrative visibility.

## Technology Stack

| Area | Technology |
|---|---|
| Language | Java 21 |
| Backend | Spring Boot 3.4.13 |
| Web | Spring Web, Spring MVC |
| Persistence | Spring Data JPA, Hibernate |
| Database | MySQL (MySQL Connector/J 8.0.33) |
| UI | JSP, JSTL |
| Application packaging | WAR |
| Build | Maven |
| Runtime | Embedded Tomcat |
| Additional dependencies | Spring Boot Actuator, H2 (runtime), DevTools |

## Application Structure

```text
Student_Management_System/
├── src/
│   ├── main/
│   │   ├── java/com/example/student_management_system/
│   │   │   ├── Controller/
│   │   │   │   ├── AdminController.java
│   │   │   │   ├── AuthController.java
│   │   │   │   ├── CourseController.java
│   │   │   │   ├── DashboardController.java
│   │   │   │   ├── StaffController.java
│   │   │   │   └── StudentController.java
│   │   │   ├── Entity/
│   │   │   │   ├── CourseEntity.java
│   │   │   │   ├── StudentEntity.java
│   │   │   │   └── UserEntity.java
│   │   │   ├── Model/
│   │   │   │   └── UserRole.java
│   │   │   ├── Repository/
│   │   │   │   ├── CourseRepository.java
│   │   │   │   ├── StudentRepository.java
│   │   │   │   └── UserRepository.java
│   │   │   ├── Service/
│   │   │   │   └── DashboardService.java
│   │   │   ├── ServletInitializer.java
│   │   │   └── StudentManagementSystem.java
│   │   ├── resources/
│   │   │   └── application.properties
│   │   └── webapp/WEB-INF/views/
│   │       ├── add-students.jsp
│   │       ├── addCourse.jsp
│   │       ├── dashboard.jsp
│   │       ├── edit-student.jsp
│   │       ├── header.jsp
│   │       ├── home.jsp
│   │       ├── login.jsp
│   │       ├── signup.jsp
│   │       ├── student-detail.jsp
│   │       ├── student-header.jsp
│   │       ├── student-home.jsp
│   │       ├── student-list.jsp
│   │       ├── studentCourses.jsp
│   │       └── viewCourses.jsp
│   └── test/
├── .mvn/
├── mvnw
├── mvnw.cmd
└── pom.xml
```

## Data Model

The application currently defines three JPA entities.

### Student
Stores student details such as full name, email, mobile number, date of birth, gender, address, department, academic year, enrollment number, and guardian contact information.

### Course
Stores course code, name, department, semester, and credit value.

### User
Stores username, email, password, and role (`ADMIN`, `STAFF`, or `STUDENT`). Student accounts are associated with a student record through enrollment-number and email lookups during registration and login.

## Getting Started

### Prerequisites

- JDK 21
- MySQL Server
- Maven 3.6+ (or use the Maven Wrapper included in the repository)
- Git

### 1. Clone the repository

```bash
git clone https://github.com/Karthi247/Student_Management_System.git
cd Student_Management_System
```

### 2. Create the database

Open MySQL and run:

```sql
CREATE DATABASE studentdb;
```

### 3. Configure database credentials

Open `src/main/resources/application.properties`. The repository currently contains a local MySQL connection configuration. Replace its credentials with your own values and do not commit passwords.

A safer environment-variable configuration is:

```properties
spring.application.name=student_management_system
spring.datasource.url=${DB_URL:jdbc:mysql://localhost:3306/studentdb}
spring.datasource.username=${DB_USERNAME:root}
spring.datasource.password=${DB_PASSWORD}
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
spring.thymeleaf.enabled=false
```

Set the environment variables before launching the application.

**PowerShell:**

```powershell
$env:DB_URL="jdbc:mysql://localhost:3306/studentdb"
$env:DB_USERNAME="root"
$env:DB_PASSWORD="your_mysql_password"
```

**Linux/macOS:**

```bash
export DB_URL="jdbc:mysql://localhost:3306/studentdb"
export DB_USERNAME="root"
export DB_PASSWORD="your_mysql_password"
```

The environment-variable configuration is a recommended change; update the existing properties file to use it before relying on those variables.

### 4. Run the application

Using the Maven Wrapper on Windows:

```bash
.\mvnw.cmd spring-boot:run
```

Using the Maven Wrapper on Linux/macOS:

```bash
./mvnw spring-boot:run
```

Or use an installed Maven version:

```bash
mvn spring-boot:run
```

### 5. Open the application

After startup, open:

```text
http://localhost:8080/
```

The root route redirects to the home route, which requires a logged-in user and otherwise redirects to the login page.

## Main Routes

| Area | Route | Purpose |
|---|---|---|
| Authentication | `GET /login` | Show login page |
| Authentication | `POST /login` | Authenticate a user |
| Authentication | `GET /signup` | Show registration page |
| Authentication | `POST /register` | Register a user |
| Authentication | `GET /logout` | Invalidate the session |
| Admin | `GET /admin/home` | Administration home |
| Admin | `GET /admin/students` | List students |
| Admin | `GET /admin/add` | Show student creation form |
| Admin | `POST /admin/save` | Save a student |
| Admin | `GET /admin/edit/{id}` | Show student edit form |
| Admin | `POST /admin/edit/{id}` | Update a student |
| Staff | `GET /staff/home` | Staff home |
| Staff | `GET /staff/add` | Show student form |
| Staff | `POST /staff/save` | Save a student |
| Student | `GET /student/home` | Student home |
| Student | `GET /student/students` | View logged-in student's profile |
| Student | `GET /student/courses` | View department courses |
| Courses | `GET /courses` | List and filter courses |
| Courses | `GET /courses/add` | Show course form |
| Courses | `POST /courses/save` | Save a course |
| Dashboard | `GET /dashboard` | View dashboard statistics |

These routes are declared in MVC controllers. The current code does not consistently enforce authorization at the controller level; add server-side role checks before deploying the application.

## Notes and Improvements

This repository is a learning/project implementation. Review the following before using it with real student data:

1. **Password security:** `AuthController` currently saves passwords as plain text and compares them directly during login. Replace this with BCrypt (or another adaptive password hash) and use a `PasswordEncoder`. Existing plain-text passwords should be migrated or reset.
2. **Database credentials:** `application.properties` contains a committed local database password. Remove it from source control, load secrets from environment variables or a secret manager, and rotate the credential if it has been used outside a disposable local environment.
3. **Authorization:** Separate landing pages exist for Admin, Staff, and Student, but a role-based security layer should protect sensitive routes and operations. A session check alone is not sufficient authorization.
4. **Destructive actions:** Student and course deletion are currently mapped to `GET` routes. Change these to `POST` or `DELETE`, add CSRF protection, and require authorization.
5. **Validation:** Add server-side validation for student, course, and registration forms, including unique enrollment numbers and email addresses.
6. **Dashboard counts:** The dashboard service currently derives its course total from a student repository department-count query. Verify the intended metric and use the course repository count if the card is meant to show total courses.
7. **Database setup:** `spring.jpa.hibernate.ddl-auto=update` is convenient for development. Use explicit schema migrations for a production database.
8. **Testing:** Expand the current test suite with repository, service, controller, authentication, and role-access tests.

## Future Enhancements

- Introduce Spring Security with role-based access control.
- Hash passwords with BCrypt and add password reset functionality.
- Add pagination and search to student and course listings.
- Add attendance, marks, grades, and report generation.
- Add form validation and centralized exception handling.
- Add database migrations with Flyway or Liquibase.
- Add integration tests and a CI workflow.
- Externalize configuration for local, test, and deployment environments.

## Contributing

Contributions and suggestions are welcome.

1. Fork the repository.
2. Create a feature branch.
3. Make and test your changes.
4. Submit a pull request describing the changes.

## License

No license file was identified in the repository when this README was prepared. Add a `LICENSE` file if you intend to define reuse and distribution terms.

## Author

**Karthi C**

GitHub: [@Karthi247](https://github.com/Karthi247)

---

Built as a Java and Spring Boot project to practice MVC architecture, database integration, session-based authentication, and role-oriented application workflows.
