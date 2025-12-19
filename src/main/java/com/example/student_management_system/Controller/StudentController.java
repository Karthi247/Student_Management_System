package com.example.student_management_system.Controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.student_management_system.Entity.CourseEntity;
import com.example.student_management_system.Entity.StudentEntity;
import com.example.student_management_system.Repository.StudentRepository;
import com.example.student_management_system.Repository.CourseRepository;
import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("students", studentRepository.findAll());
        return "student-home";
    }

    @GetMapping("/students")
    public String showStudentProfile(HttpSession session, Model model) {
        StudentEntity student = (StudentEntity) session.getAttribute("loggedStudent");
        if (student == null) {
            return "redirect:/login";
        }
    
        model.addAttribute("student", student);
        return "student-detail"; // This is your JSP page
    }
    
    @GetMapping("/courses")
    public String viewStudentCourses(HttpSession session, Model model) {
        StudentEntity student = (StudentEntity) session.getAttribute("loggedStudent");
    
        if (student == null) {
            return "redirect:/login"; // Force login if session expired
        }
    
        String department = student.getDepartment();
    
        List<CourseEntity> courses = courseRepository.findByDepartment(department);

        // Group courses by semester
            Map<String, List<CourseEntity>> groupedBySemester = courses.stream()
            .collect(Collectors.groupingBy(
                    CourseEntity::getSemester,
                    TreeMap::new,  // TreeMap keeps keys sorted
                    Collectors.toList()
            ));

        model.addAttribute("groupedCourses", groupedBySemester);
    
        model.addAttribute("courses", courses);
        model.addAttribute("department", department);
    
        return "studentCourses"; // → maps to studentCourses.jsp
    }
    

}
