package Analizado_Lexico;


import java.util.ArrayList;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


%%

%class Analizador_Lexico1
%unicode
%line
%column
%public
%standalone
 

%{


String ruta = "src"+File.separator+"compilador"+File.separator+"tokens.txt";


/*-----------------------------LISTAS PARA LOS TOKENS----------------------*/
      ArrayList<String> numL = new ArrayList<>();
      ArrayList<String> operaL = new ArrayList<>();
      ArrayList<String> identL = new ArrayList<>();
      ArrayList<String> reserL = new ArrayList<>();
      ArrayList<String> signL = new ArrayList<>();
/*-------------------------------------------------------------------------*/    
      public void EscribirArchivo(String cadena) {
        try {
            FileWriter fw = new FileWriter(ruta, true);
            fw.write(cadena);
            fw.close();
        } catch (IOException ex) {
     
        }
    }


    
%}



/*-------------------------------NUMEROS----------------------------------*/
Numero = 0 | [1-9][0-9]*

/*-------------------------------------------------------------------------*/


/*--------------------------------Identificadores--------------------------*/
Identificador = [a-zA-Z]([0-9]|[a-zA-Z])*
/*-------------------------------------------------------------------------*/

/*----------------------------Palabras Reservadas--------------------------*/
Reservadas = incluir | clase | funcion | si | sino | entonces | retornar | escribir | abrir | desde | mientras | hacer | incremenrar | iterar | paracada | principal | numero | cadena | booleano | nulo | verdadero | falso
/*-------------------------------------------------------------------------*/

/*---------------------------------- Operadores----------------------------*/
Suma = \+
Resta = \-
Mult = \*
Div = \/
Potencia = \^
Menor = \<
Mayor = \>
Igual = \=
MayorIgual = {Mayor}{Igual}
MenorIgual = {Menor}{Igual}
Disyuncion = OR
Conjuncion = AND

Operadores = {Suma}|{Resta}|{Mult}|{Div}|{Potencia}|{Igual}|{Disyuncion}|{Conjuncion}|{Menor}|{Mayor}|{MayorIgual}|{MenorIgual}
/*------------------------------------------------------------------------------------------------------------*/

/*-------------------------------SIGNOS----------------------------------*/
CorcheteIni = \[
CorcheteFin = \]
DosPuntos =   \:
PuntoComa =   \;
Coma      =   \,
Punto     =   \.
ParentesisIni= \(
ParentesisFin= \)
LlaveIni     = \{
LlaveFin     = \}
Comillas     = \"
Signos = {ParentesisIni}|{ParentesisFin}|{CorcheteIni}|{CorcheteFin}|{DosPuntos}|{PuntoComa}|{Coma}|{Punto}|{LlaveIni}|{LlaveFin}|{Comillas}
/*-------------------------------------------------------------------------*/

/*--------------------------------Errores--------------------------*/
Error = [0-9]*[a-zA-Z]*
/*-------------------------------------------------------------------------*/


%%

{Reservadas}           {System.out.println("RESERVADA: "+yytext());     reserL.add(yytext());   EscribirArchivo("RESERVADA: " +     yytext()+ "\r\n");}

{Identificador}        {System.out.println("Identificador: "+yytext()); identL.add(yytext());   EscribirArchivo("IDENTIFICADOR: " + yytext()+ "\r\n");}

{Operadores}           {System.out.println("OPERADOR: "+yytext());      operaL.add(yytext());   EscribirArchivo("OPERADORES: " +    yytext()+ "\r\n");}

{Numero}               {System.out.println("NUMERO: "+yytext());        numL.add(yytext());     EscribirArchivo("NUMERO: " +        yytext()+ "\r\n");}

{Signos}               {System.out.println("SIGNOS: "+yytext());        signL.add(yytext());    EscribirArchivo("SIGNOS: " +        yytext()+ "\r\n");} 

{Error}               {System.out.println("ERROR: "+yytext());} 

. {System.out.println("Error lexico:" +yytext());}

    



