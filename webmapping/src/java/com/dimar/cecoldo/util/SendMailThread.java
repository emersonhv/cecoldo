package com.dimar.cecoldo.util;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage.RecipientType;
import org.apache.log4j.Logger;

public class SendMailThread extends Thread {

    public static final String SMTP_HOST = "cenimarc.org";
    public static final String CENIMARC_MAIL_ACCOUNT = "cecoldo@cecoldo.org";
    public static final String MAIL_ADMIN = "jhelbert@cecoldo.org";
    private String from;
    private String to;
    private String copyTo;
    private String textMessage;
    private Properties props;
    private String subject;
    protected static Logger log = Logger.getLogger(SendMailThread.class);

    public SendMailThread(String from, String to, String copyTo, String subject, String textMessage) {
        this.from = from;
        this.to = to;
        this.textMessage = textMessage;
        this.subject = subject;
        this.copyTo = copyTo;
        props = new Properties();
//        props.setProperty("mail.smtp.host", "mail.dimar.mil.co");
        props.setProperty("mail.smtp.host", "localhost");
//        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", "25");
//        props.setProperty("mail.smtp.user", "rortiz@dimar.mil.co");
//        props.setProperty("mail.smtp.auth", "true");
//        props.
    }

    @Override
    public void run() {
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(CENIMARC_MAIL_ACCOUNT));
            message.addRecipient(RecipientType.TO, new InternetAddress(to));
            if(copyTo != null){
                message.addRecipient(RecipientType.CC, new InternetAddress(copyTo));
            }
            message.setSubject(subject);
            message.setDataHandler(new DataHandler(
                    new javax.mail.util.ByteArrayDataSource(textMessage, "text/html")));
            Transport t = session.getTransport("smtp");
//            t.connect("Ruby Ortiz", "17225118");
            t.connect();
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            log.info("Mensaje enviado from:" + CENIMARC_MAIL_ACCOUNT + ",  to:" + to + ",  copyTo:" + copyTo + ",  subject:" + subject);
        } catch (Exception ex) {
            log.error("Error al enviar el correo " + CENIMARC_MAIL_ACCOUNT + ",  to:" + to + ",  copyTo:" + copyTo + ",  subject:" + subject + ",  " + ex.getCause() + ",  " + ex.getMessage(), ex);
        }

    }
}