

    <c:forEach var="article" items="${articleList}" varStatus="status" end="20">
    <c:if test="${article.wanna != 1 || status.count % 4 ==0}">
      <div class="one-fourth went" style="margin:0 1% 1% 0; width:24%; height: 300px;"> <a href="#"><img src="${root}/resources/style/images/img_dog/007.jpg" alt="" /></a>
        <h4>${article.title}</h4>
         <p><input type="checkbox"></p>
      </div>
     </c:if>
     </c:forEach>
    