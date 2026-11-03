package com.example.student_management_system.Controller;

import com.example.student_management_system.Service.DashboardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final DashboardService dashboardService;

    DashboardController(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        model.addAttribute("totalStudents", dashboardService.getTotalStudents());
        model.addAttribute("totalCourses", dashboardService.getTotalCourses());
        model.addAttribute("deptData", dashboardService.getDepartmentWiseCount());
        model.addAttribute("yearData", dashboardService.getYearWiseCount());
        return "dashboard";
    }
}
