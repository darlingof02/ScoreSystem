package test;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class example extends HttpServlet {
    public void doPost( HttpServletRequest request, HttpServletResponse response )
    {
        String output = null;
        try
        {
            String name = request.getParameter( "myname" );
            output = new String( "田成滨 " + name + "."  );
        }
        catch( Exception e)
        {
            System.err.println( e.toString() );
        }
        request.setAttribute("output",output);
        try
        {
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher( "/show_name.jsp" );
            rd.forward(request, response);
        }
        catch( Exception e )
        {}
    }
}

