<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <style type="text/css">
      
    </style>
</head>
<body>
<div id="customTable">
				<table class="table custom">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="all_chk3" />
                                <label for="all_chk3"></label>
                            </th>
                            <th>재료번호</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>판매상태</th>
                            <th>카테고리</th>
                        </tr>
					
                    </thead>
                    <tbody id="matelistajax">
                         <tr id="TotalSelect">
                            <td>
                                <input type="checkbox" id="all_chk4" />
                                <label for="all_chk4"></label>
                            </td>
                            <td colspan="6" class="btn_div" id="btn_div2">
                                <p>전체선택(n/all)</p>
                                <button type="button" class="matedelete_btn btn btn-default">선택상품 삭제</button>
                            </td>
                        </tr>
                   </tbody>
                </table>
              <div class="row col-md-offset-4 col-md-4 col-xs-offset-4 col-xs-4" id="paginationdiv">

			</div>	
  
  
</div>
</body>
 <script type="text/javascript">
	//첫로드값
	$(document).ready(function(){
		$(".MateBox").remove();//리셋
		//라디오 박스
		var salestatus = "";
		var idx=1;	
		//첫로드
		$('.selectall').on('change',function(){
			selected = $('.selectall').val();//custom
			var idx = 1;//리셋 첫 data
			var selectd=$('.selectall').val();
			$('#ra2').remove();
			$('label[for=ra2]').remove();
			if(selected=="custom"){//처음 커스텀클릭했을때
				$("paginationBox").remove();
				 matectg="";
				 matepaging(idx, matectg);
				 matePagingBtn(idx, matectg);
			}
		});	
		
	});
	//버튼클릭
	$(document).on('click', '.page-item .page-link', function(){
		$(".MateBox").remove();
	 	var num = $(this).text();
	 	idx=num;
	 	matepaging(idx, matectg);
	});
	//셀렉트박스리스트
	$('.selectcustom').on('change',function(){//두번째 셀렉트박스
		$(".MateBox").remove();//리셋
		$('.paginationBox').remove();
		 var idx = 1;//리셋 첫 data
		var secondCtg = $('.selectcustom').val();
		if(secondCtg=="all"){
			matectg="";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(secondCtg=="vegetable"){//야채만
			matectg="1";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(secondCtg=="topping"){//토핑만
			matectg="2";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(secondCtg=="source"){//소스만
			matectg="3";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}
	});
	$('.vegetable').on('change',function(){//야채-셀렉트박스
		$(".MateBox").remove();//리셋
		$('.paginationBox').remove();
		var idx = 1;//리셋 첫 data
		var vegeCtg = $('.vegetable').val();
		if(vegeCtg=="all"){
			matectg="1";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(vegeCtg=="veg1"){
			matectg="1-1";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(vegeCtg=="veg2"){
			matectg="1-2";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(vegeCtg=="veg3"){
			matectg="1-3";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(vegeCtg=="veg4"){
			matectg="1-4";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}
	});
	$('.topping').on('change',function(){//토핑-셀렉트박스
		$(".MateBox").remove();//리셋	
		$('.paginationBox').remove();
		var idx = 1;//리셋 첫 data
		var topCtg = $('.topping').val();
		if(topCtg=="all"){
			matectg="2";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(topCtg=="main"){
			matectg="2-1";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(topCtg=="side"){
			matectg="2-2";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}else if(topCtg=="side2"){
			matectg="2-3";
			matepaging(idx, matectg);
			matePagingBtn(idx, matectg);
		}
	});
	
	//라디오박스리스트
	$('#ra1').click(function(){
		$(".MateBox").remove();
		$('.paginationBox').remove();
		matectg="";
		idx=1;
		matepaging(idx, matectg);
		matePagingBtn(idx, matectg);
	});
	$('#ra4').click(function(){
		$(".MateBox").remove();
		$('.paginationBox').remove();
		salestatus=1;
		idx=1;
		matesalepaging(idx, salestatus);
	});
	$('#ra3').click(function(){
		$(".MateBox").remove();
		$('.paginationBox').remove();
		salestatus=0;	
		idx=1;
		matesalepaging(idx, salestatus);
	});	
	
	//체크박스삭제
	$(document).on("click",".matedelete_btn",function(){
		var mateselectBox = [];
		var mateselectnum="";
		$('input[name=chk2]').each(function(){
			var chknum = $(this).prop("checked");
			if(chknum == true){
				mateselectnum = $(this).closest("td").next().children().children().val();
				mateselectBox.push(mateselectnum);
				console.log(mateselectBox);
			}
		}); 
		if(mateselectBox!=""){
			myModal.modal("show").css('top', '35%');
         $("#confirmMessage p").text(mateselectBox.length+"개의 상품을 삭제 하시겠습니까?");
          $("#confirmOk").click(function(){
             myModal.modal("hide");
			$.ajax({
				url:"/admin/custom/delete",
				Type:"POST",
				data : { "mateselectBox" : mateselectBox },
				dataType : "JSON",
				success : function(data){
					console.log("삭제 번호"+mateselectBox);
					$('.MateBox').remove();
					$('.matenum').each(function(){
						if(this.value==""){
							$(this).closest("tr").remove();//칸지우기
						}
					});
				},
				error:function(xhr, status, error){
					alert("지울수 없음");
				}		
			});
			location.reload();//삭제후 새로고침
          });
			$("#confirmCancel").click(function(){
             myModal.modal("hide");
             
         });
		}
	});	
	
	//페이징(셀렉트박스)
	function matepaging(idx, matectg){
		$('.MateBox').remove();
		var values = {};
		$.ajax({
			url:"/admin/custom/ctgP",
			type:"POST",
			dataType:"json",
			async:true,
			data:{ 	"idx" :idx,
					"matectg" : matectg
				},
			success:function(data){
				console.log("성공"+data);
				values = data;
				var temp="";
				var matectg="";
				
			    $.each(values, function(index,matelistCtgP,pagination){
			    	temp='<tr class="MateBox">'+
			    	'<td><input type="checkbox" name="chk2" id="customNum'+(index+1)+'" /><label for="customNum'+(index+1)+'"></label></td>'+
					'<td><a href="detail/'+matelistCtgP.matenum+'">'+
					'<input class="matenum" type="text" name="matenum'+(index+1)+'"id="mateNum'+(index+1)+'" value="'+matelistCtgP.matenum+'" readonly /></a></td>'+
					'<td><a href="detail/'+matelistCtgP.matenum+'"><img id="thImg" src="'+matelistCtgP.photoPath+'" /></a></td>'+
					'<td><a href="detail/'+matelistCtgP.matenum+'"><input type="text" name="mateName'+(index+1)+'" id="mateName'+(index+1)+'" value="'+matelistCtgP.mateName+'" readonly /></a></td>'+
					'<td><p class="customprice'+(index+1)+'">'+matelistCtgP.mateprice+'원</p><input type="text" name="customprice'+(index+1)+'"id="customprice'+(index+1)+'" value="'+matelistCtgP.mateprice+'" readonly hidden/></td>'+
					'<td>';
					if(matelistCtgP.salestatus=="0"){
						temp+='<p class="customstatus'+(index+1)+'">판매중';
					}else if(matelistCtgP.salestatus=="1"){
						temp+='<p style="color:red" class="customstatus'+(index+1)+'">판매중지';
					}
					temp+='</p>'+'<input type="text" name="customstatus'+(index+1)+'"id="customstatus'+(index+1)+'" value="'+matelistCtgP.salestatus+'" readonly hidden/></td><td><p class="customsCtg'+(index+1)+'">';
					if(matelistCtgP.matectg=="1-1"){
						temp+='야채-씁쓸한 맛';
					}else if(matelistCtgP.matectg=="1-2"){
						temp+='야채-아삭한 맛';
					}else if(matelistCtgP.matectg=="1-3"){
						temp+='야채-순한 맛';
					}else if(matelistCtgP.matectg=="1-4"){
						temp+='야채-매운 맛';
					}else if(matelistCtgP.matectg=="2-1"){
						temp+='토핑-고기/햄/생선';
					}else if(matelistCtgP.matectg=="2-2"){
						temp+='토핑-과일/치즈';
					}else if(matelistCtgP.matectg=="2-3"){
						temp+='토핑-견과류';
					}else if(matelistCtgP.matectg=="3"){
						temp+='소스';
					}
					temp+='</p>'+'<input type="text" name="customCtg'+(index+1)+'"id="customCtg'+(index+1)+'" value="'+matelistCtgP.matectg+'" readonly hidden /></td>';
					
					
			    	$('#matelistajax #TotalSelect').before(temp);
					
			    });
			   
				 all_check();
	             price_setting();
	             check_info();
	             ctg_setting();
			}
		});
	 }

	//페이징버튼
	function matePagingBtn(idx, matectg){
		$('.MateBox').remove();
		$('#paginationBox').remove();
		var pagination={};
		var num=1;
 		console.log("버튼");
		$.ajax({
			Type:"GET",
			url:"/admin/custom/ctgP/B",
			data:{"idx" : idx,
					"matectg" : matectg },
			dataType: "JSON",
			success:function(data){
				pagination=data;
				var listCnt = pagination.listCnt;
				var page = pagination.page;
				var pageCnt  = parseInt( pagination.listCnt/pagination.listSize );
				var startPage = (pagination.range -1)*pagination.rangeSize +1;
				var endPage = pagination.range * pagination.rangeSize;
				var startList = (pagination.page -1)*pagination.listSize;
				var prev = pagination.range == 1 ? false : true;
				var next = pagination.endPage > pagination.pageCnt ? false : true;
				if(endPage > pageCnt){
					endPage = pageCnt;
					pagination.next = false;
				}
				var temp="";
				console.log(pageCnt+"/"+startPage+"/"+endPage+"/"+startList+"/"+prev+"/"+next+"/"+page+"/"+listCnt);
				
		    	temp='<div id="paginationBox"><ul class="pagination">';
    			if(prev == true){
					temp+='<li class="page-item"><a class="page-link" href="#" arial-label="Previous">&laquo;</a><input type="text" value="'+(startPage-1)+'" hidden/></li>"';
	   			}
				for( ;startPage<=endPage;startPage++){
				temp+='<li class="page-item num"><a class="page-link" name="'+idx+'name" href="#">'+idx+'</a></li>';
				idx++;
				}
				if(next && endPage >0){
			  		temp+='<li class="page-item"><a class="page-link" href="#" arial-label="Next">&raquo;</a><input type="text" value="'+(endPage)+'" hidden/></li>';
			  	 }
		 		temp+='</ul></div>'

		 		$('#paginationdiv').append(temp);
			}
		});

	}

	//페이징(판매상태)
	function matesalepaging(idx, salestatus){
		var values = {};
		$.ajax({
			url:"/admin/custom/saleP",
			type:"POST",
			dataType:"json",
			async:true,
			data:{ 	"idx" : idx,
					"salestatus" : salestatus
				},
			success:function(data){
				console.log("성공"+data);
				values = data;
				var temp="";
				var salestatus="";
			    $.each(values, function(index,matelistSaleP){
			    	temp='<tr class="MateBox">'+
			    	'<td><input type="checkbox" name="chk2" id="customNum'+(index+1)+'" /><label for="customNum'+(index+1)+'"></label></td>'+
					'<td><a href="detail/'+matelistSaleP.matenum+'">'+
					'<input class="matenum" type="text" name="matenum'+(index+1)+'"id="mateNum'+(index+1)+'" value="'+matelistSaleP.matenum+'" readonly /></a></td>'+
					'<td><a href="detail/'+matelistSaleP.matenum+'"><img id="thImg" src="'+matelistSaleP.photoPath+'" /></a></td>'+
					'<td><a href="detail/'+matelistSaleP.matenum+'"><input type="text" name="mateName'+(index+1)+'" id="mateName'+(index+1)+'" value="'+matelistSaleP.mateName+'" readonly /></a></td>'+
					'<td><p class="customprice'+(index+1)+'">'+matelistSaleP.mateprice+'원</p><input type="text" name="customprice'+(index+1)+'"id="customprice'+(index+1)+'" value="'+matelistSaleP.mateprice+'" readonly hidden/></td>'+
					'<td>';
					if(matelistSaleP.salestatus=="0"){
						temp+='<p class="customstatus'+(index+1)+'">판매중';
					}else if(matelistSaleP.salestatus=="1"){
						temp+='<p style="color:red" class="customstatus'+(index+1)+'">판매중지';
					}
					temp+='</p>'+'<input type="text" name="customstatus'+(index+1)+'"id="customstatus'+(index+1)+'" value="'+matelistSaleP.salestatus+'" readonly hidden/></td><td><p class="customsCtg'+(index+1)+'">';
					if(matelistSaleP.matectg=="1-1"){
						temp+='야채-씁쓸한 맛';
					}else if(matelistSaleP.matectg=="1-2"){
						temp+='야채-아삭한 맛';
					}else if(matelistSaleP.matectg=="1-3"){
						temp+='야채-순한 맛';
					}else if(matelistSaleP.matectg=="1-4"){
						temp+='야채-매운 맛';
					}else if(matelistSaleP.matectg=="2-1"){
						temp+='토핑-고기/햄/생선';
					}else if(matelistSaleP.matectg=="2-2"){
						temp+='토핑-과일/치즈';
					}else if(matelistSaleP.matectg=="2-3"){
						temp+='토핑-견과류';
					}else if(matelistSaleP.matectg=="3"){
						temp+='소스';
					}
					temp+='</p>'+'<input type="text" name="customCtg'+(index+1)+'"id="customCtg'+(index+1)+'" value="'+matelistSaleP.matectg+'" readonly hidden /></td>';

										
			    	$('#matelistajax #TotalSelect').before(temp);
				});
				 all_check();
	             price_setting();
	             check_info();
	             ctg_setting();
			}
				
		});
	 }
	
 </script>
    </script>
</html>