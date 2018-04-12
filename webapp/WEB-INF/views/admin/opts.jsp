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
    var fetch = function() {
        
    }
    
    var goNew = function() {
        $("#add-button").css({"display":"none"});
        var html = "<tr id='add-row' bgcolor='#F2F2F2' height='20'>" + 
                   "<td width='100' align='center'></td>" + 
                   "<td width='300' align='left'><input id='option-name' type='text' style='width:100%'/></td>" +
                   "<td width='100' align='center'><a id='add' href=''>등록</a>/<a id='cancel' href=''>취소</a></td>" + 
                   "</tr>";
        $("#small_option tr:first").after(html);
    };
    
    $(document).on("click", "#add", function(event){
        event.preventDefault();
        console.log("추가");
        $.ajax({
            "url":"${pageContext.servletContext.contextPath}/admin/api/small_option/insert",
            "type":"post",
            "data":{"name":$("#option-name").val(), "optionNo":"${option.no}"},
            "dataType":"json",
            "success": function(response) {
                $("#add-button").css({"display":""});
                $("#add-row").remove();
                console.log(response);
                var html = "<tr bgcolor='#F2F2F2' height='20'>" + 
                           "<td width='100' align='center'></td>" + 
                           "<td width='300' align='left'>" + response.name + "</td>"+
                           "<td width='100' align='center'>" +
                             "<a href='" + response.optionNo + "/edit/" + response.no + "'>수정</a>/" + 
                             "<a href=''>삭제</a>" + 
                           "</td>" + 
                           "</tr>";
                $("#small_option tr:first").after(html);
            }
        });
    });
    
    $(document).on("click", "#cancel", function(event){
        event.preventDefault();
        $("#add-button").css({"display":""});
        $("#add-row").remove();
    });
    
    </script>
  </head>
  <body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <br>
    <jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
    <hr width='900' size='3'>
    <table width="450" border="0" cellspacing="0" cellpadding="0">
      <tr height="50">
        <td align="left" width="300" valign="bottom">
          &nbsp 옵션명 : 
          <font color="#0457A2"><b>${option.name}</b></font>
        </td>
        
        <td align="right" width="200" valign="bottom">
          <input id="add-button" type="button" value="신규입력" onclick="javascript:goNew();">
          &nbsp
        </td>
      </tr>
      <tr>
        <td height="5" colspan="2"></td>
      </tr>
    </table>
  
    <table id="small_option" width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
      <tr bgcolor="#CCCCCC" height="20">
        <td width="100" align="center"><font color="#142712">소옵션번호</font></td>
        <td width="300" align="center"><font color="#142712">소옵션명</font></td>
        <td width="100" align="center"><font color="#142712">수정/삭제</font></td>
      </tr>
      
      <!-- 소옵션 리스트 -->
      
      <c:forEach items="${sOptionList}" var="smallOption" varStatus="status">
        <tr bgcolor="#F2F2F2" height="20">
          <td width="100" align="center">${status.index + 1}</td>
          <td width="300" align="left">${smallOption.name}</td>
          <td width="100" align="center">
            <a href="${option.no}/edit/${smallOption.no}">수정</a>/
            <a href="${option.no}/delete/${smallOption.no}">삭제</a>
          </td>
        </tr>
      </c:forEach>
      
    </table>
  </body>
</html>