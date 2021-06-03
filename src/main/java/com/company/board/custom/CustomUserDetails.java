package com.company.board.custom;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	/*기본적인 오버라이딩 메소드들은 오버라이딩하고,
		다른 추가적인 회원 정보 컬럼이 있다면 멤버변수로 추가하고 getter, 
		setter을 추가해주면 된다.VO라고 보면됨.
	*/
	
	//기본적으로 구현해야 하는 컬럼인듯함
	private String id;
	private String password;
	private String name;
	private String auth;
	private int enabled;
	
	private int memberGrade;
	
	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	//, getAuthorities()는 해당 사용자의 권한을 GrantedAuthority나 GrantedAuthority의 자식 클래스를 제네릭으로 갖는 컬렉션을 반환하는 메소드입니다.
	/*
		예제
		String roleGrant = "ROLE_" + grant_name; 권한 이름 필드 선언시
        
        GrantedAuthority myGrant = new SimpleGrantedAuthority(roleGrant);
        
        List<GrantedAuthority> authorities = new ArrayList<>();
        
        authorities.add(myGrant);
        
        return authorities;
	*/
	//계정이 가진 권한 목록
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		if(memberGrade == 1) {
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}else if(memberGrade == 2) {
			authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		}
		return authList;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return id;
	}
	
	//계정 만료 여부
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//계정 잠김 여부
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//계정 패스워드 만료 여부
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	//사용 가능 여부
	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String toString() {
		return "CustomUserDetails [id=" + id + ", password=" + password + ", name=" + name + ", auth=" + auth
				+ ", enabled=" + enabled + ", memberGrade=" + memberGrade + "]";
	}
	
}
