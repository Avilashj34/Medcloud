<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*" %>
    <%@page import="com.google.gson.Gson" %>
    <%@page import="com.google.gson.JsonObject" %>


 
<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-">
<%
Gson gsonObj = new Gson();
Map<Object,Integer> map = null;
List<Map<Object,Integer>> list = new ArrayList<Map<Object,Integer>>();
String dataPoints = null;
 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://medicaltreatment.cyd5gs2hapgv.ap-northeast-1.rds.amazonaws.com:3306/medicaltreatment","root","medcloud");
	Statement st=con.createStatement();
	ResultSet rs= st.executeQuery("select * from SensorData");
	int xVal, yVal;
	
	//ResultSet resultSet = st.executeQuery("select * from SensorData");
	
	while(rs.next()){
		xVal = rs.getInt(2);
		yVal = rs.getInt(3);
		System.out.println(xVal);
		map = new HashMap<Object,Integer>();
		map.put("x", xVal); 
		map.put("y", yVal) ;
		list.add(map);
		dataPoints = gsonObj.toJson(list);
		System.out.println(dataPoints);
	}
	con.close();

%>
<title>Chart</title>
</head>
<body>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<div id="chartContainer" style="height:370 px; width:100 %;"></div>
<h6>as</h6>

<script type="text/javascript">
window.onload = function() { 
<% if(dataPoints!= null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Chart from Database"
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		dataPoints:<%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
}
</script>
</body>

</html>  
