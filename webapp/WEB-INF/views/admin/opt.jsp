<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
  <head>
    <title>쇼핑몰 관리자 홈페이지</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="${pageContext.servletContext.contextPath}/assets/css/font.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.servletContext.contextPath}/assets/jquery/jquery-1.9.0.js" type="text/javascript"></script>    
    <script type="text/javascript">
    $(function(){
        $("#delete").click(function(event){
            var isDelete = confirm("정말 삭제하시겠습니까?");
            
            if(isDelete == false){
                event.preventDefault();
                return;
            }
        });
    });
    </script>
  </head>
  
  <body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <br>
    <jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
    <hr width='900' size='3'>
    <table width="450" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" width="250" height="50" valign="bottom">
          &nbsp 옵션수 : 
          <font color="#FF0000">${totalCount}</font>
        </td>
        
        <td align="right" width="200" height="50" valign="bottom">
          <a href="option/new">
            <input type="button" value="신규입력">
          </a>
          &nbsp
        </td>
      </tr>
      
      <tr><td height="5" colspan="2"></td></tr>
    </table>
  
    <table width="450" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
      <tr bgcolor="#CCCCCC" height="20">
        <td width="50" align="center"><font color="#142712">번호</font></td>
        <td width="200" align="center"><font color="#142712">옵션명</font></td>
        <td width="100" align="center"><font color="#142712">수정/삭제</font></td>
        <td width="100" align="center"><font color="#142712">소옵션편집</font></td>
      </tr>
      
      <c:forEach items="${optionList}" var="option" varStatus="status">
        <tr bgcolor="#F2F2F2" height="20">
          <td width="50" align="center">${status.index + 1}</td>
          <td width="200" align="left">${option.name}</td>
          <td width="100" align="center">
            <a href="option/edit/${option.no}">수정</a>/
            <a id="delete" href="option/delete/${option.no}">삭제</a></td>
          <td width="100" align="center">
            <a href="option/${option.no}">소옵션편집</a>
            <%-- <a href="options?no=${option.no}">소옵션편집</a> --%>
          </td>
        </tr>
      </c:forEach>
    </table>
    <br>
  </body>
</html>