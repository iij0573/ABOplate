package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		MemberDAO mDao = new MemberDAO();
		MemberBean memberBean =new MemberBean();
		HttpSession session = request.getSession();
		boolean check = false;
		String[] region_en = {"Gwangjin", "Seocho", "Seongdong", "Yangcheon", "Yongsan", "Eunpyeong"
				, "Jongno", "Jungnang", "Goyang", "Suwon", "Yongin"};
		String[] region_kor = {"광진구", "서초구", "성동구", "양천구", "용산구", "은평구"
				, "종로구", "중랑구", "고양시", "수원시", "용인시"};
		
		String[] preference_en = {"korean", "chinese", "japanese", "american"};
		String[] preference_kor = {"한식", "중식", "일식", "양식"};
		
		System.out.println("memberok들어옴");
		String memberId = (String)session.getAttribute("sessionId");
		memberBean = mDao.getMemberInfo(memberId);
		System.out.println(memberId);	
		//password 수정 
		String userPassword = memberBean.getMember_password();
		
		memberBean.setMember_password(mDao.encryptPw(request.getParameter("newMemberPassword")));
		//선호음식 수정 
		String pref="";
		for (String favorite : request.getParameterValues("memberFavorite")) {				
			for (int i = 0; i < preference_en.length; i++) {
				if (favorite.equals(preference_en[i])) {
					pref += preference_kor[i] + ",";						
				}
			}
		}
		memberBean.setMember_preference_food(pref);
		//지역 수정 
		for (int i = 0; i < region_en.length; i++) {
			if (request.getParameter("memberRegion").equals(region_en[i])) {
				memberBean.setMember_region(region_kor[i]);
				break;
			}
		}
		check=mDao.updateMemberinfo(memberBean);
		if(!check) {
	         PrintWriter out=response.getWriter();
	         response.setContentType("text/html;charset=UTF-8");
	         out.println("<script>");
	         out.println("alert('실패');");
	         out.println("</script>");
	         out.close();
	      }
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/member/mypage.me");
		
		return forward;
	}

}
