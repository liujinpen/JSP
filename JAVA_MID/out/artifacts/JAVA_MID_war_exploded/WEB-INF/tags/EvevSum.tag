<%@ tag pageEncoding="GB2312" %>
<p>这是一个Tag文件，负责计算偶数和：
<%
    int sum=0,i;
    for(i=1;i<=100;i++){
    if(i%2==0)
    sum+=i;
    }
    out.println(sum);
%>