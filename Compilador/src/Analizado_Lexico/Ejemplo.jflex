package Analizado_Lexico;

import java_cup.runtime.Symbol;


import java.util.ArrayList;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileNotFoundException;

%%

%class Analizador_Lexico1
/*%unicode*/
%line
%column
%public
%cup
/*%standalone*/
 

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
Numero1 = 0 | [1-9][0-9]*
/*-------------------------------------------------------------------------*/


/*--------------------------------Identificadores--------------------------*/
Identificador = [a-zA-Z]([0-9]|[a-zA-Z])*
/*-------------------------------------------------------------------------*/

/*-------------------------------Indentacion--------------------------------*/
TAB = [\t] |[    ]
/*--------------------------------------------------------------------------*/

/*----------------------------Palabras Reservadas--------------------------*/
INCLUIR  = "incluir"
CLASE    = "clase"
FUNCION  = "funcion"
SI       = "si"
SINO     = "sino"
ENTONCES = "entonces"
RETORNAR = "retornar"
ESCRIBIR = "escribir"
ABRIR    = "abrir"
DESDE    = "desde"
MIENTRAS = "mientras"
HACER    = "hacer"
INCREMENTAR = "incrementar"
ITERAR   = "iterar"
PARACADA = "paracada"
PRINCIPAL = "principal"
NUMERO   = "numero"
CADENA   = "cadena"
BOOLEANO = "booleano"
NULO     = "nulo"
VERDADERO = "verdadero"
FALSO     = "falso"
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
Modulo     = \%
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
/*-------------------------------------------------------------------------*/

/*--------------------------------Errores--------------------------*/
Error = [0-9][a-zA-Z][a-zA-Z]*
/*-------------------------------------------------------------------------*/

/*--------------------------------Libreria--------------------------*/
libreria = [a-zA-Z]*{Punto}[a-zA-Z]*
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
Texto1 = [a-zA-Z0-9][a-zA-Z0-9]*

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

{TAB}                   {  
                            return new Symbol(sym.TAB,new Token(yycolumn,yyline,yytext()));
                        }

{Texto}                {System.out.println("Texto: "+yytext());}

{Comentarios}          {System.out.println("Comentario: "+yytext());} 

/*{libreria}            {System.out.println("LIBRERIA: "+yytext()); VerificarArchivo(yytext());}   */

/*--------------------------------------- PALABRAS RESERVADAS -------------------------------------------------*/

{Numero1}                {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.NUMERO,new Token(yycolumn,yyline,yytext()));
                        }

{INCLUIR}               {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.INCLUIR,new Token(yycolumn,yyline,yytext()));
                        }
{CLASE}                 {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.CLASE,new Token(yycolumn,yyline,yytext()));
                        }
{FUNCION}               {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.FUNCION,new Token(yycolumn,yyline,yytext()));
                        }
{SI}                    {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.SI,new Token(yycolumn,yyline,yytext()));
                        }
{SINO}                  {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.SINO,new Token(yycolumn,yyline,yytext()));
                        }
{ENTONCES}              {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.ENTONCES,new Token(yycolumn,yyline,yytext()));
                        }
{RETORNAR}              {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.RETORNAR,new Token(yycolumn,yyline,yytext()));
                        }
{ESCRIBIR}              {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.ESCRIBIR,new Token(yycolumn,yyline,yytext()));
                        }
{ABRIR}                 {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.ABRIR,new Token(yycolumn,yyline,yytext()));
                        }
{DESDE}                 {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.DESDE,new Token(yycolumn,yyline,yytext()));
                        }
{MIENTRAS}              {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.MIENTRAS,new Token(yycolumn,yyline,yytext()));
                        }
{HACER}                 {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.HACER,new Token(yycolumn,yyline,yytext()));
                        }
{INCREMENTAR}           {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.INCREMENTAR,new Token(yycolumn,yyline,yytext()));
                        }
{ITERAR}                {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.ITERAR,new Token(yycolumn,yyline,yytext()));
                        }
{PARACADA}              {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.PARACADA,new Token(yycolumn,yyline,yytext()));
                        }
{PRINCIPAL}             {
                            System.out.println("RESERVADA: "+yytext()); 
                            return new Symbol(sym.PRINCIPAL,new Token(yycolumn,yyline,yytext()));
                        }
{NUMERO}                {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.TNUMERO,new Token(yycolumn,yyline,yytext()));
                        }
{CADENA}                {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.CADENA,new Token(yycolumn,yyline,yytext()));
                        }
{BOOLEANO}              {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.BOOLEANO,new Token(yycolumn,yyline,yytext()));
                        }
{NULO}                  {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.NULO,new Token(yycolumn,yyline,yytext()));
                        }
{VERDADERO}             {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.VERDADERO,new Token(yycolumn,yyline,yytext()));
                        }
{FALSO}                 {
                            System.out.println("RESERVADA: "+yytext());
                            return new Symbol(sym.FALSO,new Token(yycolumn,yyline,yytext()));
                        }

