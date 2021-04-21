package mall.client.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.*;
import mall.client.vo.Ebook;
import mall.client.vo.Stats;

// C -> M -> V
@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
	private EbookDao ebookDao;
	private OrdersDao ordersDao;
	private StatsDao statsDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("========== IndexController");
		
		// request 분석
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 15;
		int beginRow = (currentPage-1)*rowPerPage;
		System.out.printf("curretnPage:%d, beginRow:%d \n", currentPage, beginRow);
		// model 호출
		// 베스트 ebook
		this.ordersDao = new OrdersDao();
		List<Map<String, Object>> bestOrdersList = this.ordersDao.selectBestOrdersList();
		// 전체 ebook
		this.ebookDao = new EbookDao();
		List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage);
		
		// 살수있는 ebook
		this.ebookDao = new EbookDao();
		List<Ebook> ebookCanBuyList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage, "판매중");
		
		//접속자수 데이터
		this.statsDao = new StatsDao();
		long total = this.statsDao.selectStatsTotal();
		Stats stats = this.statsDao.selectStatsByToday();
		
		long statsCount = 0;
		if (stats != null) {
			statsCount = this.statsDao.selectStatsByToday().getStatsCount();
		}
		
		
		// View forward
		request.setAttribute("bestOrdersList", bestOrdersList);
		request.setAttribute("ebookList", ebookList);
		request.setAttribute("ebookCanBuyList", ebookCanBuyList);
		request.setAttribute("rowPerPage", rowPerPage-2 );
		request.setAttribute("bestOrdersListSize", bestOrdersList.size());
		
		request.setAttribute("total", total);
		request.setAttribute("statsCount", statsCount);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response);
	}
}
