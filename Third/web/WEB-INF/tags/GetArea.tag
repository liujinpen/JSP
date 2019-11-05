<%@ tag pageEncoding="GB2312" %>
<%@attribute name="numberA" required="true" type="java.lang.String" %>
<%@attribute name="numberB" required="true" type="java.lang.String"%>
<%@attribute name="numberC" required="true" type="java.lang.String"%>
<%@variable name-given="area" variable-class="java.lang.String" scope="AT_END" %>
<%@variable name-given="message" variable-class="java.lang.String" scope="AT_END" %>
<%!
    public double getTriangArea(double a,double b,double c){
        if(a+b>c&&a+c>b&&b+c>a){
            double p=(a+b+b)/2.0;
            return Math.sqrt(p*(p-a)*(p-b)*(p-c));
        }
        else
            return -1;
    }
%>
<%
    try{
        double a=Double.parseDouble(numberA);
        double b=Double.parseDouble(numberB);
        double c=Double.parseDouble(numberC);
        double result=getTriangArea(a, b, c);
        jspContext.setAttribute("area",String.format("%.3f",result));
        jspContext.setAttribute("message","三角形的面积");
    }
    catch (Exception e){
        jspContext.setAttribute("area",String.format("%.3f",0));
        jspContext.setAttribute("message",""+e.toString());
    }
%>