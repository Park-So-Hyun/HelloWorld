package kh.hello.advisors;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import kh.hello.dao.MemberDAO;
import kh.hello.dto.LoginInfoDTO;

public class MemAdvisor {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberDAO dao;
	
	public String loginCheck(ProceedingJoinPoint pjp) {
		LoginInfoDTO dto = (LoginInfoDTO)session.getAttribute("loginInfo");
		
		if(dto == null) {
			String oriMethod = pjp.toShortString();
			Pattern p = Pattern.compile("execution\\(.+Controller.(.+?)\\(..\\)\\)");
			Matcher m = p.matcher(oriMethod);

			String getSig =  pjp.getSignature().toString();
			Pattern p2 = Pattern.compile(".+\\((.+?)(,.*){0,100}\\)");
			Matcher m2 = p2.matcher(getSig);
			
			while(m.find()){
				while(m2.find()) {
				String sysMethod = m.group(1).toString();
				String sysFirstParam = m2.group(1).toString();
				
				if(sysFirstParam.contentEquals("String")) {
					if(sysMethod.contentEquals("projectMainList")||sysMethod.contentEquals("bamboolistView\"")||
							sysMethod.contentEquals("IndustryStatusListView")||sysMethod.contentEquals("toPlog")) {
						return "redirect:../member/noMem1?result="+sysMethod;
					}
				}else if(sysFirstParam.contentEquals("int")){
					if(sysMethod.contentEquals("projectDetailView")||sysMethod.contentEquals("bambooDetailView")||
							sysMethod.contentEquals("industryStatusDetailView")){
						Object[] paramArr = pjp.getArgs();
						int seq = Integer.parseInt(paramArr[0].toString());
						return "redirect:../member/noMem2?result="+sysMethod+"&seq="+seq;
					}
				}
					
				}
			}
			return "redirect:/member/noMem";
		}else {
			
			//로그인중강제탈퇴체크
			String nickName = dao.selectMember(dto.getId()).getNickName();
			if(nickName == null) { //탈퇴된 경우
				//셀프탈퇴한 경우의 메서드 와 다를때만  이리로 리턴 
				if(!pjp.toShortString().contentEquals("execution(MemberController.memLogout(..))")) {
					return "redirect:../member/compulsionWithdrawal";
				}
				String result = "";
				try {
					Object objresult = pjp.proceed(pjp.getArgs());
					if(objresult!=null)
						result = objresult.toString();
				} catch (Throwable e) {
					e.printStackTrace();
				}
				return result;		
			}
			
			//dto null아닌경우
			int sysMemLevel = dao.selectMemLevelById(dto.getId());
			int lastLoginMemLevel = dto.getMemLevel();
			if(sysMemLevel != lastLoginMemLevel) {
				return "redirect:../member/reboot";
			}
			
			String result2 = "";
			try {
				Object objresult2 = pjp.proceed(pjp.getArgs());
				if(objresult2!=null)
					result2 = objresult2.toString();
			} catch (Throwable e) {
				e.printStackTrace();
			}
			return result2;
		}	
		
	}
	
	
	public String memLevelCheck(ProceedingJoinPoint pjp) {
		LoginInfoDTO dto = (LoginInfoDTO)session.getAttribute("loginInfo");
		
		if(dto.getMemLevel()==1) {
			return "redirect:../member/mLevelIs1";
		}
		
		String result = "";
		try {
			Object objresult = pjp.proceed(pjp.getArgs());
			if(objresult!=null)
				result = objresult.toString();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
}
