<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판만들기</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String regdate = request.getParameter("regdate");
String content = request.getParameter("content");

if(title == "" ||title == null) out.println("title이 null입니다.");

if(writer == "" ||writer == null)
    out.println("writer가 null입니다.");   
else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
    out.println("이메일 형식이 아닙니다.");
 
if(regdate == "" ||regdate == null)
    out.println("regdate가 null입니다.");
else if(!Pattern.matches("^[0-9]*$", regdate))
    out.println("숫자형식이 아닙니다.");
if(content == "" ||content == null) out.println("content가 null입니다.");

try {
	  String driverName="org.mariadb.jdbc.Driver";
	  String url = "jdbc:mariadb://localhost:3306/mysql";
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(url,"board","board");
          out.println("Oracle 데이터베이스 db에 접속 성공");
          Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
          
          String sql = "INSERT INTO BOARD "+
          
                         "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
          
                         "VALUES (" + 2 +", '"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
          
         stmt.executeUpdate(sql);  

          out.close();
                       
         } catch (Exception e) {
            System.out.println("DB 접속 실패");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
%>
	<body>
</body>
</html>