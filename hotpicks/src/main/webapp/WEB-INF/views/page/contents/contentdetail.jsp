<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp"%>
<script>
$(document).ready(function() {
	$("#pick").click(function () {
		var result = confirm("가고싶은곳 확인) , 다녀온곳 취소)");
		if(result){
			alert("가고싶은곳에 등록되었습니다.");
		}else{
			alert("다녀온곳에 등록되었습니다.")
		}
		
	});
	
	//리뷰작성
	getWriteList();
	
	function getWriteList() {
		$.ajax({
			url : '${root}/review/list',
			type : 'GET',
			dataType : 'json',
			data : {contentsId : '630609'},
			success : function(response){
				makeWriteList(response);
			}
		});
	}
	
	$("#writeBtn").click(function() {
		 //var writeForm = $("#writeForm").serialize();

		if ('${userInfo == null}' == 'true'){
			alert("로그인하세요.");
			
		} else if($("#subject").val() == "") {
			alert("제목 입력!!!");
			return;
		} else if($("#content").val() == "") {
			alert("내용 입력!!!");
			return;
		} else {
			$("#writeForm").attr("action","${root}/review/write").submit();
			/* $.ajax({
				url : '${root}/review/write',
				type : 'POST',
				
				dataType : 'json',
				data : writeForm,
				success : function(response) {
					makeWriteList(response);
					$("#subject").val('');
					$("#hashtag").val('');
					$("#picture").val('');
					$("#content").val('');
				}
			}); */
		}
	});
	
	function makeWriteList(reviews) {
		var reviewcnt = reviews.reviewlist.length;
		console.log(reviews);
		var reviewstr = '';
		for(var i=0; i<reviewcnt; i++) {
			var review = reviews.reviewlist[i];
			console.log("1 : " + review);
			reviewstr += '<li class="clearfix">';
			reviewstr += '<div class="toggle">';
			reviewstr += '	<div class="trigger">';
			reviewstr += '		<div class="user">';
			reviewstr += '			<img src="${root}/resources/style/images/art/blog-th1.jpg" class="avatar" /> ';
			reviewstr += '		</div>';
			reviewstr += '		<div class="message">';
			reviewstr += '			<div class="info">';
			reviewstr += '				<h3><a>'+review.subject+'</a></h3>';
			reviewstr += '				<span class="date">  - '+review.date+'</span>';
			reviewstr += '			</div>';
			reviewstr += '			<p>';
			for(var j=0; j<review.starPoint; j++) {
				★	
			}
			reviewstr += '			</p>';
			reviewstr += '			<p>'+review.hashTag+'</p>';
			reviewstr += '		</div>';
			reviewstr += '	</div>';
			reviewstr += '	<div class="togglebox">';
			reviewstr += '		<div>'+review.content+'</div>';
			reviewstr += '		<div>';
			reviewstr += '			<textarea id="mcontent" cols="68" rows="5"></textarea>';
			reviewstr += '			<input type="button" id="memoBtn" value="글작성">';
			reviewstr += '		</div>';
			reviewstr += '	</div>';
			reviewstr += '</div>';
			reviewstr += '</li>';
		}
		$("#singlecomments").empty();
		$("#singlecomments").append(reviewstr);
	}
	
});
</script>
<style>
.detailimg {
	width: 600px;
	height: 300px;
}


.writeReview {
	float: right;
	font-size: 15px;
	margin-bottom: 10px;
}
li.clearfix {
	padding: 10px !important;
	margin: 0px !important;
}
.message{
	padding-top: 10px !important;
}
.avatar{
	height: 60px;
	width: 90px;
}
.commReply{
	float: right;
	margin-right: 30px;
}
.togglebox{
	width: 620px !important;
}
#commenth3{
	margin-bottom: 50px !important;
}
</style>
<script type="text/javascript">
	$(function() {
		$("label").inFieldLabels();
	});
</script>

