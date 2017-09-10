<%@ page import="model.Escola" %>
<%@ page import="dao.EscolaDAO" %><%
    Escola escola = new Escola();

    escola.setNome(request.getParameter("escola-nome"));
    escola.setCnpj(request.getParameter("escola-cnpj"));
    escola.setBiblioteca(Boolean.parseBoolean(request.getParameter("escola-biblioteca")));
    escola.setCampoFutebol(Boolean.parseBoolean(request.getParameter("escola-campo-futebol")));
    escola.setQuantidadeSalas(Byte.parseByte(request.getParameter("escola-quantidade-salas")));
    escola.setTipoEscola(request.getParameter("escola-tipo").charAt(0));

    int id = EscolaDAO.inserir(escola);
    if(id > 0){
        response.sendRedirect("escola_alterar.jsp?id="+id);
    }else{

    }
%>