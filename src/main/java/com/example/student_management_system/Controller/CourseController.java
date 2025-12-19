package com.example.student_management_system.Controller;

import com.example.student_management_system.Entity.CourseEntity;
import com.example.student_management_system.Repository.CourseRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;

    // ✅ View all courses
    @GetMapping("")
    public String listCourses(
            @RequestParam(required = false) String department,
            @RequestParam(required = false) String semester,
            Model model) {
    
        List<CourseEntity> courses;
    
        if (department != null && !department.isEmpty() && semester != null && !semester.isEmpty()) {
            courses = courseRepository.findByDepartmentAndSemester(department, semester);
        } else if (department != null && !department.isEmpty()) {
            courses = courseRepository.findByDepartment(department);
        } else if (semester != null && !semester.isEmpty()) {
            courses = courseRepository.findBySemester(semester);
        } else {
            courses = courseRepository.findAll();
        }
    
        model.addAttribute("courses", courses);
        model.addAttribute("departments", courseRepository.findDistinctDepartments());
        model.addAttribute("semesters", courseRepository.findDistinctSemesters());
    
        return "viewCourses"; // Your JSP page
    }
    
    

    // ✅ Show add course form
    @GetMapping("/add")
    public String showAddCourseForm(Model model) {
        model.addAttribute("course", new CourseEntity());
        return "addCourse";
    }

    // ✅ Save new or edited course
    @PostMapping("/save")
    public String saveCourse(@ModelAttribute("course") CourseEntity course) {
        courseRepository.save(course);
        return "redirect:/courses";
    }

    // ✅ Edit course
    @GetMapping("/edit/{id}")
    public String showEditCourseForm(@PathVariable Long id, Model model) {
        CourseEntity course = courseRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid course ID: " + id));
        model.addAttribute("course", course);
        return "addCourse";
    }

    // ✅ Delete course
    @GetMapping("/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        courseRepository.deleteById(id);
        return "redirect:/courses";
    }
}
