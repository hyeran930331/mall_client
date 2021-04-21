package mall.client.model;

import java.sql.*;
import mall.client.vo.*;
import mall.client.commons.*;

public class StatsDao {
	private DBUtil dbutil ;
	
	public Stats selectStatsByToday() {
		this.dbutil = new DBUtil(); //DB연걸
		
		Stats stats = null;
		Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

		// #오늘 카운트 있는지?
		// SELECT stats_day statsDay, stats_count statsCount FROM stats where stats_day=DATA())
		
		
		try {
			conn = this.dbutil.getConnection();
			String sql = "SELECT stats_day statsDay, stats_count statsCount FROM stats WHERE stats_day = DATE(NOW())";
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt + "<--selectStatsByToday");

			rs = stmt.executeQuery();
			if (rs.next()) {
				stats = new Stats();
				stats.setStatsCount(rs.getLong("statsCount"));
				stats.setStatsDay(rs.getString("statsDay"));
			}
		}catch(Exception e) {
			e.printStackTrace(); //ctrl+space 로 알아냄.
		}finally {
			//트라이든 캐치든 하는거
			dbutil.close(rs, stmt, conn);
		}
		
		return stats;
	}
	
	public void insertStats() {
		this.dbutil = new DBUtil(); //DB연걸
		// #오늘 카운트 없으면 1을 입력:
		//INSERT INTO stats(stats_day, stats_count) VALUES (NOW(),1)
		Connection conn = null;
	      PreparedStatement stmt = null;

	      try {
	         conn = this.dbutil.getConnection();
	         String sql = "INSERT INTO stats(stats_day, stats_count) VALUES (DATE(NOW()),1)";
	         stmt = conn.prepareStatement(sql);

	         System.out.println(stmt + "<--insertStats()");

	         stmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         this.dbutil.close(null, stmt, conn);
	      }
	   }

		
	
	
	public void updateStats() {
		this.dbutil = new DBUtil(); //DB연걸
		//#오늘 카운트가 있으면 +1
		//UPDATE stats SET stats_count = stats_count+1 WHERE stats_day = NOW();
		 Connection conn = null;
	      PreparedStatement stmt = null;

	      try {
	         conn = this.dbutil.getConnection();
	         String sql = "UPDATE stats SET stats_count = stats_count+1 WHERE stats_day = DATE(NOW())";
	         stmt = conn.prepareStatement(sql);

	         System.out.println(stmt + "<--updateStats()");

	         stmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         this.dbutil.close(null, stmt, conn);
	      }

	}
	
	public long selectStatsTotal() {
		this.dbutil = new DBUtil(); //DB연걸
		//#전체 카운트를 세면
		//SELECT COUNT(stats_count) total FROM stats
		
		long total = 0;

	      Connection conn = null;
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	      try {
	         String sql = "SELECT SUM(stats_count) total FROM stats";
	         conn = this.dbutil.getConnection();
	         stmt = conn.prepareStatement(sql);
	         System.out.println(stmt + "<--selectStatsTotal()");
	         rs = stmt.executeQuery();

	         if (rs.next()) {
	            total = rs.getLong("total");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         this.dbutil.close(rs, stmt, conn);
	      }
	      return total;
	   }

	}