<!-- Begin Wrapper -->
<div id="wrapper">
	<div id="post-wrapper">
	<!-- Begin 상세정보 -->
		<div class="post">
			<div style="float: left;">
				<h1 class="title" style="margin-top: 20px;">부산 다함께 축제</h1>
			</div>
			<div style="float: right;">
				<img id="pick" src="${root}/resources/style/images/heart64.png">
			</div>
			<div style="clear: both;"></div>
			<div class="meta">
				<div class="top-border"></div>
				<span class="contentsType">축제</span> | <span class="picksCount">54</span>
				Picks | <span class="reviewCount">4</span> Reviews
			</div>
			<img class="detailimg"
				src="${root}/resources/style/images/sample/p1.jpg"
				alt="장소 제목!!!(부산 감천 문화마을)" />
			<div class="detail">
				<div class="date">
					기간 | <span class="startD">2019.06.14</span> ~ <span class="endD">2019.08.20</span>
				</div>
				<div class="address">
					장소 | <span>부산 사하구 감내2로 203 감천문화마을안내센터</span>
				</div>
				<div class="contents">
					내용 | <span>부산 감천문화 마을에서 펼처지는 재밋는 놀이</span>
				</div>
				<p></p>
			</div>
			<div class="top-border"></div>
			<div class="tags">
				Tags: <a href="#" title="">축제</a>, <a href="#" title="">부산</a>, <a
					href="#" title="">감천문화마을</a>
			</div>
		</div>
	<!-- End 상세정보 -->
	
		<!-- Begin 후기 -->
		<div id="comment-wrapper">
			<h3 id="commenth3">
				<span class="reviewCount">4</span> Reviews to "<span>부산 다함께
					축제</span>"
				<!-- Begin 후기 작성 -->	
				<div class="toggle">
					<div class="trigger"><button class="writeReview">리뷰 작성</button></div>
					<div class="togglebox">
          				<div>
          				<form id="writeForm" name="writeForm" method="post" action="" enctype="multipart/form-data">
          					<input type="hidden" name="rseq" value="1">
          					<input type="hidden" name="pg" value="1">
          					<input type="hidden" name="key" value="">
          					<input type="hidden" name="word" value="">
          					<div class="reviewInput">
          						<div>리뷰 작성</div>
          						<label style="font-size:15px;">제목</label>
          						<input type="text" name="subject" id="subject"><br>
          					
  								<label style="font-size:15px;">별점</label>
  								<select class="form-control" id="sel1" name="starPoint">
    								<option value="5">★★★★★</option>
    								<option value="4">★★★★</option>
    								<option value="3">★★★</option>
    								<option value="2">★★</option>
    								<option value="1">★</option>
  								</select>		
          						<br>
          						<label style="font-size:15px;">해쉬태그</label>
          						<input type="text" name="hashTag" id="hashtag"><br>
								<label style="font-size:15px;">사진 올리기</label>
								<input type="file" name="picture" id="picture"><br>
								<label style="font-size:15px;">내용</label><br>
								<textarea name="content" id="content" class="reviewcontents" cols="67" rows="25" ></textarea>
          					</div>
          				</form>
						<input id="cancelBtn" class="cancelBtn" type="button"
						name="cancel" value="취소" style="float:right; margin-left:10px;"/>
          				<input id="writeBtn" class="writeBtn" type="button"
						name="write" value="등록" style="float:right;"/>
						<div class="clear"></div>
          				</div>
        			</div>
				</div>
				<!-- End 후기 작성 -->
			</h3>
			
			<!-- Begin 후기 리스트 -->	
			<div id="comments">
				<ol id="singlecomments" class="commentlist">
					<%-- <li class="clearfix">
						<div class="toggle">
							<div class="trigger">
							<div class="user">
								<img src="${root}/resources/style/images/art/blog-th1.jpg" class="avatar" /> 
							</div>
							<div class="message">
								<div class="info">
									<h3><a>부산축제 완전추천!!</a></h3>
									<span class="date">  - 2019.07.11</span>
								</div>
								<p>★★★★★</p>
								<p>#부산 #여행 #나홀로 #축제 #부산축제</p>
							</div>
							</div>
							<div class="togglebox">
								<div>
								fffffff
								fdf
								fd
								fdfddfffffffffffffffffdk;fkjd;kajf;akljf;lkjfl
								fdlkajd;kladjf;lkjd;flkjd;lfakj;;;;;;;;;kjfk;jdak
								fdkjf;lakjdf;kljda;kldjf;kjdffdfddfffffffffffffffffdk;fkjd;kajf;akljf;lkjfl
								fdlkajd;kladjf;lkjd;flkjd;lfakj;;;;;;;;;kjfk;jdak
								fdkjf;lakjdf;kljda;kldjf;kjdffdfddfffffffffffffffffdk;fkjd;kajf;akljf;lkjfl
								fdlkajd;kladjf;lkjd;flkjd;lfakj;;;;;;;;;kjfk;jdak
								fdkjf;lakjdf;kljda;kldjf;kjdf
								</div>
								<div>
									<textarea id="mcontent" cols="68" rows="5"></textarea>
									<input type="button" id="memoBtn" value="글작성">
								</div>
							</div>
						</div>
					</li> --%>
				</ol>
			</div>
			<!-- End 후기 리스트 -->	

		</div>
	<!-- End 후기 -->
	</div>
	
	<!-- 사이드 바 -->
	<div id="sidebar">
		<div class="sidebox">
			<h3>다른 사진들</h3>
			<ul class="flickr">
				<li><a href="#"><img
						src="${root}/resources/style/images/art/flickr-1.jpg" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/flickr-2.jpg" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/flickr-3.jpg" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/flickr-4.jpg" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/flickr-5.jpg" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/flickr-6.jpg" alt="" /></a></li>
			</ul>
		</div>
		<div class="sidebox">
			<h3>지도</h3>
			<div style="height: 260px; background-color: lightgray;"></div>
		</div>
		<div class="sidebox">
			<h3>Hash Tags</h3>
			<ul class="tags">
				<li><a href="#" title="">축제</a></li>
				<li><a href="#" title="">핫픽</a></li>
				<li><a href="#" title="">부산</a></li>
				<li><a href="#" title="">감천문화마을</a></li>
				<li><a href="#" title="">부산축제</a></li>
				<li><a href="#" title="">핫픽스</a></li>
				<li><a href="#" title="">Fun</a></li>
				<li><a href="#" title="">Travel</a></li>
				<li><a href="#" title="">Inspiration</a></li>
			</ul>
		</div>
		<div class="sidebox">
			<h3>예매정보</h3>
			<ul class="post-list archive">
				<li><a href="#" title="">March 2011 (11)</a></li>
				<li><a href="#" title="">February 2011 (9)</a></li>
				<li><a href="#" title="">January 2011 (5)</a></li>
			</ul>
		</div>

		<div class="sidebox">
			<h3>Sponsors</h3>
			<ul class="ads">
				<li><a href="#"><img
						src="${root}/resources/style/images/art/ad-1.gif" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/ad-2.gif" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/ad-3.gif" alt="" /></a></li>
				<li><a href="#"><img
						src="${root}/resources/style/images/art/ad-4.gif" alt="" /></a></li>
			</ul>
		</div>
	</div>
	<!-- 사이드 바 -->
</div>
<!-- End Wrapper -->

<%@ include file = "/WEB-INF/views/page/template/footer.jsp"%>