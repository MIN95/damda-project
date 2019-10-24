package com.bit.pro.util;

import com.bit.pro.vo.MailVo;
import com.bit.pro.vo.QnaVo;

public class MailConfigUtil {
	public static MailVo mailConfig(MailVo mailVo,QnaVo qnaVo) {
		
		String qnaDate = qnaVo.getQnaDate();
		System.out.println("qnaDate--->"+qnaDate);
		String mailContent ="";
		mailContent ="<p><h2>안녕하세요 담다:)입니다</h2></p>"
					+"<p>고객님께서"+qnaDate+"에 문의하신 내용에 답변이 등록되었습니다.</p>"
					+"<p>답변을 확인하여 주세요.</p>";
					
		
		mailVo.setMailFrom("rudals10008@gmail.com");
        mailVo.setMailTo(qnaVo.getM_userEmail());
		mailVo.setMailSubject("안녕하세요 담다:)입니다");
		mailVo.setMailContent(mailContent);
		
		return mailVo;
	}

}
