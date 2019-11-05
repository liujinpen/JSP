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
            mess = "你还没开始猜测";
        }
        else if(guesscharacter==realcharacter){
            int n= (Integer) session.getAttribute("count");
            n+=1;
            session.setAttribute("count",n);
            mess = "你猜对了，这是第"+n+"次猜测";
        }
        else if(guesscharacter>realcharacter){
            int n= (Integer) session.getAttribute("count");
            n+=1;
            session.setAttribute("count",n);
            mess = "你猜大了，这是第"+n+"次猜测";
        }
        else if(guesscharacter<realcharacter){
            int n= (Integer) session.getAttribute("count");
            n+=1;
            session.setAttribute("count",n);
            mess = "你猜小了，这是第"+n+"次猜测";
        }
        jspContext.setAttribute("message",mess);
    }
    else{
        jspContext.setAttribute("message","请输入你的猜测");
    }
%>