package com.bit.pro.util;

import com.bit.pro.vo.MailVo;
import com.bit.pro.vo.QnaVo;

public class MailConfigUtil {
	public static MailVo mailConfig(MailVo mailVo,QnaVo qnaVo) {
		
		String qnaDate = qnaVo.getQnaDate();
		System.out.println("qnaDate--->"+qnaDate);
		String mailContent ="";
		mailContent ="<p><h2>�ȳ��ϼ��� ���:)�Դϴ�</h2></p>"
					+"<p>���Բ���"+qnaDate+"�� �����Ͻ� ���뿡 �亯�� ��ϵǾ����ϴ�.</p>"
					+"<p>�亯�� Ȯ���Ͽ� �ּ���.</p>";
					
		
		mailVo.setMailFrom("rudals10008@gmail.com");
        mailVo.setMailTo(qnaVo.getM_userEmail());
		mailVo.setMailSubject("�ȳ��ϼ��� ���:)�Դϴ�");
		mailVo.setMailContent(mailContent);
		
		return mailVo;
	}

}
