package mall.client.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") //모든요청
public class EncodingFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//request
		//controller의 (HttpServletRequest)의 부모가(ServletRequest)
		request.setCharacterEncoding("utf-8");
		System.out.println("Encoding utf-8");
		
		chain.doFilter(request, response);
		//response
	}

}
