package com.wingko.story.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MailUtil {

	private Logger logger = LoggerFactory.getLogger(MailUtil.class);
	
	public static String SMTP_HOST = "webmail.wingkostory.com";
	public static String SMTP_USER_ID = "webmaster@wingkostory.com";
	public static String SMTP_USER_PASS = "1234";
	
	// banner@wingkostory.com  >> 광고문의 메일 
	// help@wingkostory.com  >> 문의 메일 
	// webmaster@winkostory.com >>  전쳬 수신 발송 메일
	public static String MAIL_FROM_ADDRESS = "webmaster@wingkostory.com";
	
	public static boolean SendMailBody(String mail_to_addr, String mail_title, String mail_body) {
		return SendMailBody(MAIL_FROM_ADDRESS, mail_to_addr, mail_title, mail_body);
	}
	
	public static boolean SendMailBody(String mail_from_addr, String mail_to_addr, String mail_title, String mail_body) {
		Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", SMTP_HOST);

        try{
	        props.setProperty("mail.smtp.auth", "true");
	        Authenticator auth = new Authenticator(){
	        	public PasswordAuthentication getPasswordAuthentication(){
	        		return new PasswordAuthentication(SMTP_USER_ID, SMTP_USER_PASS);
	        	}
	        };
	
	        Session mailSession = Session.getInstance(props, auth);
	        
	        mailSession.setDebug(true);
	        Transport transport = mailSession.getTransport();
	
	        MimeMessage message = new MimeMessage(mailSession);
	        message.setSubject(MimeUtility.encodeText(mail_title, "UTF-8", "B"));
	        
	        message.setFrom(new InternetAddress(MAIL_FROM_ADDRESS));
	        
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail_to_addr));

	        message.setContent(mail_body, "text/html; charset=UTF-8");

	        transport.connect();
	        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
	        transport.close();

	        return true;
        }catch (Exception mex){
        	mex.printStackTrace();
        	return false;
        }

	}
	
	public static boolean SendMail(String RvMailAddress, String UserId, String type) throws Exception {
		return SendMail(RvMailAddress, UserId, type, "");
	}

    public static boolean SendMail(String RvMailAddress, String UserId, String type, String PassWord) throws Exception {
   	
    	String Title = "윙코스토리 가입환영메일";
    	String MailContent = "";
    	
    	if ("join".equals(type)) {
    		Title = "윙코스토리 가입환영메일";
    		MailContent = SetMailBodyMemberInsert(UserId);
		} else if ("password".equals(type)) {
    		Title = "윙코스토리 임시비밀번호 발송";
    		MailContent = SetMailBodyMemberPassword(UserId, PassWord);
		}
    	
    	return SendMailBody(MAIL_FROM_ADDRESS, RvMailAddress, Title, MailContent);
    }




    /**
     * 가입환영 메일
     * 
     * @param UserId
     * @return
     * @throws Exception
     */
    public static String SetMailBodyMemberInsert(String UserId) throws Exception {
		String MailMsg = "";
		
		StringBuffer StrTemp = new StringBuffer(); //빈버퍼생성
		
		StrTemp.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
		StrTemp.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
		StrTemp.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
		StrTemp.append("<head>");
		StrTemp.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
		StrTemp.append("<title>윙코스토리 가입환영메일</title>");
		StrTemp.append("</head>");
		StrTemp.append("<body>");
		StrTemp.append("<div style=\"width:750px; margin:0 auto;\">");
		StrTemp.append("<img src=\"http://www.wingkostory.com/resources/img/mail/mail_b01.png\" alt=\"\" title=\"\" /><br/>");
		StrTemp.append("<div style=\"padding:0 20px 20px 20px;\">");
		StrTemp.append("<h1 style=\"color:#333; font-size:24px; font-family:Malgun Gothic, Dotum; font-weight:normal;\">윙코스토리 회원가입을 환영합니다.</h1>");
		StrTemp.append("<br/>");
		StrTemp.append("<p style=\"font-size:12px; font-family:verdana, Microsoft-yahei,Dotum; color:#333; line-height:18px;\">");
		StrTemp.append("<span style=\"color:#006fb4;\"><strong>"+UserId+"</strong></span>님 가입해 주셔서 감사합니다!<br/>");
		StrTemp.append("윙코스토리와 좋은 인연에 감사드립니다. <br/>");
		StrTemp.append("<a href=\"http://www.wingkostory.com/index.do\" style=\"color:#006fb4; text-decoration:underline\" target=\"_blank\">윙코스토리 바로가기</a>");
		StrTemp.append("</p><br/>");
		StrTemp.append("</div>");
		StrTemp.append("<img src=\"http://www.wingkostory.com/resources/img/mail/mail_02.png\" alt=\"본메일은 발신전용 메일로 회신되지 않습니다. 서울특별시 강서구 화곡동 1061-39 3층 윙코커뮤니케이션\" title=\"\" />");
		StrTemp.append("</div>");
		StrTemp.append("</body>");
		StrTemp.append("</html>");

		MailMsg = StrTemp.toString();
		
		return MailMsg;
    }
    
    
    /**
     * 임시비밀번호 메일
     * 
     * @param UserId
     * @param PassWord
     * @return
     * @throws Exception
     */
    public static String SetMailBodyMemberPassword(String UserId, String PassWord) throws Exception {
		String MailMsg = "";
		
		StringBuffer StrTemp = new StringBuffer(); //빈버퍼생성
		
		StrTemp.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
		StrTemp.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
		StrTemp.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
		StrTemp.append("<head>");
		StrTemp.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
		StrTemp.append("<title>윙코스토리 임시비밀번호 발송</title>");
		StrTemp.append("</head>");
		StrTemp.append("<body>");
		StrTemp.append("<div style=\"width:750px; margin:0 auto;\">");
		StrTemp.append("<img src=\"http://www.wingkostory.com/resources/img/mail/mail_b01.png\" alt=\"\" title=\"\" /><br/>");
		StrTemp.append("<div style=\"padding:0 20px 20px 20px;\">");
		StrTemp.append("<h1 style=\"color:#333; font-size:24px; font-family:Malgun Gothic, Dotum; font-weight:normal;\">윙코스토리 임시비밀번호를 보내드립니다.</h1>");
		StrTemp.append("<br/>");
		StrTemp.append("<p style=\"font-size:12px; font-family:verdana, Microsoft-yahei,Dotum; color:#333; line-height:18px;\">");
		StrTemp.append("<span style=\"color:#006fb4;\"><strong>"+UserId+"</strong></span>님 임시비밀번호 "+PassWord+" 입니다.<br/>");
		StrTemp.append("접속 후 비밀번호 변경을 해주세요.<br/>");
		StrTemp.append("<a href=\"http://www.wingkostory.com/index.do\" style=\"color:#006fb4; text-decoration:underline\" target=\"_blank\">윙코스토리 바로가기</a>");
		StrTemp.append("</p><br/>");
		StrTemp.append("</div>");
		StrTemp.append("<img src=\"http://www.wingkostory.com/resources/img/mail/mail_02.png\" alt=\"본메일은 발신전용 메일로 회신되지 않습니다. 서울특별시 강서구 화곡동 1061-39 3층 윙코커뮤니케이션\" title=\"\" />");
		StrTemp.append("</div>");
		StrTemp.append("</body>");
		StrTemp.append("</html>");

		MailMsg = StrTemp.toString();
		
		return MailMsg;
    }

}
