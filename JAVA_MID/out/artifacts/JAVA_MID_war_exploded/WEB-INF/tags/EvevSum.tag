<%@ tag pageEncoding="GB2312" %>
<p>����һ��Tag�ļ����������ż���ͣ�
<%
    int sum=0,i;
    for(i=1;i<=100;i++){
    if(i%2==0)
    sum+=i;
    }
    out.println(sum);
%>