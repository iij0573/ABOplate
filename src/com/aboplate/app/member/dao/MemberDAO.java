package com.aboplate.app.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.mybatis.config.SqlMapConfig;


public class MemberDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	

	public MemberDAO() {
		sqlsession = sessionf.openSession(true);
	}

	public boolean join(MemberBean member) {
		boolean check = false;
		if (sqlsession.insert("Member.join", member) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean updateMemberinfo(MemberBean memberBean) {
		boolean check = false;
	
		if(sqlsession.update("Member.updateMemberinfo", memberBean) == 1) {
			check = true;
		}
		return check;
	}
	
	public MemberBean login(String id, String pw) {

		HashMap<String, String> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("password", pw);
		return sqlsession.selectOne("Member.login", datas);

	}

	public String findId(String email, String name) {
		HashMap<String, String> datas = new HashMap<>();

		datas.put("email", email);
		datas.put("name", name);

		String member_id = sqlsession.selectOne("Member.findId", datas);

		return member_id;
	}

	public boolean updatePw(String newPw, String id) {
		boolean check = false;
		HashMap<String, String> datas = new HashMap<>();

		datas.put("new_pw", newPw);
		datas.put("id", id);

		if (sqlsession.update("Member.updatePw", datas) == 1) {
			check = true;
		}
		return check;
	}

	public boolean checkEmail(String email) {
		boolean check = false;

		if((Integer)sqlsession.selectOne("Member.checkEmail", email) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean checkNickname(String nickName) {
		boolean check = false;

		if((Integer)sqlsession.selectOne("Member.checkNickname", nickName) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean recommendStamp(String id) {
		boolean check = false;

		if(checkId(id)) {
			sqlsession.update("Member.updateStamp", id);
			check = true;
		}
		return check;
	}

	
	public boolean checkId(String id) {
		boolean check = false;
		if((Integer)sqlsession.selectOne("Member.checkId", id) == 1) {
			check = true;
		}
		return check;
	}
	
	public void deleteMember(String id) {
		sqlsession.delete("Member.deleteMember", id);
	}
	
	public void joinSns(String snsId) {
		HashMap<String, String> datas = new HashMap<>();
		
		datas.put("snsId", snsId);
		datas.put("nickName", createRandomPw());
		
		sqlsession.insert("Member.joinSns", datas);
		
	}
	
	public MemberBean getMemberInfo(String sessionId) {
		return sqlsession.selectOne("Member.getMemerInfo", sessionId);
		
	}
	
	public static int key = 5;
	public String encryptPw(String pw) {
		String result = "";
		for (int i = 0; i < pw.length(); i++) {
			result += (char)(pw.charAt(i) * key);
		}
		return result;
	}
	
	public String decryptPw(String enPw) {
		String result = "";
		for (int i = 0; i < enPw.length(); i++) {
			result += (char)(enPw.charAt(i) / key);
		}
		return result;
	}
	
	public String getMemberNickname(String id) {
		String nickname = sqlsession.selectOne("Member.getMemberNickname", id);
		return nickname;
	}


	public String createRandomPw() {
		int length = 10;
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9'
				,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'
				,'P','Q','R','S','T','U','V','W','X','Y','Z'
				,'a','b','c','d','e','f','g','h','i','k','l','m','n','o','p'
				,'q','r','s','t','u','v','w','x','y','z'};
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i<length; i++) {
			index = (int)(charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		return sb.toString();
	}


	public void sendEmail(String email, String subject, String content) {
        final String user = "aboplate004@gmail.com";
        final String password = "qwer1234!@";
        
        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

            // Subject
            message.setSubject(subject); //메일 제목을 입력

            // Text
            message.setText(content);    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
           System.out.println(e);
           System.out.println("MemberDAO sendNewPw 에러");
        } catch (MessagingException e) {
           System.out.println(e);
           System.out.println("MemberDAO sendNewPw 에러");
        }
    }
}



