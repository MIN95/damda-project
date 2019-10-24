package com.bit.pro.vo;

import java.util.Date;

public class MailVo {

	    private String mailFrom;
	 
	    private String mailTo;
	 
	    private String mailCc;
	 
	    private String mailBcc;
	 
	    private String mailSubject;
	 
	    private String mailContent;
	 
	    private String contentType;
	    
	    public MailVo() {
	        contentType = "html";
	    }
	    
	 
	    public MailVo(String mailFrom, String mailTo, String mailCc, String mailBcc, String mailSubject,
				String mailContent, String contentType) {
			super();
			this.mailFrom = mailFrom;
			this.mailTo = mailTo;
			this.mailCc = mailCc;
			this.mailBcc = mailBcc;
			this.mailSubject = mailSubject;
			this.mailContent = mailContent;
			this.contentType = contentType;
		}


		public String getContentType() {
	        return contentType;
	    }
	 
	    public void setContentType(String contentType) {
	        this.contentType = contentType;
	    }
	 
	    public String getMailBcc() {
	        return mailBcc;
	    }
	 
	    public void setMailBcc(String mailBcc) {
	        this.mailBcc = mailBcc;
	    }
	 
	    public String getMailCc() {
	        return mailCc;
	    }
	 
	    public void setMailCc(String mailCc) {
	        this.mailCc = mailCc;
	    }
	 
	    public String getMailFrom() {
	        return mailFrom;
	    }
	 
	    public void setMailFrom(String mailFrom) {
	        this.mailFrom = mailFrom;
	    }
	 
	    public String getMailSubject() {
	        return mailSubject;
	    }
	 
	    public void setMailSubject(String mailSubject) {
	        this.mailSubject = mailSubject;
	    }
	 
	    public String getMailTo() {
	        return mailTo;
	    }
	 
	    public void setMailTo(String mailTo) {
	        this.mailTo = mailTo;
	    }
	 
	    public Date getMailSendDate() {
	        return new Date();
	    }
	 
	    public String getMailContent() {
	        return mailContent;
	    }
	 
	    public void setMailContent(String mailContent) {
	        this.mailContent = mailContent;
	    }


		@Override
		public String toString() {
			return "MailVo [mailFrom=" + mailFrom + ", mailTo=" + mailTo + ", mailCc=" + mailCc + ", mailBcc=" + mailBcc
					+ ", mailSubject=" + mailSubject + ", mailContent=" + mailContent + ", contentType=" + contentType
					+ "]";
		}
	 
	}
