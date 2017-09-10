package model;

public class Escola {

    private int id;
    private String nome, cnpj;
    private boolean biblioteca, campoFutebol;
    private byte quantidadeSalas;
    private char tipoEscola;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public boolean isBiblioteca() {
        return biblioteca;
    }

    public void setBiblioteca(boolean biblioteca) {
        this.biblioteca = biblioteca;
    }

    public boolean isCampoFutebol() {
        return campoFutebol;
    }

    public void setCampoFutebol(boolean campoFutebol) {
        this.campoFutebol = campoFutebol;
    }

    public byte getQuantidadeSalas() {
        return quantidadeSalas;
    }

    public void setQuantidadeSalas(byte quantidadeSalas) {
        this.quantidadeSalas = quantidadeSalas;
    }

    public char getTipoEscola() {
        return tipoEscola;
    }

    public void setTipoEscola(char tipoEscola) {
        this.tipoEscola = tipoEscola;
    }
}
