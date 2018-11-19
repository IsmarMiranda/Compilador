/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizado_Lexico;

/**
 *
 * @author carlo
 */
public class Token {
     private int col;
    private int row;
    private String lexema;
    
    public Token(int col, int row, String lexema) {
        this.col = col;
        this.row = row;
        this.lexema = lexema;
    }

    public int getCol() {
        return col;
    }

    public int getRow() {
        return row;
    }

    public String getLexema() {
        return lexema;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }
    
}
