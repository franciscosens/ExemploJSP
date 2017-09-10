<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Aluno" %>
<%@ page import="dao.AlunoDAO" %>
<%--
  User: Francisco Lucas Sens
  Date: 28-Aug-17
  Time: 06:10 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Lista de Alunos</title>
    <link rel="stylesheet" href="assets/libs/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/menu-superior.css">
    <link rel="stylesheet" type="text/css" href="css/alunolista.css">
    <link rel="stylesheet" type="text/css" href="css/tabela.css">
    <link rel="stylesheet" type="text/css" href="css/utils.css">
</head>
<body>

<jsp:include page="menu_superior.jsp"/>
<div>
    <h2 class="titulo">Lista de Alunos</h2>
</div>
<div class="novo-direita">
    <a href="aluno_cadastro.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Cadastro</a>
</div>
<% ArrayList<Aluno> alunos = AlunoDAO.retornarAlunos(); %>
<div class="div-lista">
    <table>
        <thead>
        <tr>
            <th class="coluna-codigo">Código</th>
            <th class="coluna-nome">Nome</th>
            <th class="coluna-email">E-mail</th>
            <th class="coluna-acao">Ação</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>E-mail</th>
            <th>Ação</th>
        </tr>
        </tfoot>
        <tbody>

        <% for (Aluno aluno : alunos) { %>
        <tr>
            <td class="texto-centro"><%= aluno.getId() %>
            </td>
            <td><%= aluno.getNome()%>
            </td>
            <td><%= aluno.getEmail() %>
            </td>
            <td class="texto-direita">
                <a class="icone-editar" href="aluno_alterar.jsp?id=<%=aluno.getId()%>"><i class="fa fa-pencil"></i></a>
                <a class="icon-excluir" href="aluno_acao_excluir.jsp?id=<%=aluno.getId()%>"><i class="fa fa-trash"></i></a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
