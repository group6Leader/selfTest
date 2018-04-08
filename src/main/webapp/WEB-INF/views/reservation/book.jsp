<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	
	if(strYear != null){
	  year = Integer.parseInt(strYear);
	  month = Integer.parseInt(strMonth);
	}else{	
		
	}
	
	//년도/월 셋팅
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0; 
	
	//오늘 날짜 저장
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime())); 
%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>예약</title> 
    <script type="text/javaScript" > 
	    function loginCheck(iUseDate){	    	
	    	var iUseDate = iUseDate;  	
	    	
	    	if(iUseDate<<%=intToday%>){
	    		alert("예약불가합니다.");
	    		return false;	    		
	    	}
	    	
	    	if(${sessionScope.loginID == null}){
	    		alert("로그인 후 예약이 가능합니다.");
	    		return false;
	    	}  
	    }
    </script>
    
    <script type="text/javaScript" > 
   /*  var haveRes = "${haveRes}";	 
	if(haveRes != null){
	     alert("이미 예약된 정보가 있습니다.");
	     alert("예약이 불가합니다.");
	     location.href="../";
	} */
	</script>

       <style type="text/css">
             body {
             scrollbar-face-color: #F6F6F6;
             scrollbar-highlight-color: #bbbbbb;
             scrollbar-3dlight-color: #FFFFFF;
             scrollbar-shadow-color: #bbbbbb;
             scrollbar-darkshadow-color: #FFFFFF;
             scrollbar-track-color: #FFFFFF;
             scrollbar-arrow-color: #bbbbbb;
             margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
             } 

             td {font-family: "돋움"; font-size: 9pt; color:#595959;}
             th {font-family: "돋움"; font-size: 9pt; color:#000000;}
             select {font-family: "돋움"; font-size: 9pt; color:#595959;}
             .divDotText {
             overflow:hidden;
             text-overflow:ellipsis;
             }
            A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
            A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
            A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
            A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
       </style>
</head>
<body>
	<form name="calendarFrm" id="calendarFrm" action="" method="">	
		<div id="content" style="width:712px;">	
		
		<table width="100%" border="0" cellspacing="1" cellpadding="1">	
			<tr>	
			       <td align ="right">	
			             <input type="button" onclick="javascript:location.href='<c:url value='../reservation/book' />'" value="오늘"/>	
			       </td>
			</tr>	
		</table>	
	
	<!--날짜 네비게이션  -->	
		<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">	
			<tr>	
				<td height="60">		
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">		
				       <tr>		
				             <td height="10">		
				             </td>		
				       </tr> 
				       <tr>		
				             <td align="center" >		
				                    <a href="<c:url value='../reservation/book' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">		
				                           <b>&lt;&lt;</b><!-- 이전해 -->		
				                    </a>		
				                    <%if(month > 0 ){ %>		
				                    <a href="<c:url value='../reservation/book' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">		
				                           <b>&lt;</b><!-- 이전달 -->		
				                    </a>		
				                    <%} else {%>		
				                           <b>&lt;</b>		
				                    <%} %>		
				                    &nbsp;&nbsp;		
				                    <%=year%>년          
									<%=month+1%>월		
				                    &nbsp;&nbsp;		
				                    <%if(month < 11 ){ %>		
				                    <a href="<c:url value='../reservation/book' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">		
				                           <!-- 다음달 --><b>&gt;</b>		
				                    </a>		
				                    <%}else{%>		
				                           <b>&gt;</b>		
				                    <%} %>		
				                    <a href="<c:url value='../reservation/book' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">		
				                           <!-- 다음해 --><b>&gt;&gt;</b>		
				                    </a>		
				             </td>		
				       </tr>		
			       </table>	
				</td>		
			</tr>		
		</table>
	
	<br>
	
	<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">	
	<thead>	
	<tr bgcolor="#CECECE">	
	       <td width='100px'>	
	      	 <div align="center"><font color="red">일</font></div>	
	       </td>	
	       <td width='100px'>	
	      	 <div align="center">월</div>	
	       </td>	
	       <td width='100px'>	
	      	 <div align="center">화</div>	
	       </td>	
	       <td width='100px'>	
	     	  <div align="center">수</div>	
	       </td>	
	       <td width='100px'>	
	    	   <div align="center">목</div>	
	       </td>	
	       <td width='100px'>	
	     	  <div align="center">금</div>	
	       </td>	
	       <td width='100px'>	
	      	 <div align="center"><font color="#529dbc">토</font></div>	
	       </td>	
	</tr>	
	</thead>	
	
	<tbody>	
		<tr>		
			<%		
				//처음 빈공란 표시		
				for(int index = 1; index < start ; index++ ){		
					out.println("<td>&nbsp;</td>");	
				    newLine++;		
				}		
			
				for(int index = 1; index <= endDay; index++){		
			       String color = "";		
			       if(newLine == 0){          
			    	   color = "RED";		
			       }else if(newLine == 6){    
			    	   color = "#529dbc";		
			       }else{                     
			    	   color = "BLACK"; 
			       };
					
			       String sUseDate = Integer.toString(year); 		
			       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);		
			       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);				
			       int iUseDate = Integer.parseInt(sUseDate);		
			       String backColor = "#EFEFEF";
			
			       if(iUseDate == intToday ) {		
			             backColor = "#c9c9c9";		
			       }		
			       out.println("<td valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");		
		       %>
				<!-- 날짜 -->
		       <%-- <font color='<%=color%>'>		
		          <%=index %>	
		       </font>		 --%> 
				
				<a href="hour?iUseDate=<%=iUseDate%>" onclick="return loginCheck(<%=iUseDate%>)"><%=index %></a>
		      
		       <%		
		       out.println("<br>");		
		   	   //년월일 : 20180403
		  	   out.println(iUseDate);		
		       out.println("<br>");	      
		
		       //기능 제거 		
		       out.println("</td>");		
		       newLine++;	 
		
		       if(newLine == 7){		
		         out.println("</tr>");		
		       	if(index <= endDay){		
		           out.println("<tr>");		
		         }		
		         newLine=0;	
		       }		
			}
		
			//마지막 공란 LOOP		
			while(newLine > 0 && newLine < 7){		
			  out.println("<td>&nbsp;</td>");		
			  newLine++;		
			}		
		%>
		
		</tr>	
		</tbody>	
		</table>	
		</div>	
	</form>
</body>
</html>