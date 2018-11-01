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
INCLUIR  = (incluir)
CLASE    = "clase"
FUNCION  = "funcion"
SI       = "si"
SINO     = sino
ENTONCES = entonces
RETORNAR = retornar
ESCRIBIR = escribir
ABRIR    = abrir
DESDE    = desde
MIENTRAS = mientras
HACER    = hacer
INCREMENTAR = incrementar
ITERAR   = iterar
PARACADA = paracada
PRINCIPAL = principal
NUMERO   = numero
CADENA   = cadena
BOOLEANO = booleano
NULO     = nulo
VERDADERO = verdadero
FALSO     = falso
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

{Texto}                {System.out.println("Texto: "+yytext());}

{Comentarios}          {System.out.println("Comentario: "+yytext());} 

{Numero}               {System.out.println("NUMERO: "+yytext());        numL.add(yytext());     EscribirArchivo("NUMERO: " +        yytext()+ "\r\n");}
 
{libreria}            {System.out.println("LIBRERIA: "+yytext()); VerificarArchivo(yytext());}   

/*--------------------------------------- PALABRAS RESERVADAS -------------------------------------------------*/

{INCLUIR}               {System.out.println("RESERVADA: "+yytext());}
{CLASE}                 {System.out.println("RESERVADA: "+yytext());}
{FUNCION}               {System.out.println("RESERVADA: "+yytext());}
{SI}                    {System.out.println("RESERVADA: "+yytext());}
{SINO}                  {System.out.println("RESERVADA: "+yytext());}
{ENTONCES}              {System.out.println("RESERVADA: "+yytext());}
{RETORNAR}              {System.out.println("RESERVADA: "+yytext());}
{ESCRIBIR}              {System.out.println("RESERVADA: "+yytext());}
{ABRIR}                 {System.out.println("RESERVADA: "+yytext());}
{DESDE}                 {System.out.println("RESERVADA: "+yytext());}
{MIENTRAS}              {System.out.println("RESERVADA: "+yytext());}
{HACER}                 {System.out.println("RESERVADA: "+yytext());}
{INCREMENTAR}           {System.out.println("RESERVADA: "+yytext());}
{ITERAR}                {System.out.println("RESERVADA: "+yytext());}
{PARACADA}              {System.out.println("RESERVADA: "+yytext());}
{PRINCIPAL}             {System.out.println("RESERVADA: "+yytext());}
{NUMERO}                {System.out.println("RESERVADA: "+yytext());}
{CADENA}                {System.out.println("RESERVADA: "+yytext());}
{BOOLEANO}              {System.out.println("RESERVADA: "+yytext());}
{NULO}                  {System.out.println("RESERVADA: "+yytext());}
{VERDADERO}             {System.out.println("RESERVADA: "+yytext());}
{FALSO}                 {System.out.println("RESERVADA: "+yytext());}
  
/*------------------------------------------------------------------------------------------------------------*/
{Identificador}        {System.out.println("Identificador: "+yytext()); identL.add(yytext());   EscribirArchivo("IDENTIFICADOR: " + yytext()+ "\r\n");}
/*----------------------------------------------OPERADORES ---------------------------------------------------*/

{Suma}                {System.out.println("Operador: "+yytext());}
{Resta}               {System.out.println("Operador: "+yytext());}
{Mult}                {System.out.println("Operador: "+yytext());}
{Div}                 {System.out.println("Operador: "+yytext());}
{Potencia}            {System.out.println("Operador: "+yytext());}
{Menor}               {System.out.println("Operador: "+yytext());}
{Mayor}               {System.out.println("Operador: "+yytext());}
{MayorIgual}          {System.out.println("Operador: "+yytext());}
{MenorIgual}          {System.out.println("Operador: "+yytext());}
{Disyuncion}          {System.out.println("Operador: "+yytext());}
{Conjuncion}          {System.out.println("Operador: "+yytext());}
{Modulo}              {System.out.println("Operador: "+yytext());}

/*------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------SIGNOS--------------------------------------------------------*/

{CorcheteIni}         {System.out.println("SIGNO: "+yytext());}
{CorcheteFin}         {System.out.println("SIGNO: "+yytext());}
{DosPuntos}           {System.out.println("SIGNO: "+yytext());}
{PuntoComa}           {System.out.println("SIGNO: "+yytext());}
{Coma}                {System.out.println("SIGNO: "+yytext());}
{Punto}               {System.out.println("SIGNO: "+yytext());}
{ParentesisIni}       {System.out.println("SIGNO: "+yytext());}
{ParentesisFin}       {System.out.println("SIGNO: "+yytext());}
{LlaveIni}            {System.out.println("SIGNO: "+yytext());}
{LlaveFin}            {System.out.println("SIGNO: "+yytext());}
{Comillas}            {System.out.println("SIGNO: "+yytext());}

/*------------------------------------------------------------------------------------------------------------*/

. {System.out.println("Error lexico:" +yytext());}

   



