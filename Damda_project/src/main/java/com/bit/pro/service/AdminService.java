package com.bit.pro.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.util.Criteria;
import com.bit.pro.util.PageMaker;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.LoginVo;
import com.bit.pro.vo.OrderListVo;
import com.bit.pro.vo.PhotoVo;

@Transactional
public interface AdminService {
	//insert
	int insertAllitem(AllItemVo allitemVo,PhotoVo photoVo,MultipartHttpServletRequest multi) throws Exception;

	//detail
	Model selectOne(int no, Model model) throws Exception;
	Model selectOne_detailImg(int no, Model model) throws Exception;

	//update
	int itemUpdateSave(ArrayList<String> photoPathList, ArrayList<String> photoNameList, ArrayList<String> photoStatusList, AllItemVo allitemVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception;
	
	//select selectBox value-all,category,best
	//all
	List<AllItemVo> selectProductAll() throws Exception;
	//category
	List<AllItemVo> selectProduct(AllItemVo allitemVo) throws Exception;
	//best
	List<AllItemVo> selectProductBest() throws Exception;
	//delete
	int deleteProduct(List<String> deleteList) throws Exception;
	//for paging on itemList
	int selectAllCnt() throws Exception;

	int selectProductCnt(AllItemVo bean) throws Exception;
	
	List<AllItemVo> selectPagingList(Criteria cri, AllItemVo bean) throws Exception;
	//for paging on usermanage
	List<LoginVo> selectUserList(Criteria cri,LoginVo loginVo) throws Exception;

	PageMaker selectUserBtn(Criteria cri, LoginVo loginVo) throws Exception;
	
	//delete user(one or list)
	int deleteUserList(List<Integer> deleteList) throws Exception;
	/****************************미현 시작**********************************/
	//주문목록 레코드의 갯수 계산
	int countArticle(String deliverstatus) throws Exception;
	//주문목록 리스트 
	List<OrderListVo> orderlistSelect(int nowPage,int scale,String deliverstatus, String ordernum) throws Exception;
	//ajax deliverstatus update
	int changeDeliver(String deliverstatus, String ordernum) throws Exception;
	/****************************미현 시작**********************************/
}
