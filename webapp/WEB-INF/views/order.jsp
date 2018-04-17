<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
  <head>
    <title>비트닷컴 쇼핑몰</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.servletContext.contextPath}/assets/jquery/jquery-1.9.0.js" type="text/javascript"></script>
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
          <!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
          <!-------------------------------------------------------------------------------------------->
  
          <!--  현재 페이지 자바스크립  -------------------------------------------->
          <script language="javascript">
          function Check_Value() {
              if (!form2.o_name.value) {
                  alert("주문자 이름이 잘 못 되었습니다.");
                  form2.o_name.focus();
                  return;
              }
              if (!form2.o_tel1.value
                      || !form2.o_tel2.value
                      || !form2.o_tel3.value) {
                  alert("전화번호가 잘 못 되었습니다.");
                  form2.o_tel1.focus();
                  return;
              }
              if (!form2.o_phone1.value
                      || !form2.o_phone2.value
                      || !form2.o_phone3.value) {
                  alert("핸드폰이 잘 못 되었습니다.");
                  form2.o_phone1.focus();
                  return;
              }
              if (!form2.o_email.value) {
                  alert("이메일이 잘 못 되었습니다.");
                  form2.o_email.focus();
                  return;
              }
              if (!form2.o_zip1.value
                      || !form2.o_zip2.value) {
                  alert("우편번호가 잘 못 되었습니다.");
                  form2.o_zip1.focus();
                  return;
              }
              if (!form2.o_juso.value) {
                  alert("주소가 잘 못 되었습니다.");
                  form2.o_email.focus();
                  return;
              }

              if (!form2.r_name.value) {
                  alert("받으실 분의 이름이 잘 못 되었습니다.");
                  form2.r_name.focus();
                  return;
              }
              if (!form2.r_tel1.value
                      || !form2.r_tel2.value
                      || !form2.r_tel3.value) {
                  alert("전화번호가 잘 못 되었습니다.");
                  form2.r_tel1.focus();
                  return;
              }
              if (!form2.r_phone1.value
                      || !form2.r_phone2.value
                      || !form2.r_phone3.value) {
                  alert("핸드폰이 잘 못 되었습니다.");
                  form2.r_phone1.focus();
                  return;
              }
              if (!form2.r_email.value) {
                  alert("이메일이 잘 못 되었습니다.");
                  form2.r_email.focus();
                  return;
              }
              if (!form2.r_zip1.value
                      || !form2.r_zip2.value) {
                  alert("우편번호가 잘 못 되었습니다.");
                  form2.r_zip1.focus();
                  return;
              }
              if (!form2.r_juso.value) {
                  alert("주소가 잘 못 되었습니다.");
                  form2.r_email.focus();
                  return;
              }

              form2.submit();
          }

          function FindZip(zip_kind) {
              window.open("${pageContext.servletContext.contextPath}/zipcode?zip_kind="
                              + zip_kind, "",
                              "scrollbars=no,width=500,height=250");
          }

          function SameCopy(str) {
              if (str == "Y") {
                  form2.r_name.value = form2.o_name.value;
                  form2.r_zip1.value = form2.o_zip1.value;
                  form2.r_zip2.value = form2.o_zip2.value;
                  form2.r_juso.value = form2.o_juso.value;
                  form2.r_tel1.value = form2.o_tel1.value;
                  form2.r_tel2.value = form2.o_tel2.value;
                  form2.r_tel3.value = form2.o_tel3.value;
                  form2.r_phone1.value = form2.o_phone1.value;
                  form2.r_phone2.value = form2.o_phone2.value;
                  form2.r_phone3.value = form2.o_phone3.value;
                  form2.r_email.value = form2.o_email.value;
              } else {
                  form2.r_name.value = "";
                  form2.r_zip1.value = "";
                  form2.r_zip2.value = "";
                  form2.r_juso.value = "";
                  form2.r_tel1.value = "";
                  form2.r_tel2.value = "";
                  form2.r_tel3.value = "";
                  form2.r_phone1.value = "";
                  form2.r_phone2.value = "";
                  form2.r_phone3.value = "";
                  form2.r_email.value = "";
              }
          }
          </script>
  
          <table border="0" cellpadding="0" cellspacing="0" width="747">
            <tr><td height="13"></td></tr>
            <tr>
              <td height="30" align="center">
                <img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0">
              </td>
            </tr>
            <tr><td height="13"></td></tr>
          </table>
  
          <table border="0" cellpadding="0" cellspacing="0" width="710">
            <tr>
              <td>
                <img src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif" width="65" height="15" border="0">
              </td>
            </tr>
            <tr><td height="10"></td></tr>
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
                <form method="post" action="">
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
                                              원</b></font>&nbsp;&nbsp;
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </c:if>
          </table>
          
          <br>
          <br> 
          <!-- 주문자 정보 -->
          <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
            <tr height="3" bgcolor="#CCCCCC"><td></td></tr>
          </table> 
          
          <!-- form2 시작  -->
          <form name="form2" method="post" action="${pageContext.servletContext.contextPath}/order/pay">
            <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
              <tr>
                <td align="left" valign="top" width="150" STYLE="padding-left: 45; padding-top: 5">
                  <font size="2" color="#B90319"><b>주문자 정보</b></font>
                </td>
                <td align="center" width="560">
                  <table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
                    <tr height="25">
                      <td width="150"><b>주문자 성명</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="hidden" name="o_no" value=""> 
                        <input type="text" name="o_name" size="20" maxlength="10" value="${authMember.name}" class="cmfont1" disabled="disabled">
                      </td>
                    </tr>
                    
                    <c:set var="tel" value="${fn:split(authMember.telNumber, '-')}"/>
                    <tr height="25">
                      <td width="150"><b>전화번호</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="o_tel1" size="4" maxlength="4" value="${tel[0]}" class="cmfont1" disabled="disabled">
                        -
                        <input type="text" name="o_tel2" size="4" maxlength="4" value="${tel[1]}" class="cmfont1" disabled="disabled">
                        -
                        <input type="text" name="o_tel3" size="4" maxlength="4" value="${tel[2]}" class="cmfont1" disabled="disabled">
                      </td>
                    </tr>
                    
                    <c:set var="cell" value="${fn:split(authMember.cellNumber, '-')}"/>
                    <tr height="25">
                      <td width="150"><b>휴대폰번호</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="o_phone1" size="4" maxlength="4" value="${cell[0]}" class="cmfont1" disabled="disabled">
                        -
                        <input type="text" name="o_phone2" size="4" maxlength="4" value="${cell[1]}" class="cmfont1" disabled="disabled">
                        -
                        <input type="text" name="o_phone3" size="4" maxlength="4" value="${cell[2]}" class="cmfont1" disabled="disabled">
                      </td>
                    </tr>
                    
                    <tr height="25">
                      <td width="150"><b>E-Mail</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="o_email" size="50" maxlength="50" value="${authMember.email}" class="cmfont1" disabled="disabled">
                      </td>
                    </tr>
                    <c:set var="addressInfo" value="${fn:split(authMember.address,'(') }"/>
                    <c:set var="temp" value="${addressInfo[fn:length(addressInfo)-1]}"/>
                    <c:set var="zipCode" value="${fn:split(fn:substring(temp, 0, fn:length(temp)-1), '-')}"/>
                    
                    <tr height="50">
                      <td width="150"><b>주소</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="o_zip1" size="3" maxlength="3" value="${zipCode[0]}" class="cmfont1" disabled="disabled">
                        -
                        <input type="text" name="o_zip2" size="3" maxlength="3" value="${zipCode[1]}" class="cmfont1" disabled="disabled">
                        <a href="javascript:FindZip(1)">
                          <img src="${pageContext.servletContext.contextPath}/assets/images/b_zip.gif" align="absmiddle" border="0">
                        </a>
                        <br>
                        <input type="text" name="o_juso" size="50" maxlength="200" value="${addressInfo[fn:length(addressInfo)-2]}" class="cmfont1" disabled="disabled">
                        <br>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr height="10"><td></td></tr>
            </table>
  
            <!-- 배송지 정보 -->
            <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
              <tr height="3" bgcolor="#CCCCCC"><td></td></tr>
              <tr height="10"><td></td></tr>
            </table>
  
            <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
              <tr>
                <td align="left" valign="top" width="150" STYLE="padding-left: 45; padding-top: 5">
                  <!-- <font size=2 color="#B90319"><b>배송지 정보</b></font> -->
                </td>
                <td align="center" width="560">
                  <table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
                    <%-- <tr height="25">
                      <td width="150"><b>주문자정보와 동일</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="radio" name="same" onclick="SameCopy('Y')">예 &nbsp; 
                        <input type="radio" name="same" onclick="SameCopy('N')">아니오
                      </td>
                    </tr>
                    
                    <tr height="25">
                      <td width="150"><b>받으실 분 성명</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="r_name" size="20" maxlength="10" value="" class="cmfont1">
                      </td>
                    </tr>
                    
                    <tr height="25">
                      <td width="150"><b>전화번호</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="r_tel1" size="4" maxlength="4" value="" class="cmfont1">
                        -
                        <input type="text" name="r_tel2" size="4" maxlength="4" value="" class="cmfont1">
                        -
                        <input type="text" name="r_tel3" size="4" maxlength="4" value="" class="cmfont1">
                      </td>
                    </tr>
                    
                    <tr height="25">
                      <td width="150"><b>휴대폰번호</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="r_phone1" size="4" maxlength="4" value="" class="cmfont1">
                        -
                        <input type="text" name="r_phone2" size="4" maxlength="4" value="" class="cmfont1">
                        -
                        <input type="text" name="r_phone3" size="4" maxlength="4" value="" class="cmfont1">
                      </td>
                    </tr>
                    
                    <tr height="25">
                      <td width="150"><b>E-Mail</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="r_email" size="50" maxlength="50" value="" class="cmfont1">
                      </td>
                    </tr>
                    
                    <tr height="50">
                      <td width="150"><b>주소</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <input type="text" name="r_zip1" size="3" maxlength="3" value="" class="cmfont1" readonly>
                        -
                        <input type="text" name="r_zip2" size="3" maxlength="3" value="" class="cmfont1" readonly>
                        <a href="javascript:FindZip(2)">
                          <img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0">
                        </a>
                        <br>
                        <input type="text" name="r_juso" size="50" maxlength="200" value="" class="cmfont1" readonly>
                        <br>
                      </td>
                    </tr> --%>
                    
                    <tr height="50">
                      <td width="150"><b>배송시요구사항</b></td>
                      <td width="20"><b>:</b></td>
                      <td width="390">
                        <textarea name="recommand" cols="60" rows="3" class="cmfont1" style="resize:none;"></textarea>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr height="10"><td></td></tr>
            </table>
  
            <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
              <tr height="3" bgcolor="#CCCCCC"><td></td></tr>
              <tr height="10"><td></td></tr>
            </table>
  
            <table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
              <tr>
                <td align="center">
                  <input type="image" src="${pageContext.servletContext.contextPath}/assets/images/b_order3.gif">
                </td>
              </tr>
              <tr height="20"><td></td></tr>
            </table>
          </form> 
          <!-------------------------------------------------------------------------------------------->
          <!--                                       끝 : 다른 웹페이지 삽입할 부분                                                         -->
          <!-------------------------------------------------------------------------------------------->
        </td>
      </tr>
    </table>
    <br>
    <br>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>