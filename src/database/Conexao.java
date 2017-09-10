package database;

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class Conexao {

    private static Connection conexao;
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String HOST = "jdbc:mysql://localhost/salas_aulas";
    private static final String USUARIO = "localhost";
    private static final String SENHA = "localhost";


    public static Connection conectar(){
        try{
            Properties propriedades = new Properties();
            propriedades.setProperty("user", USUARIO);
            propriedades.setProperty("password", SENHA);

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(HOST, propriedades);
            return conexao;
        } catch (SQLException | ClassNotFoundException sqle) {
         sqle.printStackTrace();
            return null;
        }
    }

    public static void desconectar() {
        if (conexao != null) {
            try {
                conexao.close();
            } catch (SQLException sqle) {
                System.out.println(sqle.getMessage());
            }
        }
    }

    public static void truncate() {
        conectar();
        if (conexao != null) {
            try {
                Statement st = conexao.createStatement();
                st.addBatch("SET FOREIGN_KEY_CHECKS = 0;");
                st.addBatch("TRUNCATE TABLE tipos_empresas;");
                st.addBatch("TRUNCATE TABLE regioes;");
                st.addBatch("TRUNCATE TABLE empresas;");
                st.addBatch("TRUNCATE TABLE tipos_eventos;");
                st.addBatch("TRUNCATE TABLE eventos;");

                st.addBatch("SET FOREIGN_KEY_CHECKS = 1;");
                st.executeBatch();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                desconectar();
            }

        }
    }
}
