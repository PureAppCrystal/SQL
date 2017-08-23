-- null 함수

select nvl(null, 0 ) from dual;





--nvl2 : null 이면 3번째 값을, null이 아니면 2번째 값을 갖는다.
select nvl2(null, 10, 20 ), nvl2(0,    10, 20 ) from dual;


