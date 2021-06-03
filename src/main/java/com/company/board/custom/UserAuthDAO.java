package com.company.board.custom;

import org.springframework.stereotype.Repository;

@Repository("userDAO")
public interface UserAuthDAO {

	CustomUserDetails getUserById(String username);

}
