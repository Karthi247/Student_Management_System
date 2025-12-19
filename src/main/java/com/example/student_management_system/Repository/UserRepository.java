
package com.example.student_management_system.Repository;

import com.example.student_management_system.Entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByUsernameAndPassword(String username, String password);
    UserEntity findByEmail(String email);
}
