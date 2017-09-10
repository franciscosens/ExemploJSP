<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Escola" %>
<%@ page import="dao.EscolaDAO" %>
<%--
  User: Francisco Lucas Sens
  Date: 08-Sep-17
  Time: 02:14 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Escolas</title>
    <link rel="stylesheet" href="assets/libs/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/menu-superior.css">
    <link rel="stylesheet" type="text/css" href="css/escolalista.css">
    <link rel="stylesheet" type="text/css" href="css/tabela.css">
    <link rel="stylesheet" type="text/css" href="css/utils.css">
</head>
<body>
<jsp:include page="menu_superior.jsp"/>
<div>
    <h2 class="titulo">Lista de Escolas</h2>
</div>
<div class="novo-direita">
    <a href="escola_cadastro.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Cadastro</a>
</div>
<% ArrayList<Escola> escolas = EscolaDAO.retornarEscolas(); %>
<div class="div-lista">
    <table>
        <thead>
        <tr>
            <th class="coluna-codigo">Código</th>
            <th class="coluna-nome">Nome</th>
            <th class="coluna-cnpj">CNPJ</th>
            <th class="coluna-acao">Ação</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>CNPJ</th>
            <th>Ação</th>
        </tr>
        </tfoot>
        <tbody>
        <% for (Escola escola : escolas) { %>
        <tr class="">
            <td class="texto-centro"><%= escola.getId() %>
            </td>
            <td><%= escola.getNome() %>
            </td>
            <td><%= escola.getCnpj() %>
            </td>
            <td class="texto-direita">
                <a class="icone-editar" href="escola_alterar.jsp?id=<%=escola.getId()%>"><i class="fa fa-pencil"></i></a>
                <a class="icon-excluir" href="escola_acao_excluir.jsp?id=<%=escola.getId()%>"><i class="fa fa-trash"></i></a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
