package com.example.student_management_system.Repository;

import com.example.student_management_system.Entity.CourseEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CourseRepository extends JpaRepository<CourseEntity, Long> {
    // No extra methods needed for basic CRUD
    List<CourseEntity> findByDepartment(String department);
    List<CourseEntity> findBySemester(String semester);
    List<CourseEntity> findByDepartmentAndSemester(String department, String semester);

    
    @Query("SELECT DISTINCT c.department FROM CourseEntity c")
    List<String> findDistinctDepartments();

    @Query("SELECT DISTINCT c.semester FROM CourseEntity c")
    List<String> findDistinctSemesters();
}
