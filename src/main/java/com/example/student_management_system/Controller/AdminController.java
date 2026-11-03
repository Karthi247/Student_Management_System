package com.example.student_management_system.Controller;

import com.example.student_management_system.Entity.StudentEntity;
import com.example.student_management_system.Repository.StudentRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final StudentRepository studentRepository;

    AdminController(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("students", studentRepository.findAll());
        return "home";
    }

    @GetMapping("/students")
    public String students(Model model) {
        model.addAttribute("students", studentRepository.findAll());
        return "student-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new StudentEntity());
        return "add-students";
    }

    @PostMapping("/save")
    public String saveStudent(@ModelAttribute("student") StudentEntity student) {
        studentRepository.save(student);
        return "redirect:/admin/students";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        StudentEntity student = studentRepository.findById(id).orElse(null);
        model.addAttribute("student", student);
        return "edit-student";
    }

    @PostMapping("/edit/{id}")
    public String updateStudent(@PathVariable Long id, @ModelAttribute StudentEntity student) {
        student.setId(id);
        studentRepository.save(student);
        return "redirect:/admin/students";
    }


    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        studentRepository.deleteById(id);
        return "redirect:/admin/students";
    }
}
