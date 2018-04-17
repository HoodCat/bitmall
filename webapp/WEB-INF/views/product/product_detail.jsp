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
      /* $("form[name='form2']").submit(function(event){
          event.preventDefault();
      }); */
      
      $("input#order").click(function(event){
          /* window.location.replace("${pageContext.servletContext.contextPath}/order"); */ 
          $("form[name='form2']")
          .attr("action", "${pageContext.servletContext.contextPath}/order")
          .submit();
      });
      
      $("input#cart").click(function(event){
          /* window.location.replace("${pageContext.servletContext.contextPath}/cart"); */
          $("form[name='form2']")
          .attr("action", "${pageContext.servletContext.contextPath}/cart")
          .submit();
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
          <!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                   -->
          <!-------------------------------------------------------------------------------------------->
  
          <table border="0" cellpadding="0" cellspacing="0" width="747">
            <tr>
              <td height="13"></td>
            </tr>
            <tr>
              <td height="30">
                <img src="${pageContext.servletContext.contextPath}/assets/images/product_title3.gif" width="746" height="30" border="0">
              </td>
            </tr>
            <tr>
              <td height="10"></td>
            </tr>
          </table> 
          
          <!-- form2 시작  -->
          <form name="form2" method="post" action="">
            <input type="hidden" name="memberNo" value="${authMember.no}"/>
            <input type="hidden" name="goodsNo" value="${goods.no}"/> 
            <!-- <input type="hidden" name="kind" value="insert"> -->
  
            <table border="0" cellpadding="0" cellspacing="0" width="745">
              <tr>
                <td width="335" align="center" valign="top">
                  <!-- 상품이미지 -->
                  <table border="0" cellpadding="0" cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
                    <tr>
                      <td bgcolor="white" align="center">
                        <img src="${pageContext.servletContext.contextPath}${goodsImgList[0].path}" width="315" height="315" border="0" align="absmiddle" ONCLICK="Zoomimage('0000')" STYLE="cursor: hand">
                      </td>
                    </tr>
                  </table>
                </td>
                
                <td width="410 " align="center" valign="top">
                  <!-- 상품명 -->
                  <table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
                    <tr>
                      <td colspan="3" bgcolor="E8E7EA"></td>
                    </tr>
                    <tr>
                      <td width="80" height="45" style="padding-left: 10px">
                        <img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
                        <font color="666666"><b>제품명</b></font>
                      </td>
                      <td width="1" bgcolor="E8E7EA"></td>
                      <td style="padding-left: 10px">
                        <font color="282828">${goods.name}</font><br>
                        <c:forEach items="${iconList}" var="icon">
                          <img src="${pageContext.servletContext.contextPath }${icon.iconImage}" align="absmiddle" vspace="1">
                        </c:forEach>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" bgcolor="E8E7EA"></td>
                    </tr>
                    <!-- 시중가 -->
                    <tr>
                      <td width="80" height="35" style="padding-left: 10px">
                        <img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
                        <font color="666666"><b>소비자가</b></font>
                      </td>
                      <td width="1" bgcolor="E8E7EA"></td>
                      <td width="289" style="padding-left: 10px">
                        <font color="666666">
                          <fmt:formatNumber value="${goods.price}" type="number"/> 원</td>
                        </font>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" bgcolor="E8E7EA"></td>
                    </tr>
                    <!-- 판매가 -->
                    <tr>
                      <td width="80" height="35" style="padding-left: 10px">
                        <img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
                        <font color="666666"><b>판매가</b></font>
                      </td>
                      <td width="1" bgcolor="E8E7EA"></td>
                      <td style="padding-left: 10px">
                        <font color="0288DD">
                          <b><fmt:formatNumber value="${goods.price * (1-goods.rateSale/100)}" type="number" maxFractionDigits="0"/> 원</b>
                        </font>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" bgcolor="E8E7EA"></td>
                    </tr>
                    <!-- 옵션 -->
                    <c:if test="${not empty optionList}">
                      <tr>
                        <td width="80" height="35" style="padding-left: 10px">
                          <img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
                          <font color="666666"><b>옵션선택</b></font>
                        </td>
                        <td width="1" bgcolor="E8E7EA"></td>
                        <td style="padding-left: 10px">
                          <c:forEach items="${optionList}" var="o">
                          <select name="small-option" class="cmfont1">
                            <option value="0" selected="selected">${o.name}</option>
                            <c:forEach items="${sOptionList}" var="so">
                              <c:if test="${o.no == so.optionNo}">
                                <option value="${so.no}">${so.name}</option>
                              </c:if>
                            </c:forEach>
                          </select> &nbsp; 
                          </c:forEach>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3" bgcolor="E8E7EA"></td>
                      </tr>
                    </c:if>
                    <!-- 수량 -->
                    <tr>
                      <td width="80" height="35" style="padding-left: 10px">
                        <img src="${pageContext.servletContext.contextPath}/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
                        <font color="666666"><b>수량</b></font>
                      </td>
                      <td width="1" bgcolor="E8E7EA"></td>
                      <td style="padding-left: 10px">
                        <input type="text" name="amount" value="1" size="3" maxlength="5" class="cmfont1"> 
                        <font color="666666">개</font>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" bgcolor="E8E7EA"></td>
                    </tr>
                  </table>
                  
                  <table border="0" cellpadding="0" cellspacing="0"width="370" class="cmfont">
                    <tr>
                      <td height="70" align="center">
                        <input id="order" type="image" src="${pageContext.servletContext.contextPath}/assets/images/b_order.gif"/>
                        <input id="cart" type="image" src="${pageContext.servletContext.contextPath}/assets/images/b_cart.gif"/>
                      </td>
                    </tr>
                  </table>
                  
                  <table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
                    <tr>
                      <td height="30" align="center">
                        <img src="${pageContext.servletContext.contextPath}/assets/images/product_text1.gif" border="0" align="absmiddle">
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </form> 
          <!-- form2 끝  -->
  
          <table border="0" cellpadding="0" cellspacing="0" width="747">
            <tr>
              <td height="22"></td>
            </tr>
          </table> 
          
          <!-- 상세설명 -->
          <table border="0" cellpadding="0" cellspacing="0" width="747">
            <tr>
              <td height="13"></td>
            </tr>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" width="746">
            <tr>
              <td height="30" align="center">
                <img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
              </td>
            </tr>
          </table>
          
          <table border="0" cellpadding="0" cellspacing="0" width="746" style="font-size: 9pt">
            <tr>
              <td height="13"></td>
            </tr>
            <tr>
              <td height="200" valign=top style="line-height: 14pt" align="center">
                ${goods.description} 
                <br> 
                <br>
                <c:forEach items="${goodsImgList}" var="goodsImg" varStatus="status">
                  <img src="${pageContext.servletContext.contextPath}${goodsImg.path}" width="100%" >
                  <br/>
                </c:forEach>
              </td>
            </tr>
          </table> 
          
          <!-- 교환배송정보 -->
          <table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
            <tr>
              <td height="10"></td>
            </tr>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" width="746">
            <tr>
              <td align="center" class="cmfont">배송정보 어쩌고저쩌고........</td>
            </tr>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
            <tr>
              <td height="10"></td>
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