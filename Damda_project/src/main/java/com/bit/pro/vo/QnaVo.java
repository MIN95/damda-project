package com.bit.pro.vo;

import java.sql.Date;

public class QnaVo {
   
   private int qnaNum;
   private String m_userEmail;
   private String m_userId;
   private int m_userNum;
   private String qnaSub;
   private String qnaKind;
   private String qnaPw;
   private String qnaCon;
   private String answerCon;
   private String answerStatus;
   private String qnaDate;
   private int answerNotice;
   private int qnaStyle;
   
   private int ROWNUM;
   
   //∆‰¿Ã¬°
   private int p;
   private int startpoint;
   private int row;
      
   //where ±‚¡ÿ
   private String itemalign;
   public QnaVo() {
   }
   public QnaVo(int qnaNum, String m_userEmail, String m_userId, int m_userNum, String qnaSub, String qnaKind,
         String qnaPw, String qnaCon, String answerCon, String answerStatus, String qnaDate, int answerNotice,
         int qnaStyle, int rOWNUM, int p, int startpoint, int row, String itemalign) {
      super();
      this.qnaNum = qnaNum;
      this.m_userEmail = m_userEmail;
      this.m_userId = m_userId;
      this.m_userNum = m_userNum;
      this.qnaSub = qnaSub;
      this.qnaKind = qnaKind;
      this.qnaPw = qnaPw;
      this.qnaCon = qnaCon;
      this.answerCon = answerCon;
      this.answerStatus = answerStatus;
      this.qnaDate = qnaDate;
      this.answerNotice = answerNotice;
      this.qnaStyle = qnaStyle;
      ROWNUM = rOWNUM;
      this.p = p;
      this.startpoint = startpoint;
      this.row = row;
      this.itemalign = itemalign;
   }
   public int getQnaNum() {
      return qnaNum;
   }
   public void setQnaNum(int qnaNum) {
      this.qnaNum = qnaNum;
   }
   public String getM_userEmail() {
      return m_userEmail;
   }
   public void setM_userEmail(String m_userEmail) {
      this.m_userEmail = m_userEmail;
   }
   public String getM_userId() {
      return m_userId;
   }
   public void setM_userId(String m_userId) {
      this.m_userId = m_userId;
   }
   public int getM_userNum() {
      return m_userNum;
   }
   public void setM_userNum(int m_userNum) {
      this.m_userNum = m_userNum;
   }
   public String getQnaSub() {
      return qnaSub;
   }
   public void setQnaSub(String qnaSub) {
      this.qnaSub = qnaSub;
   }
   public String getQnaKind() {
      return qnaKind;
   }
   public void setQnaKind(String qnaKind) {
      this.qnaKind = qnaKind;
   }
   public String getQnaPw() {
      return qnaPw;
   }
   public void setQnaPw(String qnaPw) {
      this.qnaPw = qnaPw;
   }
   public String getQnaCon() {
      return qnaCon;
   }
   public void setQnaCon(String qnaCon) {
      this.qnaCon = qnaCon;
   }
   public String getAnswerCon() {
      return answerCon;
   }
   public void setAnswerCon(String answerCon) {
      this.answerCon = answerCon;
   }
   public String getAnswerStatus() {
      return answerStatus;
   }
   public void setAnswerStatus(String answerStatus) {
      this.answerStatus = answerStatus;
   }
   public String getQnaDate() {
      return qnaDate;
   }
   public void setQnaDate(String qnaDate) {
      this.qnaDate = qnaDate;
   }
   public int getAnswerNotice() {
      return answerNotice;
   }
   public void setAnswerNotice(int answerNotice) {
      this.answerNotice = answerNotice;
   }
   public int getQnaStyle() {
      return qnaStyle;
   }
   public void setQnaStyle(int qnaStyle) {
      this.qnaStyle = qnaStyle;
   }
   public int getROWNUM() {
      return ROWNUM;
   }
   public void setROWNUM(int rOWNUM) {
      ROWNUM = rOWNUM;
   }
   public int getP() {
      return p;
   }
   public void setP(int p) {
      this.p = p;
   }
   public int getStartpoint() {
      return startpoint;
   }
   public void setStartpoint(int startpoint) {
      this.startpoint = startpoint;
   }
   public int getRow() {
      return row;
   }
   public void setRow(int row) {
      this.row = row;
   }
   public String getItemalign() {
      return itemalign;
   }
   public void setItemalign(String itemalign) {
      this.itemalign = itemalign;
   }
   @Override
   public String toString() {
      return "QnaVo [qnaNum=" + qnaNum + ", m_userEmail=" + m_userEmail + ", m_userId=" + m_userId + ", m_userNum="
            + m_userNum + ", qnaSub=" + qnaSub + ", qnaKind=" + qnaKind + ", qnaPw=" + qnaPw + ", qnaCon=" + qnaCon
            + ", answerCon=" + answerCon + ", answerStatus=" + answerStatus + ", qnaDate=" + qnaDate
            + ", answerNotice=" + answerNotice + ", qnaStyle=" + qnaStyle + ", ROWNUM=" + ROWNUM + ", p=" + p
            + ", startpoint=" + startpoint + ", row=" + row + ", itemalign=" + itemalign + "]";
   }
   
}