/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizado_Lexico;

import java.io.File;

/**
 *
 * @author carlo
 */
public class Generador_Lexico {
    
     public static void main(String[] args){
       
       System.out.println(System.getProperty("user.dir"));
       jflex.Main.generate(new File("src"+File.separator+"Analizado_Lexico"+File.separator+"Ejemplo.jflex"));
       
   }
    
}
