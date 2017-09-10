<%@ page import="model.Aluno" %>
<%@ page import="dao.AlunoDAO" %>
<%@ page import="dao.EscolaDAO" %>

<%
    Aluno aluno = new Aluno();
    aluno.setEscola(EscolaDAO.retornarEscolaPorId(Integer.parseInt(request.getParameter("aluno-id-escola"))));
    aluno.setNome(request.getParameter("aluno-nome"));
    aluno.setEmail(request.getParameter("aluno-email"));
    aluno.setSenha(request.getParameter("aluno-senha"));
    aluno.setDescricao(request.getParameter("aluno-descricao"));
    aluno.setObservacao(request.getParameter("aluno-observacao"));
    int resultado = AlunoDAO.inserir(aluno);
    response.sendRedirect("index.jsp?msg=" + resultado);
%>