package ict.itp4511_assignment.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/1 - 04 - 01 - 上午 12:41
 * @Description: tag
 * @version: 1.0
 */
public class Message extends SimpleTagSupport {
    private String message, type;

    public void setMessage(String message) {
        this.message = message;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void doTag() {
        try {
            PageContext pageContext = (PageContext) getJspContext();
            JspWriter out = pageContext.getOut();

            if (message != null && type != null) {
                switch (type) {
                    case "error":
                        out.print("<p class='font-bold text-red-500 text-4xl'>" + message + "</p>");
                        break;
                    case "info":
                        out.print("<p class='font-bold text-4xl flex justify-center mt-80'>" + message + "</p>");
                        break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
