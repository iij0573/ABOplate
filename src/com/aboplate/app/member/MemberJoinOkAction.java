package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberJoinOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		MemberDAO mDao=new MemberDAO();
		MemberBean member=new MemberBean();
		HttpSession session = request.getSession();
		
		ActionForward forward=new ActionForward();
		boolean check=false;
		
		String[] region_en = {"Gwangjin", "Seocho", "Seongdong", "Yangcheon", "Yongsan", "Eunpyeong"
				, "Jongno", "Jungnang", "Goyang", "Suwon", "Yongin"};
		String[] region_kor = {"광진구", "서초구", "성동구", "양천구", "용산구", "은평구"
				, "종로구", "중랑구", "고양시", "수원시", "용인시"};
		
		String[] preference_en = {"korean", "chinese", "japanese", "american"};
		String[] preference_kor = {"한식", "중식", "일식", "양식"};
		
		
//		if(session.getAttribute("snsId") != null) {
//			// sns �쉶�썝媛��엯
//			member.setMember_id(session.getAttribute("snsId").toString());
//			member.setMember_nickname(mDao.createRandomPw());
//			member.setMember_type(2);
//			
//			mDao.joinSns(member.getMember_id());
//		} else {
		String pref = "";
		member.setMember_id(request.getParameter("memberId"));
		member.setMember_name(request.getParameter("memberName"));
		member.setMember_email(request.getParameter("memberEmail"));
		member.setMember_password(mDao.encryptPw(request.getParameter("memberPassword")));
		member.setMember_nickname(request.getParameter("memberNickname"));
		for (String favorite : request.getParameterValues("memberFavorite")) {				
			for (int i = 0; i < preference_en.length; i++) {
				if (favorite.equals(preference_en[i])) {
					pref += preference_kor[i] + ",";						
				}
			}
		}
		member.setMember_preference_food(pref);
		for (int i = 0; i < region_en.length; i++) {
			if (request.getParameter("memberRegion").equals(region_en[i])) {
				member.setMember_region(region_kor[i]);
				break;
			}
		}
		check=mDao.join(member);
//		}
		if(!check) {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('�떎�떆 �떆�룄�빐二쇱꽭�슂.');");
			out.println("</script>");
			out.close();
		}
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/member/signup3.jsp");
		return forward;
	}
}
