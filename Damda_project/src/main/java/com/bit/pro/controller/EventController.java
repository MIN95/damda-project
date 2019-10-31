package com.bit.pro.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Extension.Parameter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.pro.service.EventService;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.EventVo;
import com.bit.pro.vo.PhotoVo;

@Controller
@RequestMapping("/event")
public class EventController {
	
	String dir = "event";
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Resource
	private EventService eventService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String event() {
		
		return dir+"/EventList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<EventVo> eventList(Model model
			,@RequestParam(required=false,value="idx")int page
			,@RequestParam(required=false,value="idx")int range,PhotoVo photoVo) throws SQLException{
		//��ü�Խñۼ�+�����߰�����
		System.out.println("page===>"+page);
	    int listCnt = eventService.selectEventCnt();
	    System.out.println("listCnt====>"+listCnt);
//		List<EventVo> eventlist = eventService.selectEventAll(model);
		//pagination��ü
		pagination pagination = new pagination();
		pagination.pageInfo2(page, range, listCnt);
		model.addAttribute("paginaition", pagination);
		
		List<EventVo> eventlist = eventService.selectEventAll(pagination, photoVo);
		model.addAttribute("eventlist",eventService.selectEventAll(pagination, photoVo));
		System.out.println("�̺�Ʈ ���� ���>>>>>>"+eventService.selectEventAll(pagination, photoVo));
		return eventlist;
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String eventInput() {//����Ʈ->�Է�������
		return dir+"/EventInput";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String eventInsert(MultipartHttpServletRequest multi, EventVo eventVo, PhotoVo photoVo) throws Exception {//�Է�������->����Ʈ
		
		int returnResult = eventService.insertEvent(eventVo, photoVo, multi);
		if(returnResult ==1) {
			System.out.println("�Է¼���");
			return "redirect:/event/";
		}else {
			System.out.println("����>>>>insert ����<<<<");
			return dir+"/EventInput";
		}
	}
	
	@RequestMapping(value="/detail/{idx}",method=RequestMethod.GET)
	public String eventDetail(@PathVariable("idx") int eventnum,Model model,PhotoVo photoVo) {
		List<EventVo> list = eventService.selectEventOne(model, photoVo, eventnum);
		model.addAttribute("eventone", list);
		return dir+"/EventDetail";
	}
	
	@RequestMapping(value="/detail/{idx}",method={RequestMethod.PUT,RequestMethod.POST})
	public String eventUpdate(@PathVariable("idx") int eventnum,Model model, EventVo eventVo, MultipartHttpServletRequest multi, PhotoVo photoVo) throws Exception {
		int result = eventService.updateEvent(eventnum, eventVo, photoVo, multi);
		return "redirect:/event/detail/"+eventnum;
	}
	@Autowired
	ServletContext servletContext;
	@RequestMapping(value="/delete/{idx}",method= RequestMethod.GET)
	public String eventDelete(@PathVariable("idx") int eventnum,PhotoVo photoVo, Model model) throws Exception{
		List<EventVo> list = eventService.selectEventOne(model, photoVo, eventnum);
		String pathbanner = list.get(0).getPhotoName();
		String pathcon = list.get(1).getPhotoName();
		String upload = servletContext.getRealPath("/resources/event/");
		System.out.println(pathcon);
		System.out.println(pathbanner);
		for(int i=0;i<2;i++) {
			if(i==0) {
				File file = new File(upload+pathbanner);
				if(file.exists()) {
					if(file.exists()) {
						if(file.delete()) {
							System.out.println("=========> ��� ���� ����");
						}else {
							System.out.println("=========> ��� ���� ����");
						}
					}else {
						System.out.println("++++++ ��� ������ �����ϴ� ++++++");
					}
				}
			}else if(i==1) {
				File file = new File(upload+pathcon);
				if(file.exists()) {
					//���� ������ ���� ����
					if(file.delete()) {
						System.out.println("=========> ���� ���� ����");
					}else {
						System.out.println("=========> ���� ���� ����");
					}
				}else {
					System.out.println("++++++ ���� ������ �����ϴ� ++++++");
				}
			}			
		}
		int result=eventService.deleteEvent(eventnum);
		int result2= eventService.deleteEventPhoto(eventnum);
		return "redirect:/event/";
	}

}