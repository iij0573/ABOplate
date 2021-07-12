package com.aboplate.app.member;

import java.io.PrintWriter;

/*import java.io.PrintWriter;*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		MemberDAO mDao = new MemberDAO();
		MemberBean memberBean =new MemberBean();
		HttpSession session = request.getSession();
		
		String[] region_en = {"Gwangjin", "Seocho", "Seongdong", "Yangcheon", "Yongsan", "Eunpyeong"
				, "Jongno", "Jungnang", "Goyang", "Suwon", "Yongin"};
		String[] region_kor = {"광진구", "서초구", "성동구", "양천구", "용산구", "은평구"
				, "종로구", "중랑구", "고양시", "수원시", "용인시"};
		
		String[] preference_en = {"korean", "chinese", "japanese", "american"};
		String[] preference_kor = {"한식,", "중식,", "일식,", "양식,"};
		System.out.println("modify들어옴");
		
		String memberId = (String)session.getAttribute("sessionId");
		memberBean = mDao.getMemberInfo(memberId);
		request.setAttribute("memberBean", memberBean);
		
		//음식 선호 부분
		String mpref = memberBean.getMember_preference_food();
		String mregion= memberBean.getMember_region();
		String mpassword = mDao.decryptPw(memberBean.getMember_password());
		if(mpref!="") {		
			for (int i = 0; i < preference_kor.length; i++) {
				if (mpref.equals(preference_kor[i])) {
					mpref = preference_en[i];	
				}
			}
		}
		request.setAttribute("mpref", mpref);
		
		//지역 부분
		for (int i = 0; i < region_kor.length; i++) {
			if (mregion.equals(region_kor[i])) {
				mregion= region_en[i];
			}
		}
		request.setAttribute("mregion",mregion);
		request.setAttribute("mpassword",mpassword);
		forward.setRedirect(false);
		forward.setPath("/member/InformationModify.jsp");
		
		return forward;
	}

}
