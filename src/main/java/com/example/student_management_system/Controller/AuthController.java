package com.example.student_management_system.Controller;

import com.example.student_management_system.Entity.StudentEntity;
import com.example.student_management_system.Entity.UserEntity;
import com.example.student_management_system.Model.UserRole;
import com.example.student_management_system.Repository.StudentRepository;
import com.example.student_management_system.Repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    private final UserRepository userRepository;

    private final StudentRepository studentRepository;


    AuthController(UserRepository userRepository, StudentRepository studentRepository) {
        this.userRepository = userRepository;
        this.studentRepository = studentRepository;
    }



    @GetMapping("/")
    public String rootRedirect() {
        return "redirect:/home"; // Default landing page
    }
    
    @GetMapping("/home")
    public String homePage(HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) {
            return "redirect:/login";
        }
        return "home"; // Renders home.jsp
    }
    

    // === Signup ===
    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam(required = false) String username,
                               @RequestParam(required = false) String enrollmentNumber,
                               @RequestParam String email,
                               @RequestParam String password,
                               @RequestParam UserRole role,
                               Model model) {
    
        if (userRepository.findByEmail(email) != null) {
            model.addAttribute("error", "Email already registered.");
            return "signup";
        }
    
        UserEntity user = new UserEntity();
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
    
        if (role == UserRole.STUDENT) {
            if (enrollmentNumber == null || enrollmentNumber.isEmpty()) {
                model.addAttribute("error", "Enrollment number is required for students.");
                return "signup";
            }
    
            StudentEntity student = studentRepository.findByEnrollmentNumber(enrollmentNumber);
            if (student == null) {
                model.addAttribute("error", "Enrollment number not found.");
                return "signup";
            }
    
            user.setUsername(student.getFullName()); // Use student name from DB
        } else {
            if (username == null || username.isEmpty()) {
                model.addAttribute("error", "Username is required for admin/staff.");
                return "signup";
            }
    
            user.setUsername(username);
        }
    
        userRepository.save(user);
        return "redirect:/login";
    }
    
    

    // === Login ===
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

@PostMapping("/login")
public String login(@RequestParam(required = false) String username,
                    @RequestParam(required = false) String enrollmentNumber,
                    @RequestParam String password,
                    HttpSession session,
                    Model model) {

if (enrollmentNumber != null && !enrollmentNumber.isEmpty()) {
    StudentEntity student = studentRepository.findByEnrollmentNumber(enrollmentNumber);

    if (student == null) {
        model.addAttribute("error", "Invalid enrollment number or password.");
        return "login";
    }

    // Step 2: Find user record by student email (you can also use student name if consistent)
    UserEntity user = userRepository.findByEmail(student.getEmail());

    if (user == null || !user.getPassword().equals(password) || user.getRole() != UserRole.STUDENT) {
        model.addAttribute("error", "Invalid enrollment number or password.");
        return "login";
    }

    // Step 3: Store student info in session
    session.setAttribute("loggedStudent", student);
    session.setAttribute("loggedUser", user); // optional if needed later

    return "redirect:/student/home";
}


    // Else: Admin or Staff login via username
    UserEntity user = userRepository.findByUsernameAndPassword(username, password);
    if (user == null) {
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    session.setAttribute("loggedUser", user);
    return switch (user.getRole()) {
        case ADMIN -> "redirect:/admin/home";
        case STAFF -> "redirect:/staff/home";
        case STUDENT -> "redirect:/student/home";
    };
}


    // === Logout ===
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
