<%--
  User: Francisco Lucas Sens
  Date: 08-Sep-17
  Time: 02:14 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Escola</title>
    <link rel="stylesheet" href="assets/libs/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/menu-superior.css">
    <link rel="stylesheet" type="text/css" href="css/utils.css">
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<h2 class="titulo">Cadastro de Escola</h2>

<form action="aluno_acao_cadastrar.jsp" method="post">
    <div>
        <label for="escola-nome">Nome</label>
        <input type="text" name="escola-nome" id="escola-nome" required="required">
    </div>
    <div>
        <label for="escola-cnpj">CNPJ</label>
        <input type="text" name="escola-cnpj" id="escola-cnpj" required="required">
    </div>
    <div>
        <label for="escola-quantidade-escolas">Quantidade Salas</label>
        <input type="text" name="escola-quantidade-salas" id="escola-quantidade-escolas">
    </div>
    <div>
        <label for="escola-tipo-escola">Tipo Escola</label>
        <select id="escola-tipo-escola" name="escola-tipo-escola">
            <option></option>
            <option value="E">Estadual</option>
            <option value="F">Fundamental</option>
            <option value="M">Municipal</option>
        </select>
    </div>
    <div>
        <label>Campo de Futebol</label>
        <br />
        <input type="checkbox" name="escola-campo-futebol" value="true" id="escola-campo-futebol">
        <label for="escola-campo-futebol">Sim</label>
    </div>
    <div>
        <label>Campo de Futebol</label>
        <br />
        <input type="radio" name="escola-biblioteca" value="true" id="escola-biblioteca-sim">
        <label for="escola-biblioteca-sim">Sim</label>
        <input type="radio" name="escola-biblioteca" value="false" id="escola-biblioteca-nao">
        <label for="escola-biblioteca-nao">Não</label>
    </div>
</form>

</body>
</html>
