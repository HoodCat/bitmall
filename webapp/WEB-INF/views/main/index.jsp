<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>비트닷컴 쇼핑몰</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
  </head>
  
  <body style="margin: 0">
    <jsp:include page="/WEB-INF/views/include/head.jsp" />
    <jsp:include page="/WEB-INF/views/include/search.jsp" />
    <table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr><td height="10" colspan="2"></td></tr>
      <tr>
        <td height="100%" valign="top">
          <jsp:include page="/WEB-INF/views/include/navigation.jsp" />
        </td>
        <td width="10"></td>
        <td valign="top">
          <!-------------------------------------------------------------------------------------------->
          <!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
          <!-------------------------------------------------------------------------------------------->
          <!---- 화면 우측(신상품) 시작 -------------------------------------------------->
          <table width="767" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="60">
                <img src="${pageContext.servletContext.contextPath }/assets/images/main_newproduct.jpg" width="767" height="40">
              </td>
            </tr>
          </table>
  
          <table border="0" cellpadding="0" cellspacing="0">
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
                            <img src="${pageContext.servletContext.contextPath }${goods.gImg}" width="120" height="140" border="0">
                          </a>
                        </c:when>
                      <c:otherwise>
                          <a href="${pageContext.servletContext.contextPath}/product/detail/${goods.no}">
                            <img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0">
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
                    <%-- <td height="20" align="center"><b>${goods.price} 원</b></td> --%>
                    <td height="20" align="center">
                    <b><fmt:formatNumber value="${goods.price}" type="number"/> 원</b></td>
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
          </table> <!---- 화면 우측(신상품) 끝 -------------------------------------------------->
  
          <!-------------------------------------------------------------------------------------------->
          <!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
          <!-------------------------------------------------------------------------------------------->
  
        </td>
      </tr>
    </table>
    <br>
    <br>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    &nbsp
  
  </body>
</html>