<%@ page import="dao.AlunoDAO" %>
<%@ page import="model.Aluno" %><%
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        if(id > 0){
            AlunoDAO.excluir(id);
            Aluno aluno = AlunoDAO.retornarAlunoPorId(id);
            if(aluno == null){
                response.sendRedirect("aluno_lista.jsp?message=ok");
            }else{
                response.sendRedirect("aluno_lista.jsp?message=errou");
            }
        }
    }catch (NumberFormatException e){

    }
%>