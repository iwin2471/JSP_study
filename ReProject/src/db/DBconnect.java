package db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBconnect {
	String id = "root";
	String passwd = "iwin247";

	public static void main(String[] args) {
		DBconnect dbc = new DBconnect();

		dbc.dbconnect();
		System.out.println(dbc.login("asdf", "��й�ȣ Ʋ����"));
	}

	public Connection dbconnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("����̹��� ã�� �� �����Ф�");
			return null;
		}

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", id, passwd);

			System.out.println("DB ������ �����߾��");

		} catch (SQLException e) {
			System.out.println("���� ������ SQL ���� �����");
		}

		return conn;
	}

	public ResultSet boardli() {
		String query = "SELECT * FROM test.board;";
		Connection con = dbconnect();
		
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(query);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs != null) {
				return rs;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int login(String id, String passwd) {
		String query = "select ID, PASSWORD from test.account where ID=?";

		Connection con = dbconnect();

		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				boolean check;
				String db_pass = rs.getString("PASSWORD");
				check = db_pass.equals(passwd);

				if (check) {
					con.close();
					return 0; // ���� �α���
				} else {
					con.close();
					return 1; // ��й�ȣ Ʋ��
				}
			}
			con.close();
			return 2; // ���� ���̵�
		} catch (SQLException e) {
			System.out.println("������ �߸�����");
			e.printStackTrace();
			return 3; // DB ����
		}
	}
	
	public int siggin(String id, String passwd){
		String query = "insert into account (ID, PASSWORD) VALUES(?, ?)";
		Connection con = dbconnect();

		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, passwd);
			
			preparedStatement.executeUpdate();
	
		} catch (SQLException e) {
			System.out.println("������ �߸�����");
			e.printStackTrace();
			return 3; // DB ����
		}
		
		return 0;
	}
}