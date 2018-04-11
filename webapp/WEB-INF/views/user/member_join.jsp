<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>
  <title>비트닷컴 쇼핑몰</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <link href="${pageContext.servletContext.contextPath}/assets/css/font.css" rel="stylesheet" type="text/css">
  <script src="${pageContext.servletContext.contextPath}/assets/jquery/jquery-1.9.0.js" type="text/javascript"></script>
  <script type="text/javascript">
  
  var idCheck = false;
  
  var isEqualPassword = function() {
      var pw1 = $("input[name='password1']").val();
      var pw2 = $("input[name='password2']").val();
      
      return pw1==pw2;
  };
  
  var makeBirth = function() {
      var birth1 = $("input[name='birthday1']").val();
      var birth2 = $("input[name='birthday2']").val();
      var birth3 = $("input[name='birthday3']").val();
      
      return birth1 + "-" + birth2 + "-" + birth3;
  };
  
  var makeTelNumber = function() {
      var tel1 = $("input[name='tel1']").val();
      var tel2 = $("input[name='tel2']").val();
      var tel3 = $("input[name='tel3']").val();
      
      return tel1 + "-" + tel2 + "-" + tel3;
  };
  
  var makeCellNumber = function() {
      var cell1 = $("input[name='phone1']").val();
      var cell2 = $("input[name='phone2']").val();
      var cell3 = $("input[name='phone3']").val();
      
      return cell1 + "-" + cell2 + "-" + cell3;
  };
  
  var makeAddress = function() {
      var zip1 = $("input[name='zip1']").val();
      var zip2 = $("input[name='zip2']").val();
      var address = $("input[name='address']").val();
      
      return address + "(" + zip1 + "-" + zip2 + ")";
  };
  
  var getId = function() {
      var re = /^[a-z0-9]{4,16}$/;
      var id = $("input[name='id']");
      
      if(re.test(id.val()) == false) {
          alert("아이디 형식이 올바르지 않습니다.");
          id.val("");
          id.focus();
          return;
      }      
      
      return id.val();
  }
  
  var getPassword = function() {
      var re = /^[0-9a-zA-Z]{4,16}$/
      var password = $("input[name='password1']");
      if(!isEqualPassword()){
          alert("비밀번호를 확인하시기 바랍니다.")
          return ;
      }
      
      if(re.test(password.val()) == false) {
          alert("비밀번호는 영문 대,소문자 및 숫자로 이루어져 있어야합니다.")
          return;
      }
      
      return password.val();
  };
  
  var getName = function() {
      return $("input[name='name']").val();
  };
  
  var getBirth = function() {
      var re = /^[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}$/;
      var birth = makeBirth();
      
      if(re.test(birth) == false) {
          alert("잘 못된 생년월일이 들어왔습니다.")
          return;
      }
      
      return birth;
  };
  
  var getTelNumber = function() {
      var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
      var telNumber = makeTelNumber();
          
      if(re.test(telNumber) == false) {
          alert("전화번호 형식이 잘 못 됐습니다.")
          return;
      }
      
      return telNumber;
  };
  
  var getCellNumber = function() {
      var re = /^\d{3}-\d{3,4}-\d{4}$/;
      var cellNumber = makeCellNumber();
          
      if(re.test(cellNumber) == false) {
          alert("휴대폰번호 형식이 잘 못 됐습니다.")
          return;
      }
      
      return cellNumber;
  };
  
  var getEmail = function() {
      var re = /([a-z0-9_\.-]+)@([/da-z\.-]+)\.([a-z\.]{2,6})/;
      var email = $("input[name='email']");
      
      if(re.test(email.val()) == false) {
          alert("이메일 형식이 잘 못 됐습니다.");
          email.focus();
          return;
      }
      
      return email.val();
  };
  
  var checkId = function(){
      $.ajax({
          "url":"${pageContext.servletContext.contextPath}/api/member/check_id",
          "method":"post",
          "data":{"id":getId()},
          "dataType":"json",
          "success":function(response) {
              if(response) {
                  alert("이미 존재하는 아이디입니다.");
                  return;
              }
              alert("사용 가능한 아이디입니다.");
              idChecked = true;
          }
      });
  };
  
  $(function(){
      $("input[name='id']").change(function(event) {
          if(idChecked) {
            idChecked = false;              
          }
          console.log(idChecked);
      })
      
      $("form[name='form2']").submit(function(event){
          event.preventDefault();
           
          var id = getId();
          if(typeof id == "undefined") {return;}
          
          
          var password = getPassword();
          if(typeof password == "undefined") {return;}
          
          var name = getName();
          if(typeof name == "undefined") {return;}
          
          var birth = getBirth();
          if(typeof birth == "undefined") {return;}
          
          var telNumber = getTelNumber();
          if(typeof telNumber == "undefined") {return;}
          
          var cellNumber = getCellNumber();
          if(typeof cellNumber == "undefined") {return;}
          
          var address = makeAddress();
          if(typeof address == "undefined") {return;}
          
          var email = getEmail();
          if(typeof email == "undefined") {return;}
          
          if(idChecked == false) {
              alert("아이디를 확인하세요");
              return;
          }
          
          $.post("/bitmall/member/join", {
              "id":id,
              "password":password,
              "name":name,
              "birth":birth,
              "telNumber":telNumber,
              "cellNumber":cellNumber,
              "address":address,
              "email":email
          }, function(data, textStatus, jqXHR) {
              console.log(data);
              console.log(textStatus);
              console.log(jqXHR);
              window.location.replace("${pageContext.servletContext.contextPath}/member/joinend");
          });
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
      <td height="100%" valign="top"><jsp:include page="/WEB-INF/views/include/navigation.jsp" /></td>
      <td width="10"></td>
      <td valign="top">
        <!-------------------------------------------------------------------------------------------->
        <!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                   -->
        <!-------------------------------------------------------------------------------------------->
        <table border="0" cellpadding="0" cellspacing="0" width="747">
          <tr><td height="13"></td></tr>
          
          <tr>
            <td height="30" align="center">
              <img src="${pageContext.servletContext.contextPath}/assets/images/login_title.gif" width="747" height="30" border="0">
            </td>
          </tr>
          
          <tr><td height="13"></td></tr>
        </table>
        
        <table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
          <tr>
            <td>
              <img src="${pageContext.servletContext.contextPath }/assets/images/login_title2.gif" border="0">
            </td>
          </tr>
          <tr><td height="10"></td></tr>
        </table>

        <form name="form2" method="post" action="join">
          <table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
            <tr>
              <td align="center" bgcolor="efefef">
                <table border="0" cellpadding="0" cellspacing="5" width="100%" bgcolor="white">
                  <tr>
                    <td align="center">
                      <table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>아이디</b></font>
                          </td>
                          
                          <!-- 아이디 입력란 -->
                          
                          <td>
                            <input type="text" name="id" maxlength="12" value="" size="20" class="cmfont1">
                            <a href="javascript:checkId();">
                              <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" border="0">
                            </a>
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>비밀번호</b></font>
                          </td>
                          
                          <!-- 패스워드 입력란 -->
                          
                          <td>
                            <input TYPE="password" name="password1" maxlength="10" size="20" class="cmfont1">
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>비밀번호 확인</b></font>
                          </td>
                          
                          <!-- 패스워드 확인 -->
                          
                          <td>
                            <input TYPE="password" name="password2" maxlength="10" size="20" class="cmfont1">
                          </td>
                        </tr>
                        
                        <tr><td colspan="2" height="10"></td></tr>
                        <tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
                        <tr><td colspan="2" height="10"></td></tr>
                      </table>
                      
                      <table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>이름</b></font>
                          </td>
                          
                          <!-- 이름 입력란 -->
                          
                          <td>
                            <input type="text" name="name" maxlength="10" value="" size="20" class="cmfont1">
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>생년월일</b></font>
                          </td>
                          
                          <!-- 생년월일 입력란 -->
                          
                          <td>
                            <input type="text" name='birthday1' size="4" maxlength="4" value="" class="cmfont1">
                            <font color="898989">년</font>
                            <input type="text" name='birthday2' size="2" maxlength="2" value="" class="cmfont1">
                            <font color="898989">월</font>
                            <input type="text" name='birthday3' size="2" maxlength="2" value="" class="cmfont1">
                            <font color="898989">일</font> 
                            <!-- 
                                <input type="radio" name='sm' value = "1" checked> <font color="898989">양력</font> 
								<input type="radio" name='sm' value = "2" > <font color="898989">음력</font> 
                            -->
                          </td>
                        </tr>
                        
                        <tr><td colspan="2" height="10"></td></tr>
                        <tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
                        <tr><td colspan="2" height="10"></td></tr>
                      </table>
                      
                      <table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>전화번호</b></font>
                          </td>
                          
                          <!-- 전화번호 입력란 -->
                          
                          <td>
                            <input type="text" name='tel1' size="4" maxlength="4" value="" class="cmfont1">
                            <font color="898989">-</font>
                            <input type="text" name='tel2' size="4" maxlength="4" value="" class="cmfont1">
                            <font color="898989">-</font>
                            <input type="text" name='tel3' size="4" maxlength="4" value="" class="cmfont1">
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>핸드폰 번호</b></font>
                          </td>
                          
                          <!-- 핸드폰 번호 입력란 -->
                          
                          <td>
                            <input type="text" name='phone1' size="4" maxlength="4" value="" class="cmfont1">
                            <font color="898989">-</font>
                            <input type="text" name='phone2' size="4" maxlength="4" value="" class="cmfont1">
                            <font color="898989">-</font>
                            <input type="text" name='phone3' size="4" maxlength="4" value="" class="cmfont1">
                          </td>
                        </tr>
                        
                        <tr>
                          <td width="127" height="50">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>주소</b></font>
                          </td>
                          
                          <!-- 주소 입력란 -->
                          
                          <td>
                            <input type="text" name='zip1' size="4" maxlength="3" value="" class="cmfont1">
                            <font color="898989">-</font>
                            <input type="text" name='zip2' size="4" maxlength="3" value="" class="cmfont1">
                            <a href="javascript:FindZip(0)">
                              <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0">
                            </a>
                            <br>
                            <input type="text" name='address' size="50" maxlength="200" value="" class="cmfont1">
                            <br>
                          </td>
                        </tr>
                        
                        <!-- 이메일 입력란 -->
                        
                        <tr>
                          <td width="127" height="30">
                            <img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0">
                            <font color="898989"><b>E-Mail</b></font>
                          </td>
                          
                          <td>
                            <input type="text" name='email' size="50" maxlength="50" value="" class="cmfont1">
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
            <tr>
              <td height="45" align="right">
                <input type="image" src="${pageContext.servletContext.contextPath}/assets/images/b_add.gif" border="0">&nbsp;&nbsp; 
                <a href="javascript:form2.reset();">
                  <img src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" border="0">
                </a>
              </td>
            </tr>
          </table>
        </form>
        <!-------------------------------------------------------------------------------------------->
        <!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
        <!-------------------------------------------------------------------------------------------->
      </td>
    </tr>
  </table>
  <br>
  <br>
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>