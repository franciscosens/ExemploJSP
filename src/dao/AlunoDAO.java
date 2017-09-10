package dao;

import database.Conexao;
import model.Aluno;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import static java.lang.System.out;

public class AlunoDAO {

    public static int inserir(Aluno aluno) {
        String sql = "INSERT INTO alunos(id_escola, nome, email, senha, observacao, descricao)\n" +
                "VALUES (?,?,?,?,?);";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, aluno.getNome());
            ps.setInt(1, aluno.getEscola().getId());
            ps.setString(2, aluno.getEmail());
            ps.setString(3, aluno.getSenha());
            ps.setString(4, aluno.getObservacao());
            ps.setString(5, aluno.getDescricao());
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

    public static int alterar(Aluno aluno) {
        return 0;
    }


    public static void excluir(int id) {
        String sql = "DELETE FROM alunos WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Aluno> retornarAlunos() {
        ArrayList<Aluno> alunos = new ArrayList<>();
        String sql = "SELECT id, id_escola, nome, email, descricao, observacao, data_nascimento FROM alunos";
        try {
            Statement statement = Conexao.conectar().createStatement();
            statement.execute(sql);
            ResultSet resultados = statement.getResultSet();
            while (resultados.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(resultados.getInt("id"));
                aluno.setEscola(EscolaDAO.retornarEscolaPorId(resultados.getInt("id_escola")));
                aluno.setNome(resultados.getString("nome"));
                aluno.setEmail(resultados.getString("email"));
                aluno.setDescricao(resultados.getString("descricao"));
                aluno.setObservacao(resultados.getString("observacao"));
                aluno.setDataNascimento(resultados.getDate("data_nascimento"));
                alunos.add(aluno);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexao.desconectar();
        }
        return alunos;
    }


    public static Aluno retornarAlunoPorId(int id) {
        Aluno aluno = null;
        String sql = "SELECT id, id_escola, nome, email, descricao, observacao, data_nascimento FROM alunos WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet resultados = ps.getResultSet();
            if (resultados.next()) {
                aluno = new Aluno();
                aluno.setId(resultados.getInt("id"));
                aluno.setEscola(EscolaDAO.retornarEscolaPorId(resultados.getInt("id_escola")));
                aluno.setNome(resultados.getString("nome"));
                aluno.setEmail(resultados.getString("email"));
                aluno.setDescricao(resultados.getString("descricao"));
                aluno.setObservacao(resultados.getString("observacao"));
                aluno.setDataNascimento(resultados.getDate("data_nascimento"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexao.desconectar();
        }
        return aluno;
    }
}
