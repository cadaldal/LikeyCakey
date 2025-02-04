package com.dal.likeycakey.member.model.service;

import java.util.ArrayList;

import com.dal.likeycakey.member.model.vo.Member;
import com.dal.likeycakey.qna.model.vo.Homeqna;

public interface MemberService {
	public int insertMember(Member m) throws Exception;
	public int idCheck(String id);
	public Member forLogin(String id, String passwd) throws Exception;
	public int mdupid(String id);
	// 멤버 정보 id로 불러오기
	public Member selectMemberInfo(String id);
	public int updateMember(Member m) throws Exception;
	public int updatePassword(Member m)throws Exception;
	public ArrayList<Homeqna> homeqlist(Member m) throws Exception;
	public ArrayList<String> findId(Member m) throws Exception;
}
