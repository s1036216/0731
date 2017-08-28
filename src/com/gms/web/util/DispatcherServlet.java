package com.gms.web.util;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//겔러시 완성대서옴
public class DispatcherServlet {
   public static void send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      request.getRequestDispatcher(Separator.cmd.getView()).forward(request, response);
   }
}