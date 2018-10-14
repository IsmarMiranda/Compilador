package Analizado_Lexico;

%%

%class Analizador_Lexico1
%unicode
%line
%column
%public
%standalone

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

%%  

{Reservadas}           {System.out.println("RESERVADA: "+yytext());}

{Identificador}        {System.out.println("Identificador: "+yytext());}

{Operadores}           {System.out.println("OPERADOR: "+yytext());}

