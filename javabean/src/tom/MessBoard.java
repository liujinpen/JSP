package tom;
import java.util.*;
import java.text.SimpleDateFormat;
public class MessBoard {
    String name,title,content;
    StringBuffer allMessage;
    ArrayList <String> savedName,savedTitle,savedContent,savedTime;
    public MessBoard(){
        savedName=new ArrayList<String>();
        savedTitle=new ArrayList<String>();
        savedContent=new ArrayList<String>();
        savedTime=new ArrayList<String>();
    }

    public void setName(String name){
        try {
            byte bb[]=name.getBytes("iso-8859-1");
            name=new String(bb);
        }
        catch (Exception e){}
        this.name=name;
        if(savedName!=null&&!savedName.equals("")){
            savedName.add(this.name);
        }
        Date time=new Date();
        SimpleDateFormat matter=new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss");
        String messTime=matter.format(time);
        if(savedTime!=null){
            savedTime.add(messTime);
        }
    }
    public void setTitle(String title){
        try {
            byte bb[]=title.getBytes("iso-8859-1");
            title=new String(bb);
        }
        catch (Exception e){}
        this.title =title;
        if(savedTitle!=null&&!savedTitle.equals("")){
            savedTitle.add(this.title);
        }
    }
    public void setContent(String content){
        try {
            byte bb[]=content.getBytes("iso-8859-1");
            content=new String(bb);
        }
        catch (Exception e){}
        this.content=content;
        if(savedContent!=null&&!savedContent.equals("")){
            savedContent.add(this.content);
        }
    }

    public StringBuffer getAllMessage(){
        allMessage=new StringBuffer();
        allMessage.append("<table border=1>");
        allMessage.append("<tr>");
        allMessage.append("<th>留言者姓名</th>");
        allMessage.append("<th>留言标题</th>");
        allMessage.append("<th>留言内容</th>");
        allMessage.append("<th>留言时间</th>");
        allMessage.append("<tr>");

        for (int k=0;k<savedName.size();k++){
            allMessage.append("<tr>");

            allMessage.append("<td>");
            allMessage.append(savedName.get(k));
            allMessage.append("</td>");

            allMessage.append("<td>");
            allMessage.append(savedTitle.get(k));
            allMessage.append("</td>");

            allMessage.append("<td>");
            allMessage.append("<textarea>");
            allMessage.append(savedContent.get(k));
            allMessage.append("</textarea>");
            allMessage.append("</td>");

            allMessage.append("<td>");
            allMessage.append(savedTime.get(k));
            allMessage.append("</td>");

            allMessage.append("</tr>");
        }
        allMessage.append("</table>");
        return  allMessage;
    }
}
