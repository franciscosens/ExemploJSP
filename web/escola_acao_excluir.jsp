<%@ page import="dao.EscolaDAO" %>
<%@ page import="model.Escola" %><%
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        if(id > 0){
            EscolaDAO.excluir(id);
            Escola escola = EscolaDAO.retornarEscolaPorId(id);
            if(escola == null){
                response.sendRedirect("escola_lista.jsp?message=ok");
            }else{
                response.sendRedirect("escola_lista.jsp?message=errou");
            }
        }
    }catch (NumberFormatException e){

    }
%>