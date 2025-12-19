package com.example.student_management_system.Repository;

import com.example.student_management_system.Entity.StudentEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface StudentRepository extends JpaRepository<StudentEntity, Long> {

    @Query("SELECT s.department, COUNT(s) FROM StudentEntity s GROUP BY s.department")
    List<Object[]> countByDepartment();

    @Query("SELECT s.year, COUNT(s) FROM StudentEntity s GROUP BY s.year")
    List<Object[]> countByYear();

    StudentEntity findByEnrollmentNumber(String enrollmentNumber);

}
