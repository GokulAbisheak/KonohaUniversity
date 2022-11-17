<%@page import="com.konoha.usermanagement.*"%>
<%@page import="com.konoha.modulemanagement.Module"%>
<%@page import="com.konoha.modulemanagement.ModuleDBUtil"%>
<%@page import="com.konoha.questionmanagement.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="CSS/style.css">
    <script src="JavaScript\javascript.js"></script>
    
    <% 
			session = request.getSession();  
		
			if(session.getAttribute("UserType") != null)
			{
				String usertype = (String)session.getAttribute("UserType");
				
				if(usertype.equals("Lecturer")){  
					System.out.println("access granted");
					
				} else {
					%>
					 <script>
					 	alert("Need a valid Lecturer account to access this page");
					 	history.back();
					 </script>
					 <%
				}
			}
			else {
				%>
				 <script>
				 	alert("You need to login first");
				 	window.location.href = "login.jsp";
				 </script>
				 <%
			}
		%>
    
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	
	<%
		Question q1 = (Question) request.getAttribute("q1");
	%>
	
	<div class="addBackground">
		<div class="addusers">
	      <form method="post" action="QuestionUpdate">
	        <input value="<%=q1.getQuestion() %>" name="question" type="text" placeholder="Question" required></input>
	        <input value="<%=q1.getOption1() %>" name="option1" type="text" placeholder="Option 1" required></input>
	        <input value="<%=q1.getOption2() %>" name="option2" type="text" placeholder="Option 2" required></input>
	        <input value="<%=q1.getOption3() %>" name="option3" type="text" placeholder="Option 3" required></input>
	        <input value="<%=q1.getOption4() %>" name="option4" type="text" placeholder="Option 4" required></input>
	        <input value="<%=q1.getAnswer() %>" name="answer" type="text" placeholder="Answer" required></input>
	        
	        <input value="<%=q1.getExamNo() %>" name="examNo" type="text" required hidden></input>
	        <input value="<%=q1.getQuestionNo() %>" name="questionNo" type="text" required hidden></input>
	        <input type="submit" name="adminSub" value="Update Question"></input>
	        <input type="reset" value="Reset"></input>
	      </form>
	      <!--<a href="viewquestions.jsp"><button>View All Questions</button></a>-->
	    </div>
    </div>
</body>
</html>