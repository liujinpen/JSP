<%@ tag pageEncoding="GB2312" %>
<%@attribute name="character" required="true" %>
<%@variable name-given="message" scope="AT_END" %>
<%
    String mess="";

    char realcharacter=session.getAttribute("save").toString().charAt(0);

    char guesscharacter=' ';
    boolean boo=true;
    try{
        guesscharacter=character.charAt(0);
    }
    catch (Exception exp){
        boo = false;
    }
    if(boo){
        if(character.equals("*")){
            mess = "�㻹û��ʼ�²�";
        }
        else if(guesscharacter==realcharacter){
            int n= (Integer) session.getAttribute("count");
            n+=1;
            session.setAttribute("count",n);
            mess = "��¶��ˣ����ǵ�"+n+"�β²�";
        }
        else if(guesscharacter>realcharacter){
            int n= (Integer) session.getAttribute("count");
            n+=1;
            session.setAttribute("count",n);
            mess = "��´��ˣ����ǵ�"+n+"�β²�";
        }
        else if(guesscharacter<realcharacter){
            int n= (Integer) session.getAttribute("count");
            n+=1;
            session.setAttribute("count",n);
            mess = "���С�ˣ����ǵ�"+n+"�β²�";
        }
        jspContext.setAttribute("message",mess);
    }
    else{
        jspContext.setAttribute("message","��������Ĳ²�");
    }
%>