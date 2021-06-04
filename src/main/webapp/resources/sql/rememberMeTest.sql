CREATE TABLE persistent_logins(
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	last_used timestamp not null
);

/*  
 최초 로그인이기 때문에 인증에 성공하면 해당 계정과 아래 정보를 생성해서 DB에 넣어준 뒤, 
 "series : token"으로 문자열을 붙여서 암호화를 한 뒤 쿠키를 생성해서 브라우저에 보내줍니다.
* Series : 기기, 브라우저별 쿠키를 구분할 고유 값
* token : 브라우저가 가지고 있는 쿠키의 값을 검증할 인증값
* last_used : 가장 최신 자동 로그인 시간   
* 고유한 구분자로 username(ID)이 아닌 series를 사용하는 이유는 다중 
* 기기나 브라우저에서 자동 로그인 기능을 사용하기 위함입니다. 
* 크롬과 익스플로러에서 둘 다 자동 로그인을 체크하고 로그인하면 username(ID)은 두 개가 생기지만 
* 각각 고유한 series값으로 구분됩니다. 
* 따라서 토큰이 신규 발급된 이후부터는 series 값으로 사용자 정보를 검색합니다.
토큰 유효시간에 대한 판단은 마지막 등록시점인 last_used 값에서 설정된 유효시간(디폴트 2주)
을 더한 값이 현재 서버의 시간보다 이전이면 유효한 것으로, 
이후이면 만료된 것으로 판단합니다. 
 */
