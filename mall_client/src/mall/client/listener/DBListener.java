package mall.client.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBListener implements ServletContextListener {


    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("Listener 1");
    }


    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("Listener 2");
    	
    }
	
}
