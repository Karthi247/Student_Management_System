package com.example.student_management_system.Service;

import com.example.student_management_system.Repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DashboardService {

    @Autowired
    private StudentRepository studentRepository;

    public long getTotalStudents() {
        return studentRepository.count();
    }

    public int getTotalCourses() {
        return studentRepository.countByDepartment().size();
    }

    public Map<String, Long> getDepartmentWiseCount() {
        List<Object[]> result = studentRepository.countByDepartment();
        Map<String, Long> map = new LinkedHashMap<>();
        for (Object[] row : result) {
            map.put((String) row[0], (Long) row[1]);
        }
        return map;
    }

    public Map<String, Long> getYearWiseCount() {
        List<Object[]> result = studentRepository.countByYear();
        Map<String, Long> map = new LinkedHashMap<>();
        for (Object[] row : result) {
            map.put((String) row[0], (Long) row[1]);
        }
        return map;
    }
}

