<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
  <title>비트닷컴 쇼핑몰</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <link href="${pageContext.servletContext.contextPath}/assets/css/font.css" rel="stylesheet" type="text/css">
  <script src="${pageContext.servletContext.contextPath}/assets/jquery/jquery-1.9.0.js" type="text/javascript"></script>
  <script type="text/javascript">
  /* 페이지 번호 css 적용 */
  $(function(){
    $("font[data-pageNo=${curPage}]").css({
       "color":"#FC0504",
       "font-weight":"bold"
    });
  });
  </script>
  </head>
  
  <body style="margin: 0">
    <jsp:include page="/WEB-INF/views/include/head.jsp" />
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
    <table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr>
        <td height="100%" valign="top">
          <jsp:include page="/WEB-INF/views/include/navigation.jsp" />
        </td>
        <td width="10"></td>
        <td valign="top">
          <!-------------------------------------------------------------------------------------------->
          <!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
          <!-------------------------------------------------------------------------------------------->
  
          <!-- 하위 상품목록 --> <!-- form2 시작 -->
          <form name="form2" method="post" action="product.jsp">
            <input type="hidden" name="menu" value="1">
  
            <table border="0" cellpadding="0" cellspacing="5" width="767" class="cmfont" bgcolor="#efefef">
              <tr>
                <td bgcolor="white" align="center">
                  <table border="0" cellpadding="0" cellspacing="0" width="751" class="cmfont">
                    <tr>
                      <td align="center" valign="middle">
                        <table border="0" cellpadding="0" cellspacing="0" width="730" height="40" class="cmfont">
                          <tr>
                            <td width="500" class="cmfont">
                              <font color="#C83762" class="cmfont">
                                <c:forEach items="${categoryList}" var="c">
                                  <c:if test="${c.no == category}">
                                    <b>${c.name}&nbsp</b>
                                  </c:if>
                                </c:forEach>
                              </font>&nbsp</td>
                            <td align="right" width="274">
                              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
                                <tr>
                                  <td align="right">
                                    <font color="EF3F25"><b>${goodsTotCnt}</b></font> 개의상품.&nbsp;&nbsp;&nbsp
                                  </td>
                                  
                                  <td width="100">
                                    <select name="sort" size="1" class="cmfont" onChange="form2.submit()">
                                      <option value="new" selected>신상품순 정렬</option>
                                      <option value="up">고가격순 정렬</option>
                                      <option value="down">저가격순 정렬</option>
                                      <option value="name">상품명 정렬</option>
                                    </select>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </form> <!-- form2 -->
  
          <table border="0" cellpadding="0" cellspacing="0">
            <!--- 1 번째 줄 -->
            <c:forEach items="${goodsList}" var="goods" varStatus="status">
              <c:if test="${status.index%5==0}">
                <tr>
              </c:if>
              <td width="150" height="205" align="center" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
                  <tr>
                    <td align="center">
                      <c:choose>
                        <c:when test="${not empty goods.gImg}">
                          <a href="${pageContext.servletContext.contextPath}/product/detail/${goods.no}">
                            <img src="${pageContext.servletContext.contextPath}${goods.gImg}" width="120" height="140" border="0">
                          </a>
                        </c:when>
                      <c:otherwise>
                          <a href="${pageContext.servletContext.contextPath}/product/detail/${goods.no}">
                            <img src="${pageContext.servletContext.contextPath}/assets/images/product/0000_s.jpg" width="120" height="140" border="0">
                          </a>
                      </c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                  
                  <tr><td height="5"></td></tr>
                  
                  <tr>
                    <td height="20" align="center">
                      <a href="product/detail/${goods.no}">
                        <font color="444444">${goods.gname}</font>
                      </a>&nbsp;
                      <c:set var="icons" value="${fn:split(goods.iconStr,',')}" />
                      <c:forEach items="${icons}" var="icon">
                        <c:choose>
                          <c:when test="${icon == 'New'}">
                            <img src="${pageContext.servletContext.contextPath}/assets/images/i_new.gif" align="absmiddle" vspace="1" alt="New">
                          </c:when>
                          <c:when test="${icon == 'Hit'}">
                            <img src="${pageContext.servletContext.contextPath}/assets/images/i_hit.gif" align="absmiddle" vspace="1" alt="Hit">
                          </c:when>
                          <c:when test="${icon == 'Sale'}">
                            <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1" alt="Sale">
                            <font color="red">${goods.rateSale}%</font>
                          </c:when>
                        </c:choose>
                      </c:forEach>
                    </td>
                  </tr>
                  
                  <tr>
                    <td height="20" align="center">
                      <b><fmt:formatNumber value="${goods.price}" type="number"/> 원</b></td>
                    </td>
                  </tr>
                </table>
              </td>
              <c:if test="${status.index%5==4}">
                </tr>
                <tr>
                  <td height="10"></td>
                </tr>
              </c:if>
            </c:forEach>
          </table>
  
          <table border="0" cellpadding="0" cellspacing="0" width="690">
            <tr>
              <td height="40" class="cmfont" align="center">
                <!-- 이전 페이지 -->
                <c:if test="${curPage != 1}">
                  <a href="${pageContext.servletContext.contextPath}/product/${category}?page=${curPage-1}">
                    <img src="${pageContext.servletContext.contextPath}/assets/images/admin/i_prev.gif" align="absmiddle" border="0">
                  </a>
                </c:if>
                
                <!-- 페이지 번호 -->
                <c:forEach begin="1" end="${lastPage}" var="page">
                  <a href="${pageContext.servletContext.contextPath}/product/${category}?page=${page}">
                    <font data-pageNo="${page}" color="#7C7A77">[${page}]</font>
                  </a>&nbsp;
                </c:forEach>
                
                <!-- 다음 페이지 -->
                <c:if test="${(curPage != lastPage) and (lastPage gt 0)}">
                  <a href="${pageContext.servletContext.contextPath}/product/${category}?page=${curPage+1}">
                    <img src="${pageContext.servletContext.contextPath}/assets/images/admin/i_next.gif" align="absmiddle" border="0">
                  </a>
                </c:if>
                <%-- <img src="${pageContext.servletContext.contextPath }/assets/images/i_prev.gif" align="absmiddle" border="0">
                <font color="#FC0504"><b>1</b></font>&nbsp;
                <a href="product.jsp?code1=1&code2=1">
                  <font color="#7C7A77">[2]</font>
                </a>&nbsp; 
                <a href="product.jsp?code1=1&code2=1">
                  <font color="#7C7A77">[3]</font>
                </a>&nbsp; 
                <img src="${pageContext.servletContext.contextPath }/assets/images/i_next.gif" align="absmiddle" border="0"> --%>
              </td>
            </tr>
          </table> <!-------------------------------------------------------------------------------------------->
          <!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
          <!-------------------------------------------------------------------------------------------->
  
        </td>
      </tr>
    </table>
    <br>
    <br>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>