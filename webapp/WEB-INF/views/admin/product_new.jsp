<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
    });
    
    $(document).on("change", "#images input.current", function(){
        addImageRow();
    });
    </script>
  </head>
  
  <body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <div>
      <br>
      <jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
      <hr width='900' size='3'>
      <form name="form1" method="post" action="new" enctype="multipart/form-data">
      
        <table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
          <tr height="23">
            <td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
            <td width="700" bgcolor="#F2F2F2">
              <select name="categoryNo">
                <option value="0" selected>상품분류를 선택하세요</option>
                <c:forEach items="${categoryList}" var="category">
                  <option value="${category.no}">${category.name}</option>
                </c:forEach>
              </select>
            </td>
          </tr>
          
          <tr height="23">
            <td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
            <td width="700" bgcolor="#F2F2F2">
              <input type="text" name="code" value="" size="20" maxlength="20">
            </td>
          </tr>
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
            <td width="700" bgcolor="#F2F2F2">
              <input type="text" name="name" value="" size="60" maxlength="60">
            </td>
          </tr>
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
            <td width="700" bgcolor="#F2F2F2">
              <input type="text" name="manufacture" value="" size="30" maxlength="30">
            </td>
          </tr>
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
            <td width="700" bgcolor="#F2F2F2">
              <input type="text" name="price" value="" size="12" maxlength="12"> 원
            </td>
          </tr>
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
            <td width="700" bgcolor="#F2F2F2">
              <select name="option">
                <option value="0" selected>옵션선택</option>
                <c:forEach items="${optionList}" var="option">
                  <option value="${option.no}">${option.name}</option>
                </c:forEach>
              </select> &nbsp; &nbsp; 
              <select name="option">
                  <option value="0" selected>옵션선택</option>
                  <c:forEach items="${optionList}" var="option">
                    <option value="${option.no}">${option.name}</option>
                  </c:forEach>
              </select> &nbsp; &nbsp;
            </td>
          </tr>
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
            <td width="700" bgcolor="#F2F2F2">
              <textarea name="description"rows="10" cols="80"></textarea>
            </td>
          </tr>
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
            <td width="700" bgcolor="#F2F2F2">
              <c:forEach items="${statusList}" var="status">
                <input type="radio" name="statusNo" value="${status.no}"> ${status.name}
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
          
          <tr>
            <td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
            <td id="images" width="700" bgcolor="#F2F2F2"></td>
          </tr>
        </table>
        <br>
        
        <table width="800" border="0" cellspacing="0" cellpadding="7">
          <tr>
            <td align="center"><input type="submit" value="등록하기"> &nbsp;&nbsp;
              <a href="product.jsp">
                <input type="button" value="이전화면">
              </a>
            </td>
          </tr>
        </table>
        
      </form>
    </body>
    </div>
</html>
