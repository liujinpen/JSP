<%@ tag import="javax.lang.model.type.ReferenceType" %>
<%@ tag import="javax.xml.transform.Result" %>
<%@ tag pageEncoding="GB2312" %>
<%@attribute name="firstnumber" required="true" %>
<%@attribute name="secondnumber" required="true" %>
<%@attribute name="choose" required="true" %>
<%@variable name-given="result"  scope="AT_END" %>
<%@variable name-given="option" scope="AT_END" %>
<%@variable name-given="firstreturn" scope="AT_END" %>
<%@variable name-given="secondreturn" scope="AT_END" %>
<%
    try{
        jspContext.setAttribute("firstreturn",firstnumber);
        jspContext.setAttribute("secondreturn",secondnumber);
        double a=Double.parseDouble(firstnumber);
        double b=Double.parseDouble(secondnumber);
        double d=0;
        if (choose.equals("+")) {
            d= a + b;
            jspContext.setAttribute("option","+");
        } else if (choose.equals("-")) {
            d= a - b;
            jspContext.setAttribute("option","-");
        } else if (choose.equals("cheng")) {
            d= a * b;
            jspContext.setAttribute("option","&times");
        } else if (choose.equals("chu")) {
            d= a / b;
            jspContext.setAttribute("option","&divide");
        }
        jspContext.setAttribute("result", "="+String.format("%.3f",d));
    }
    catch (Exception e)
    {
        jspContext.setAttribute("firstreturn","");
        jspContext.setAttribute("secondreturn","");
        jspContext.setAttribute("option","");
        jspContext.setAttribute("result","ÇëÖØÐÂÊäÈë");
    }
%>