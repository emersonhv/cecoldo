package com.dimar.cecoldo.util;



import org.apache.log4j.Logger;


public class MailService {
  protected static Logger log = Logger.getLogger(MailService.class.getName());
    private static MailService instance;
  private MailService() {
  }
  public static MailService getInstance(){
    if(instance==null){
      instance = new MailService();
    }
    return instance;
  }

    public void sendMessageToUser(String email, String copyTo, String subject, String mensaje){

    try {
        

      SendMailThread mailThread = new SendMailThread (SendMailThread.CENIMARC_MAIL_ACCOUNT, 
              email, copyTo, subject, mensaje);
              
              
      mailThread.start();
    }
    catch (Exception ex) {
      log.error("Error ", ex);
    }
  }


}