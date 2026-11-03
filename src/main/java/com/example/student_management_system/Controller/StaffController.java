package com.example.student_management_system.Controller;


import com.example.student_management_system.Entity.StudentEntity;
import com.example.student_management_system.Repository.StudentRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/staff")
public class StaffController {

    private final StudentRepository studentRepository;

    StaffController(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("students", studentRepository.findAll());
        return "home";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new StudentEntity());
        return "student-form";
    }

    @PostMapping("/save")
    public String saveStudent(@ModelAttribute("student") StudentEntity student) {
        studentRepository.save(student);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        StudentEntity student = studentRepository.findById(id).orElse(null);
        model.addAttribute("student", student);
        return "student-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        studentRepository.deleteById(id);
        return "redirect:/";
    }
}
