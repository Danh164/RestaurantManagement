package com.ou.utils;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

public class SendMailUtil {
    public static void SendMail(String toEmail, int numberRandom, String vocative)throws MessagingException, UnsupportedEncodingException{
        final String fromEmail = "restaurantou@gmail.com";
        final String password = "12345678aA";
        final String subject = "Nhà hàng Thành Văn";
        final String body = numberRandom + " là mã xác nhận của "+ vocative + 
                "! Vui lòng không cung cấp mật mã này cho bất kì ai trong bất kì trường hợp nào.";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        //set message headers
        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.addHeader("format", "flowed");
        msg.addHeader("Content-Transfer-Encoding", "8bit");
        msg.setFrom(new InternetAddress(fromEmail, "THANH VAN"));
        msg.setReplyTo(InternetAddress.parse(fromEmail, false));
        msg.setSubject(subject, "UTF-8");
        msg.setText(body, "UTF-8");
        msg.setSentDate(new Date());
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        Transport.send(msg);
    }
}
