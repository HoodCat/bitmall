<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>쇼핑몰 관리자 홈페이지</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.servletContext.contextPath }/assets/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
        $("select[name='status'] option[value='${status}']").attr("selected", "");
        $("select[name='icon'] option[value='${icon}']").attr("selected", "");
        $("select[name='category'] option[value='${category}']").attr("selected", "");
        $("select[name='search'] option[value='${search}']").attr("selected", "");
        
        /* 페이지 번호 css 적용 */
        $("font[data-pageNo=${curPage}]").css({
           "color":"#FC0504",
           "font-weight":"bold"
        });
    });
    </script>
  </head>
  
  <body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <div align="center">
      <br>
      <jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
      <hr width='900' size='3'>
      <form name="form1" method="get" action="product">
        <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr height="40">
            <td align="left" width="150" valign="bottom">&nbsp 제품수 : 
              <font color="#FF0000">${goodsTotCnt}</font>
            </td>
            
            <td align="right" width="550" valign="bottom">
              <select name="status">
                <option value="0">상품상태</option>
                <c:forEach items="${statusList}" var="s">
                  <option value="${s.no}">${s.name}</option>
                </c:forEach>
              </select> &nbsp 
              
              <select name="icon">
                <option value="0">아이콘선택</option>
                <c:forEach items="${iconList}" var="i">
                  <option value="${i.no}">${i.name}</option>
                </c:forEach>
              </select> &nbsp 
              
              <select name="category">
                <option value="0">분류선택</option>
                <c:forEach items="${categoryList}" var="c">
                  <option value="${c.no}">${c.name}</option>            
                </c:forEach>
              </select> &nbsp 
              
              <select name="search">
                <option value="1" selected>제품이름</option>
                <option value="2">제품번호</option>
              </select> 
              
              <input type="text" name="keyword" size="10" value="">&nbsp
            </td>
            
            <td align="left" width="120" valign="bottom">
              <input type="submit" value="검색"> &nbsp; 
              <a href="product/new">
                <input type="button" value="새상품">
              </a>
            </td>
          </tr>
          
          <tr><td height="5"></td></tr>
        </table>
      </form>
    
      <table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
        <tr bgcolor="#CCCCCC" height="23">
          <td width="100" align="center">제품분류</td>
          <td width="100" align="center">제품코드</td>
          <td width="280" align="center">제품명</td>
          <td width="70" align="center">판매가</td>
          <td width="50" align="center">상태</td>
          <td width="120" align="center">이벤트</td>
          <td width="80" align="center">수정/삭제</td>
        </tr>
        
        <c:forEach items="${goodsList}" var="goods">
          <tr bgcolor="#F2F2F2" height="23">
            <td width="100">&nbsp ${goods.cname}</td>
            <td width="100">&nbsp ${goods.code}</td>
            <td width="280">&nbsp ${goods.gname }</td>
            <td width="70" align="right">${goods.price} &nbsp</td>
            <td width="50" align="center">${goods.sname}</td>
            <td width="120" align="center">&nbsp ${goods.iconStr}
              <c:if test="not empty ${goods.rateSale}">
                (${goods.rateSale}%)
              </c:if>
            </td>
            <td width="80" align="center">
              <a href="product/edit/${goods.no}">수정</a>/
              <a href="#">삭제</a>
            </td>
          </tr>
        </c:forEach>
      </table>
    
      <br>
      
      <table width="800" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="cmfont" align="center">
            <!-- 이전 페이지 -->
            <c:if test="${curPage != 1}">
              <a href="product?page=${curPage-1}&status=${status}&icon=${icon}&category=${category}&search=${search}&keyword=${keyword}">
                <img src="${pageContext.servletContext.contextPath}/assets/images/admin/i_prev.gif" align="absmiddle" border="0">
              </a>
            </c:if>
            
            <!-- 페이지 번호 -->
            <c:forEach begin="1" end="${lastPage}" var="page">
              <a href="product?page=${page}&status=${status}&icon=${icon}&category=${category}&search=${search}&keyword=${keyword}">
                <font data-pageNo="${page}" color="#7C7A77">[${page}]</font>
              </a>&nbsp;
            </c:forEach>
            
            <!-- 다음 페이지 -->
            <c:if test="${(curPage != lastPage) and (lastPage gt 0)}">
              <a href="product?page=${curPage+1}&status=${status}&icon=${icon}&category=${category}&search=${search}&keyword=${keyword}">
                <img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
              </a>
            </c:if>
          </td>
        </tr>
      </table>
    </div>
  </body>
</html>