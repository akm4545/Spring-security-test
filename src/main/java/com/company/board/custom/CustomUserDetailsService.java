package com.company.board.custom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userService")
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserAuthDAO userAuthDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetails user = userAuthDAO.getUserById(username);
		
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}
	
}
