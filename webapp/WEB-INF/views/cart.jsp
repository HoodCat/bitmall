<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>비트닷컴 쇼핑몰</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.servletContext.contextPath}/assets/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
        
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
  
          <table border="0" cellpadding="0" cellspacing="0" width="747">
            <tr>
              <td height="13"></td>
            </tr>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" width="746">
            <tr>
              <td height="30" align="left">
                <img src="${pageContext.servletContext.contextPath }/assets/images/cart_title.gif" width="746" height="30" border="0">
              </td>
            </tr>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" width="747">
            <tr>
              <td height="13"></td>
            </tr>
          </table>
  
          <table border="0" cellpadding="0" cellspacing="0" width="710" class="cmfont">
            <tr>
              <td>
                <img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0">
              </td>
            </tr>
          </table>
  
          <table border="0" cellpadding="0" cellspacing="0" width="710">
            <tr>
              <td height="10"></td>
            </tr>
          </table>
  
          <table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
            <tr bgcolor="F0F0F0" height="23" class="cmfont">
              <td width="420" align="center">상품</td>
              <td width="70" align="center">수량</td>
              <td width="80" align="center">가격</td>
              <td width="90" align="center">합계</td>
              <td width="50" align="center">삭제</td>
            </tr>
            <c:forEach items="${cartList}" var="cart">
              <tr>
                <form name="form2" method="post" action="">
                  <td height="60" align="center" bgcolor="#FFFFFF">
                    <table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="60">
                          <a href="product_detail.jsp?product_num=0000">
                            <img src="${pageContext.servletContext.contextPath}${cart.path}" width="50" height="50" border="0">
                          </a>
                        </td>
                        <td class="cmfont">
                          <a href="product_detail.jsp?product_num=0000">${cart.name}</a>
                          <br>
                          <c:if test="${not empty cart.optionList}">
                            <font color="#0066CC">[옵션사항]</font> ${cart.nameList}
                          </c:if>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td align="center" bgcolor="#FFFFFF">
                    <input type="text" name="num1" size="3" value="${cart.amount}" class="cmfont1" readonly="readonly">
                    &nbsp<font color="#464646">개</font>
                  </td>
                  <td align="center" bgcolor="#FFFFFF">
                    <font color="#464646">
                      <fmt:formatNumber value="${cart.price}" type="number"/>
                    </font>
                  </td>
                  <td align="center" bgcolor="#FFFFFF">
                    <font color="#464646">
                      <fmt:formatNumber value="${cart.price * (1-cart.rateSale/100) * cart.amount}" type="number" maxFractionDigits="0"/>
                    </font>
                  </td>
                  <td align="center" bgcolor="#FFFFFF">
                  <input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">
                  &nbsp<br> 
                  <a href="${pageContext.servletContext.contextPath}/cart/delete?no=${cart.no}">
                    <img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0">
                  </a>
                  &nbsp</td>
                </form>
              </tr>
            </c:forEach>
            <c:if test="${not empty cartList}">
              <tr>
                <td colspan="5" bgcolor="#F0F0F0">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
                    <tr>
                      <td bgcolor="#F0F0F0">
                        <img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0">
                      </td>
                      <td align="right" bgcolor="#F0F0F0">
                        <font color="#0066CC"><b>총 합계금액</font></b>
                        : 상품대금(
                        <fmt:formatNumber value="${totPrice}" type="number" maxFractionDigits="0"/>
                                              원) + 배송료(2,500원) =
                        <font color="#FF3333"><b>
                        <fmt:formatNumber value="${totPrice + 2500}" type="number" maxFractionDigits="0"/>
                                              원</b></font>&nbsp;&nbsp
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </c:if>
          </table>
          <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
            <tr height="44">
              <td width="710" align="center" valign="middle">
                <a href="${pageContext.servletContext.contextPath}">
                  <img src="${pageContext.servletContext.contextPath}/assets/images/b_shopping.gif" border="0">
                </a>&nbsp;&nbsp; 
                <a href="${pageContext.servletContext.contextPath}/cart/delete">
                  <img src="${pageContext.servletContext.contextPath}/assets/images/b_cartalldel.gif" width="103" height="26" border="0">
                </a>&nbsp;&nbsp; 
                <a href="${pageContext.servletContext.contextPath}/order">
                  <img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0">
                </a>
              </td>
            </tr>
          </table> 
          <!-------------------------------------------------------------------------------------------->
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