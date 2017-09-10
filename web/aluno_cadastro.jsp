<%--
  User: Francisco Lucas Sens
  Date: 28-Aug-17
  Time: 06:15 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Aluno</title>
    <link rel="stylesheet" href="assets/libs/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/menu-superior.css">
    <link rel="stylesheet" type="text/css" href="css/utils.css">
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<h2 class="titulo">Cadastro de Alunos</h2>
<form method="POST" action="aluno_acao_cadastrar.jsp">
    <div>
        <label for="aluno-id">Código</label>
        <input type="number" name="aluno-id" id="aluno-id">
    </div>
    <br />
    <div>
        <label for="aluno-nome">Nome</label>
        <input name="aluno-nome" id="aluno-nome">
    </div>
    <br />
    <div>
        <label for="aluno-email">E-mail</label>
        <input type="email" name="aluno-email" id="aluno-email">
    </div>
    <br />
    <div>
        <label for="aluno-senha">Senha</label>
        <input type="password" name="aluno-senha" id="aluno-senha">
    </div>
    <br />
    <div>
        <label for="aluno-data-nascimento">Data Nascimento</label>
        <input type="date" name="aluno-data-nascimento" id="aluno-data-nascimento">
    </div>
    <br />
    <div>
        <label for="aluno-descricao">Descrição</label>
        <textarea name="aluno-descricao" id="aluno-descricao"></textarea>
    </div>
    <br />
    <div>
        <label for="aluno-observacao">Observação</label>
        <textarea name="aluno-observacao" id="aluno-observacao"></textarea>
    </div>
    <input type="submit" value="Cadastrar">
</form>

</body>
</html>
