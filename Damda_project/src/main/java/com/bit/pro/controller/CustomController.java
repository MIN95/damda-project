package com.bit.pro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.CustomService;
import com.bit.pro.service.MateService;
import com.bit.pro.vo.MateVo;

@Controller
@RequestMapping("/custom")
public class CustomController {
   
   String dir = "custom";
   private static final Logger logger = LoggerFactory.getLogger(CustomController.class);
   
   @Resource
   private MateService mateService; 
   @Resource
   private CustomService customService;
   
   //���ε� ���
   @Autowired ServletContext servletContext;
   
   //custom select list
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String eventList(Model model) throws Exception {
      List<MateVo> customSelect = mateService.customSelectThnumb();
      
      model.addAttribute("customSelect", customSelect);
      
      return dir+"/custom";
   }
   
   @RequestMapping(value = "/", method = RequestMethod.POST)
   @ResponseBody
   public String eventListPost(@RequestParam(value="matenum") int matenum,Model model) throws Exception {
      MateVo customDetail = mateService.customSelectDetail(matenum);
      String customPath = customDetail.getPhotoPath();
      Map<String,Object> resultMap = new HashMap<String,Object>();
      resultMap.put("customDetail", customDetail);
      
      return customPath;
   }
   
   @RequestMapping(value = "/savecart", method = RequestMethod.POST)
   public ModelAndView customsave(@RequestParam(value="cstmmatelist") String cstmmatelist,@RequestParam(value="cstmprice") String cstmprice,@RequestParam(value="c_usernum") String c_usernum,HttpSession session,
                        HttpServletRequest request,HttpServletResponse response,@RequestParam(value="img_val") String imgVal) throws SQLException {
      //ȸ���� �ƴ� ��
      String c_nousernum ="";
      //map�� ����
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("cstmmatelist", cstmmatelist);
      map.put("cstmprice", cstmprice);
      //ȸ���϶� �ƴҶ� ���ǰɱ�
      if(session.getAttribute("userNum") != null) {   
         map.put("c_usernum", c_usernum);
      }else {
         c_nousernum = session.getId();
         map.put("c_nousernum", c_nousernum);
      }   
      
      //Ŀ���ҿ� ����
      customService.customsave(map);
      //Ŀ���� PK �޾ƿ���
      int c_customnum = (int) map.get("cstmtnum");
      map.put("c_customnum", c_customnum);
      //īƮ�� ����
      int cartsave = customService.cartsave(map);
      //���强���� �޽��� 
      String savesuccess = "";
      if(cartsave == 1) {
         savesuccess = "��ٱ��Ͽ� ����";
      }
      
      //ĸ�ľ��ε� + db������
      String originalphotoname = capture(imgVal);
      String photopath = "/resources/imgs/custom/" + originalphotoname;
      //map���� ������
      Map<String, Object> capturemap = new HashMap<String, Object>();
      capturemap.put("originalphotoname", originalphotoname);
      capturemap.put("photopath", photopath);
      capturemap.put("photoname", originalphotoname);
      capturemap.put("p_customnum", c_customnum);
      //map���� ������
      customService.cartsaveCapture(capturemap);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("savesuccess",savesuccess);
      mav.setViewName("redirect:/custom/");
      
      return mav;
   }
   
   @RequestMapping(value="/savemyrecipe", method=RequestMethod.POST)
   public ModelAndView myrecipesave(@RequestParam(value="cstmmatelist") String cstmmatelist,@RequestParam(value="cstmprice") String cstmprice,@RequestParam(value="c_usernum") String c_usernum,
                        HttpServletRequest request,HttpServletResponse response,@RequestParam(value="img_val") String imgVal) throws SQLException {
      //map�� ����
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("cstmmatelist", cstmmatelist);
      map.put("cstmprice", cstmprice);
      map.put("c_usernum", c_usernum);
      
      //Ŀ���ҿ� ����
      customService.customsave(map);
      //Ŀ���� PK �޾ƿ���
      int mr_customnum = (int) map.get("cstmtnum");
      map.put("mr_customnum", mr_customnum);
      
      //���̷����ǿ� ����
      int myrecipesave = customService.myrecipesave(map);
      
      //���强���� �޽��� 
      String savesuccess = "";
      if(myrecipesave == 1) {
         savesuccess = "���̷����ǿ� ����";
      }
      
      //ĸ�ľ��ε� + db������
      String originalphotoname = capture(imgVal);
      String photopath = "/resources/imgs/custom/" + originalphotoname;
      //map���� ������
      Map<String, Object> capturemap = new HashMap<String, Object>();
      capturemap.put("originalphotoname", originalphotoname);
      capturemap.put("photopath", photopath);
      capturemap.put("photoname", originalphotoname);
      capturemap.put("p_customnum", mr_customnum);
      //map���� ������
      customService.myrecipesaveCapture(capturemap);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("savesuccess",savesuccess);
      mav.setViewName("redirect:/custom/");
      return mav;
   }
   
   //ĸ��
   public String capture(String imgVal) {
      //���Ͼ��ε� ���
      String upload = servletContext.getRealPath("/resources/imgs/custom/");
      //���������
      String floderPath = servletContext.getRealPath("/resources/imgs/custom");
      File Folder = new File(floderPath);
      //�ش� ���丣 ���� �� ����
      if(!Folder.exists()) {
         try {
            Folder.mkdir();
         }catch(Exception e) {
            e.getStackTrace();
         }
      }
      //���� ���� �̸�
      String originalPhotoName = UUID.randomUUID().toString();
      //���� ���ε� ����
      FileOutputStream fops = null;
      try {
         if(imgVal == null || imgVal == "") {
            throw new Exception();
         }
         imgVal = imgVal.replaceAll("data:image/png;base64,", "");
         byte[] file = Base64.decodeBase64(imgVal);
         
         fops = new FileOutputStream(upload + originalPhotoName + ".png");
         fops.write(file);
         fops.close();
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         try {
            if(fops != null) fops.close();
         } catch (IOException e) {
            e.printStackTrace();
         }
      }
      
      //photo db�� �����ϱ�
      String originalphotoname = originalPhotoName + ".png"; 
      return originalphotoname;
   }
   
   @RequestMapping(value="/custom2", method=RequestMethod.GET)
   public String custom2(Model model) throws Exception {
      List<MateVo> customSelect = mateService.customSelectThnumb();
      
      model.addAttribute("customSelect", customSelect);
      return dir+"/custom2";
   }
   
}