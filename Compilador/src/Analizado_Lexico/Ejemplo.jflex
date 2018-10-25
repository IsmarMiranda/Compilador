package Analizado_Lexico;


import java.util.ArrayList;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileNotFoundException;

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
 
/*-----------------------ESCRIBIR EN TOKEN--------------------------------*/     
    public void EscribirArchivo(String cadena) {
        try {
            FileWriter fw = new FileWriter(ruta, true);
            fw.write(cadena);
            fw.close();
        } catch (IOException ex) {
     
        }
    }
/*-----------------------------------------------------------------------*/

/*---------------------FUNCION VERIFICAR INCLUIR------------------------*/        
    public void EscribirArchivoInclude(String cadena) {
        try {
            FileWriter fw = new FileWriter("src"+File.separator+"compilador"+File.separator+"include.txt", true);
            fw.write(cadena);
            fw.close();
        } catch (IOException ex) {
     
        }
    }
     public void VerificarArchivo(String rutaX) {
        File af = new File("src" + File.separator + "compilador" + File.separator + rutaX);
        if (af.isFile() && af.exists()) {
            System.out.println("EL ARCHIVO EXISTE");

            String cadena;
            FileReader f = null;
            try {
                f = new FileReader("src" + File.separator + "compilador" + File.separator + rutaX);
            } catch (FileNotFoundException ex) {

            }
            BufferedReader b = new BufferedReader(f);
            try {
                while ((cadena = b.readLine()) != null) {
                    System.out.println(cadena);
                    EscribirArchivoInclude(cadena + "\r\n");

                }
            } catch (IOException ex) {

            }
            try {
                b.close();
            } catch (IOException ex) {

            }
        } else {
            System.out.println("EL ARCHIVO NO EXISTE");
        }
    }
     
/*----------------------------------------------------------------------*/
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
Error = [0-9][a-zA-Z][a-zA-Z]*
/*-------------------------------------------------------------------------*/

/*--------------------------------Libreria--------------------------*/
libreria = [a-zA-Z]*[.][a-zA-Z]*
/*-------------------------------------------------------------------------*/

/*---------------------------- Espacios--------------------------------------*/
LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f] | [ ]
/*---------------------------------------------------------------------------*/

/*-------------------------------Comentarios-------------------------------*/
Comentario1 = {Div}{2}([a-zA-Z0-9]*{Caracteres}*(\s)*[a-zA-Z0-9]*{Caracteres}*)
Comentario2 = {Div}{Mult}([a-zA-Z0-9]*{Caracteres}*(\s)*[a-zA-Z0-9]*{Caracteres}*){Div}{Mult}

Comentarios = {Comentario1}|{Comentario2}
/*---------------------------------------------------------------------------*/

/*-------------------------------TEXTO---------------------------------------*/
Texto1 = [a-zA-Z0-9]*{Caracteres}*

Texto = {Comillas}{Texto1}(\s)*{Texto1}{Comillas}  
/*---------------------------------------------------------------------------*/

/*-------------------------------Caracteres----------------------------------*/
C1 =\#
C2 =\$
C3 =\%
C4 =\&
C5 =\'
C6 =\¿
C7 =\¡

Caracteres = {C1}|{C2}|{C3}|{C4}|{C5}|{C6}|{C7}
/*---------------------------------------------------------------------------*/



%%
{Texto}                {System.out.println("Texto: "+yytext());}

{Error}                {System.out.println("ERROR: "+yytext());} 

{Comentarios}          {System.out.println("Comentario: "+yytext());} 

{Reservadas}           {System.out.println("RESERVADA: "+yytext());     reserL.add(yytext());   EscribirArchivo("RESERVADA: " +     yytext()+ "\r\n");}
                            
{Identificador}        {System.out.println("Identificador: "+yytext()); identL.add(yytext());   EscribirArchivo("IDENTIFICADOR: " + yytext()+ "\r\n");}

{Operadores}           {System.out.println("OPERADOR: "+yytext());      operaL.add(yytext());   EscribirArchivo("OPERADORES: " +    yytext()+ "\r\n");}

{Numero}               {System.out.println("NUMERO: "+yytext());        numL.add(yytext());     EscribirArchivo("NUMERO: " +        yytext()+ "\r\n");}

{Signos}               {System.out.println("SIGNOS: "+yytext());        signL.add(yytext());    EscribirArchivo("SIGNOS: " +        yytext()+ "\r\n");} 

{libreria}            {System.out.println("LIBRERIA: "+yytext()); VerificarArchivo(yytext());}   

. {System.out.println("Error lexico:" +yytext());}

   



