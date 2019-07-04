<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp" %>
<style>
#about .one-fourth img {
	-moz-box-shadow: 0px 1px 2px #656565;
	-webkit-box-shadow: 0px 1px 2px #656565;
	box-shadow: 0px 1px 2px #656565;
	display: block;
	margin-bottom: 20px;
	height: 160px;
	width: 100%;
}
</style>
<script type="text/javascript">
$(function() {
			if ($('#sliderholder-cycle').length) {
			// timeouts per slide (in seconds) 
			var timeouts = [150,390,25]; 
			function calculateTimeout(currElement, nextElement, opts, isForward) { 
			    var index = opts.currSlide; 
			    return timeouts[index] * 1000;
			}
			jQuery('#sliderholder-cycle').cycle({
				fx: 'fade',
				pager: '.slidernav',
				prev:    '.sliderprev',
        		next:    '.slidernext',
				speed: 1000,
				timeoutFn: calculateTimeout,
				pagerEvent: 'click',
    			pauseOnPagerHover: true,
    			cleartype: 1
});
			jQuery('#sliderholder-cycle').css("display", "block");
			jQuery('.slidernav').css("display", "block");
			
			}
			
			
/* 	$("#enter").click(function(){ */
		$.ajax({
			url : "${root}/contents/enter",
			type : "get",
			dataType : "HTML",
			data : {"key":"keykey"},
			success :function(result){
				console.log("넘어옴");
				$('#main').html(result);
				}
		});
/* 			return;
	}); */
	
/*	$("#enter").click(function(){ */
		$.ajax({
			url : "${root}/contents/enter",
			type : "get",
			dataType : "HTML",
			data : {"key":"keykey"},
			success :function(result){
				console.log("넘어옴");
				$('#main').html(result);
				}
		});
			
			
}); 
</script>
<div id="main">

</div>
<%@ include file = "/template/footer.jsp" %>