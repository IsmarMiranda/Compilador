/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import Analizado_Lexico.Analizador_Lexico1;
import java.awt.List;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carlo
 */
public class Compilador {

    public static void main(String[] args) {
        // TODO code application logic here
        Analizador_Lexico1 scanner = null;
        System.out.println("Ismar es el rey");
        try {

            FileInputStream stream = new FileInputStream("src" + File.separator + "compilador" + File.separator + "datos.txt");
            Reader reader = new InputStreamReader(stream);

            scanner = new Analizador_Lexico1(reader);
            while (!scanner.zzAtEOF) {
                scanner.yylex();
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    
}
