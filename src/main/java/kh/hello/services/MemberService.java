package kh.hello.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	//로그인
	public int login(String id, String pw)throws Exception{
		return mdao.login(id, pw);
	}
	
	//아이디 중복체크
	public int dupleCheck(String id)throws Exception{
		return mdao.dupleCheck(id);
	}
	
	//닉네임 중복체크
	public int nickDupleCheck(String nickName)throws Exception{
		return mdao.nickDupleCheck(nickName);
	}
	
	//연락처 중복체크
		public int phoneDupleCheck(String phone)throws Exception{
			return mdao.phoneDupleCheck(phone);
		}
		
	//인증메일, 코드 디비 추가
		public int insertCtfCode(String email, String ctfCode)throws Exception{
			return mdao.insertCtfCode(email, ctfCode);
		}
		
	//인증코드 확인
		public int confirmCode(String email, String code)throws Exception{
			return mdao.selectCtfCode(email, code);
		}
	
}
