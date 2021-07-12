package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberVerifyOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

      MemberDAO memberDao = new MemberDAO();
      int length = 6;
      int index = 0;
      String code="" ;
      char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
            'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
            'x', 'y', 'z' };

      StringBuffer sb = new StringBuffer();
      for (int i = 0; i < length; i++) {
         index = (int) (charSet.length * Math.random());
         sb.append(charSet[index]);
         code = sb.toString();
      }
      
      memberDao.sendEmail(request.getParameter("memberEmail"), "ABOplate 이메일 인증키 입니다.", code);
      
      PrintWriter out = response.getWriter();
      out.println(code);
      out.close();

      return null;
   }

}