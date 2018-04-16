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
    var imageCount = 0;
    var addImageRow = function() {
        imageCount++;
        var imageInput = 
            "<b>이미지" + imageCount + "</b>:" +
            "<input class='current' type='file' name='imageFile' size='30' value='찾아보기'><br>";
        
        $("#images input.current").removeClass();
        $("#images").append(imageInput);
    }
    
    var addSaleRate = function() {
        var html = "할인율 : <input type='text' name='discount' value='0' size='3' maxlength='3' disabled> %";
        $("td.icons span[data-name='Sale']").after(html);
    };
    
    $(function(){
        addImageRow();
        addSaleRate();
        
        $("td.icons input[data-name='Sale']").click(function() {
            form1.discount.disabled=!form1.discount.disabled;
        });
        
        $("select[name='category'] option[value=${goods.categoryNo}]").attr("selected", "");
        $("input[name='status'][value=${goods.statusNo}]").attr("checked", true); 
    });
    
    $(document).on("change", "#images input.current", function(){
        addImageRow();
    });
    </script>
  </head>
  
  <body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <br>
    <jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
    <hr width='900' size='3'>
  
    <form name="form1" method="post" action="" enctype="multipart/form-data">
      <table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
        <tr height="23">
          <td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
          <td width="700" bgcolor="#F2F2F2">
            <select name="category">
              <option value="0">상품분류를 선택하세요</option>
              <c:forEach items="${categoryList}" var="c">
                <option value="${c.no}">${c.name}</option>
              </c:forEach>
            </select>
          </td>
        </tr>
        
        <tr height="23">
          <td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
          <td width="700" bgcolor="#F2F2F2">
            <input type="text" name="code" value="${goods.code}" size="20" maxlength="20">
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
          <td width="700" bgcolor="#F2F2F2">
            <input type="text" name="name" value="${goods.name}" size="60" maxlength="60">
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
          <td width="700" bgcolor="#F2F2F2">
            <input type="text" name="coname" value="${goods.manufacture}" size="30" maxlength="30">
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
          <td width="700" bgcolor="#F2F2F2">
            <input type="text" name="price" value="${goods.price}" size="12" maxlength="12">원
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
          <td width="700" bgcolor="#F2F2F2">
            <select name="option">
              <option value="0">옵션선택</option>
              <c:forEach items="${optionList}" var="o">
                <option value="${o.no}">${o.name}</option>
              </c:forEach>
            </select> &nbsp; &nbsp;
            
            <select name="option">
              <option value="0">옵션선택</option>
              <c:forEach items="${optionList}" var="o">
                <option value="${o.no}">${o.name}</option>
              </c:forEach>
            </select> &nbsp; &nbsp;
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
          <td width="700" bgcolor="#F2F2F2">
            <textarea name="content" rows="4" cols="70">${goods.description}</textarea>
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
          <td width="700" bgcolor="#F2F2F2">
            <c:forEach items="${statusList}" var="s">
              <input type="radio" name="status" value="${s.no}"> ${s.name}            
            </c:forEach>
          </td>
        </tr>
        
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
          <td class="icons" width="700" bgcolor="#F2F2F2">
            <c:forEach items="${iconList}" var="icon">
              <input type="checkbox" name="check-icon" value="${icon.no}" data-name="${icon.name}">
              <span data-name="${icon.name}">${icon.name} &nbsp;&nbsp;</span> 
            </c:forEach>
          </td>
        </tr>
        <!-- 
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">등록일</td>
          <td width="700" bgcolor="#F2F2F2">
            <input type="text" name="regday1" value="2007" size="4" maxlength="4"> 년 &nbsp
            <input type="text" name="regday2" value="2007" size="2" maxlength="2"> 월 &nbsp
            <input type="text" name="regday3" value="2007" size="2" maxlength="2"> 일 &nbsp
          </td>
        </tr>
         -->
        <tr>
          <td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
          <td width="700" bgcolor="#F2F2F2">
            <table border="0" cellspacing="0" cellpadding="0" align="left">
              <tr>
                <td>
                  <table width="390" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                        <input type='hidden' name='imagename1' value='s001_1.jpg'> &nbsp;
                        <input type="checkbox" name="checkno1" value="1">
                        <b>이미지1</b>: s001_1.jpg <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="file" name="image1" size="20" value="찾아보기">
                      </td>
                    </tr>
                    
                    <tr>
                      <td>
                        <input type='hidden' name='imagename2' value='s001_2.jpg'> &nbsp;
                        <input type="checkbox" name="checkno2" value="1" checked>
                        <b>이미지2</b>: s001_2.jpg <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="file" name="image2" size="20" value="찾아보기"></td>
                    </tr>
                    
                    <tr>
                      <td>
                        <input type='hidden' name='imagename3' value=''> &nbsp;
                        <input type="checkbox" name="checkno3" value="1">
                        <b>이미지3</b>: <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="file" name="image3" size="20" value="찾아보기">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <br>&nbsp;&nbsp;&nbsp;※ 삭제할 그림은 체크를하세요.
                      </td>
                    </tr>
                  </table>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <table width="390" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="middle">&nbsp;
                        <img src="${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg" width="50" height="50" border="1" style='cursor: hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg')">&nbsp;
                        <img src="${pageContext.servletContext.contextPath }/assets/images/product/s001_2.jpg" width="50" height="50" border="1" style='cursor: hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_2.jpg')">&nbsp;
                        <img src="${pageContext.servletContext.contextPath }/assets/images/product/nopic.jpg" width="50" height="50" border="1" style='cursor: hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/nopic.jpg')">&nbsp;
                      </td>
                    </tr>
                  </table>
                </td>
                <td align="right" width="310">
                  <img name="big" src="${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg" width="300" height="300" border="1">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
  
      <br>
      <table width="800" border="0" cellspacing="0" cellpadding="5">
        <tr>
          <td align="center">
            <input type="submit" value="수정하기"> &nbsp;&nbsp;
            <a href="product.jsp">
              <input type="button" value="이전화면">
            </a>
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
