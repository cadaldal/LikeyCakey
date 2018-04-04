package com.dal.likeycakey.biz.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dal.likeycakey.biz.model.vo.BizMember;
import com.dal.likeycakey.detailView.model.vo.ProductBoard;
import com.dal.likeycakey.member.model.vo.Member;

@Repository("bizDao")
public class BizDaoImpl implements BizDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBiz1(Member m) throws Exception {
		System.out.println("here is DAO insertBiz1");
		int result = sqlSession.insert("Member.insertMember", m);
		return result;
	}
	
	@Override
	public int insertBiz2(BizMember bm) throws Exception {
		System.out.println("here is DAO insertBiz2");
		int result2 = sqlSession.insert("bizMember.insertMember", bm);
		return result2;
	}
	
	@Override
	public Member selectMember(String id, String passwd) throws Exception{
		return (Member)sqlSession.selectOne("Member.loginCheck", new Member(id, passwd));
	}
	
	@Override
	public int selectMember(String id) throws Exception{
		return sqlSession.selectOne("Member.dupid", id);
	}
	
	@Override
	public int insertProductBoard(ProductBoard productBoard) throws Exception {
		System.out.println("bizDao의 insertProductBoard입니다");
		return sqlSession.insert("ProductBoard.insertProductBoard", productBoard);
	}
}
