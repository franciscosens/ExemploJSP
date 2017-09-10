package dao;

import database.Conexao;
import model.Aluno;
import model.Escola;
import sun.rmi.runtime.Log;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.System.out;

public class EscolaDAO {

    public static int inserir(Escola escola) {
        String sql = "INSERT INTO escolas(nome, cnpj, biblioteca, campo_futebol, quantidade_salas, tipo_escola)\n" +
                "VALUES (?,?,?,?,?);";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, escola.getNome());
            ps.setString(1, escola.getCnpj());
            ps.setBoolean(2, escola.isBiblioteca());
            ps.setBoolean(3, escola.isCampoFutebol());
            ps.setByte(4, escola.getQuantidadeSalas());
            ps.setString(5, String.valueOf(escola.getTipoEscola()));
            ps.execute();
            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            Conexao.desconectar();
        }
        return -1;
    }

    public static int alterar(Escola escola) {
        String sql = "UPDATE escolas SET nome = ?, cnpj = ?, biblioteca = ?, campo_futebol = ?, quantidade_salas = ?, tipo_escola = ? WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setString(1, escola.getNome());
            ps.setString(1, escola.getCnpj());
            ps.setBoolean(2, escola.isBiblioteca());
            ps.setBoolean(3, escola.isCampoFutebol());
            ps.setByte(4, escola.getQuantidadeSalas());
            ps.setString(5, String.valueOf(escola.getTipoEscola()));
            ps.setInt(6, escola.getId());
            ps.executeUpdate();
            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            Conexao.desconectar();
        }
        return -1;
    }

    public static Escola retornarEscolaPorId(int id) {
        Escola escola = null;
        String sql = "SELECT id, nome, cnpj, biblioteca, campo_futebol, quantidade_salas, tipo_escola FROM escolas WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet resultados = ps.getResultSet();
            while(resultados.next()){
                escola = new Escola();
                escola.setId(resultados.getInt("id"));
                escola.setNome(resultados.getString("nome"));
                escola.setCnpj(resultados.getString("cnpj"));
                escola.setBiblioteca(resultados.getBoolean("biblioteca"));
                escola.setCampoFutebol(resultados.getBoolean("campo_futebol"));
                escola.setQuantidadeSalas(resultados.getByte("quantidade_salas"));
                escola.setTipoEscola(resultados.getString("quantidade_salas").charAt(0));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Conexao.desconectar();
        }
        return escola;
    }

    public static ArrayList<Escola> retornarEscolas() {
        ArrayList<Escola> escolas = new ArrayList<>();
        String sql = "SELECT id, nome, cnpj, biblioteca, campo_futebol, quantidade_salas, tipo_escola FROM escolas";
        try {
            Statement statement = Conexao.conectar().createStatement();
            statement.execute(sql);
            ResultSet resultados = statement.getResultSet();
            while (resultados.next()) {
                Escola escola = new Escola();
                escola.setId(resultados.getInt("id"));
                escola.setNome(resultados.getString("nome"));
                escola.setCnpj(resultados.getString("cnpj"));
                escola.setBiblioteca(resultados.getBoolean("biblioteca"));
                escola.setCampoFutebol(resultados.getBoolean("campo_futebol"));
                escola.setQuantidadeSalas(resultados.getByte("quantidade_salas"));
                String tipoEscola = resultados.getString("tipo_escola");
                if(tipoEscola != null) {
                    escola.setTipoEscola(tipoEscola.charAt(0));
                }

                escolas.add(escola);
            }
        }catch (Exception e){
//        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Conexao.desconectar();
        }
        return escolas;
    }

    public static void excluir(int id) {
        String sql = "DELETE FROM escolas WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
