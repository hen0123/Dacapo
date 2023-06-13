package kr.spring.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memID);

	public int join(Member m);

	public Member login(Member m);

	public int update(Member m);

	public void imageUpload(Member mvo);

	public Member getMember(String memID);

	public void memDelete(String memID);

	public String recentDate(String memID);

	public int countSwing(String memID);

	public int countDate(String memID);
	
	
	

}