{Disyuncion}          {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.DISY,new Token(yycolumn,yyline,yytext()));
                      }
{Conjuncion}          {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.CONJ,new Token(yycolumn,yyline,yytext()));
                      }
  
/*------------------------------------------------------------------------------------------------------------*/
{Identificador}        {System.out.println("Identificador: "+yytext()); identL.add(yytext());   EscribirArchivo("IDENTIFICADOR: " + yytext()+ "\r\n");}
/*----------------------------------------------OPERADORES ---------------------------------------------------*/

{Suma}                {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.SUMA,new Token(yycolumn,yyline,yytext()));
                      }
{Resta}               {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.RESTA,new Token(yycolumn,yyline,yytext()));
                      }
{Mult}                {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.MULT,new Token(yycolumn,yyline,yytext()));
                      }
{Div}                 {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.DIV,new Token(yycolumn,yyline,yytext()));
                      }
{Potencia}            {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.POTENCIA,new Token(yycolumn,yyline,yytext()));
                      }
{Menor}               {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.MENOR,new Token(yycolumn,yyline,yytext()));
                      }
{Mayor}               {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.MAYOR,new Token(yycolumn,yyline,yytext()));
                      }
{MayorIgual}          {System.out.println("Operador: "+yytext());}
{MenorIgual}          {System.out.println("Operador: "+yytext());}

{Modulo}              {
                            System.out.println("Operador: "+yytext());
                            return new Symbol(sym.MODULO,new Token(yycolumn,yyline,yytext()));
                      }

/*------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------SIGNOS--------------------------------------------------------*/

{CorcheteIni}         {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.CORCHETEINI,new Token(yycolumn,yyline,yytext()));
                      }
{CorcheteFin}         {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.CORCHETEFIN,new Token(yycolumn,yyline,yytext()));
                      }
{DosPuntos}           {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.DOSP,new Token(yycolumn,yyline,yytext()));
                      }
{PuntoComa}           {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.PCOMA,new Token(yycolumn,yyline,yytext()));
                      }
{Coma}                {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.COMA,new Token(yycolumn,yyline,yytext()));
                      }
{Punto}               {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.PUNTO,new Token(yycolumn,yyline,yytext()));
                      }
{ParentesisIni}       {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.PARINI,new Token(yycolumn,yyline,yytext()));
                      }
{ParentesisFin}       {
                            System.out.println("SIGNO: "+yytext());
                            return new Symbol(sym.PARFIN,new Token(yycolumn,yyline,yytext()));
                      }
{LlaveIni}            {System.out.println("SIGNO: "+yytext());}
{LlaveFin}            {System.out.println("SIGNO: "+yytext());}
    
/*------------------------------------------------------------------------------------------------------------*/

. {System.out.println("Error lexico:" +yytext());}

   



