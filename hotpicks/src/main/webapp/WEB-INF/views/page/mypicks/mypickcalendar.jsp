<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/page/template/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- icon 사용 위함 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href='${root}/resources/packages/core/main.css' rel='stylesheet' />
<link href='${root}/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='${root}/resources/packages/timegrid/main.css' rel='stylesheet' />
<script src='${root}/resources/packages/core/main.js'></script>
<script src='${root}/resources/packages/interaction/main.js'></script>
<script src='${root}/resources/packages/daygrid/main.js'></script>
<script src='${root}/resources/packages/timegrid/main.js'></script>
<script>

	var eventList = [];
	
	<c:forEach var="article" items="${articleCal}">
		var events = {};
		events.title = "${article.title}";
		events.start = "${article.eventStartDate}";
		events.end = "${article.eventEndDate}";
		
		eventList.push(events);

	</c:forEach>

	console.log(eventList);
	   
	   
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      defaultDate: '2019-06-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      editable: true,
      eventLimit: true,
      

      events: eventList
      
    });

    calendar.render();
  });

</script>
<div id="wrapper"> 
<div class="content">
<div align="center" style="margin-bottom: 30px;">
	<div style="margin-bottom: 20px; font-size: 25px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">
		<a href="">전체	|</a>
		<a>공연	|</a>
		<a>전시	|</a>
		<a>행사</a>
	</div>
	<div>
			<a href="${root}/mypicklist/enter"><i class="fas fa-list" style="font-size: 4em;"></i></a>
				<img src="${root}/resources/style/images/blank.png">
				<a href="${root}/mypickmap/mvmypickmap"><i class="fas fa-map-marked-alt" style="font-size: 4em;"></i></a>
				<img src="${root}/resources/style/images/blank.png">
				<a href="${root}/mypicklist/cal"><i class="fas fa-calendar-alt" style="font-size: 4em;"></i></a>
		</div>
</div>


  <div id='calendar' style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif; font-size: 15px; max-width: 900px; margin: 0 auto;"></div>
  </div>
</div>
<%@ include file = "/WEB-INF/views/page/template/footer.jsp" %>
