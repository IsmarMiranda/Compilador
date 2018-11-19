/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizado_Lexico;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carlo
 */
public class GeneradorSintactico {
    
    public static void main(String args[]){
        
        
        String opciones[] = new String[5];
        opciones[0] = "-destdir";
        opciones[1] = "src"+File.separator+"Analizado_Lexico";
        opciones[2] = "-parser";
        opciones[3] = "Ejemplosintactico";
        opciones[4] = "src"+File.separator+"Analizado_Lexico"+File.separator+"Sintactico.cup";
        
        try {
            java_cup.Main.main(opciones);
        } catch (IOException ex) {
            Logger.getLogger(GeneradorSintactico.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GeneradorSintactico.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }  
    
}
