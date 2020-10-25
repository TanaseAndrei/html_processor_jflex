package com.andrei;
import java_cup.runtime.*;
import java.util.*;
import com.andrei.tokens.Tokens;

%%
%class Lexer
%type Tokens
%unicode
%line
%column

Letters         = [a-zA-Z]
Digit           = [0-9]
LineTerminator  = \r|\n|\r\n
WhiteSpace      = {LineTerminator} | [\t]
Dot             = .

/* Nu functioneaza cu (?i) sau /element/i pentru case insensitive */
//HTML    =       /html/i
//BODY    =       /body/i
//HEAD    = 		/head/i

Aa = [A|a]
Bb = [B|b]
Cc = [C|c]
Dd = [D|d]
Ee = [E|e]
Ff = [F|f]
Gg = [G|g]
Hh = [H|h]
Ii = [I|i]
Jj = [J|j]
Kk = [K|k]
Ll = [L|l]
Mm = [M|m]
Nn = [N|n]
Oo = [O|o]
Pp = [P|p]
Qq = [Q|q]
Rr = [R|r]
Ss = [S|s]
Tt = [T|t]
Uu = [U|u]
Vv = [V|v]
Ww = [W|w]
Xx = [X|x]
Yy = [Y|y]
Zz = [Z|z]

HTML        = {Hh}{Tt}{Mm}{Ll}
BODY        = {Bb}{Oo}{Dd}{Yy}
FRAMESET    = {Ff}{Rr}{Aa}{Mm}{Ee}{Ss}{Ee}{Tt}
FRAME       = {Ff}{Rr}{Aa}{Mm}{Ee}
NOFRAME     = {Nn}{Oo}{Ff}{Rr}{Aa}{Mm}{Ee}
FORM        = {Ff}{Oo}{Rr}{Mm}
INPUT       = {Ii}{Nn}{Pp}{Uu}{Tt}
SELECT      = {Ss}{Ee}{Ll}{Ee}{Cc}{Tt}
OPTION      = {Oo}{Pp}{Tt}{Ii}{Oo}{Nn}
TABLE       = {Tt}{Aa}{Bb}{Ll}{Ee}
TR          = {Tt}{Rr}
TD          = {Tt}{Dd}
TH          = {Tt}{Hh}
THEAD       = {Tt}{Hh}{Ee}{Aa}{Dd}
TBODY       = {Tt}{Bb}{Oo}{Dd}{Yy}
IMG         = {Ii}{Mm}{Gg}
A           = {Aa}
LINK        = {Ll}{Ii}{Nn}{Kk}
UL          = {Uu}{Ll}
OL          = {Oo}{Ll}
LI          = {Ll}{Ii}
B           = {Bb}
I           = {Ii}
U           = {Uu}
SMALL       = {Ss}{Mm}{Aa}{Ll}{Ll}
SUP         = {Ss}{Uu}{Pp}
SUB         = {Ss}{Uu}{Bb}
CENTER      = {Cc}{Ee}{Nn}{Tt}{Ee}{Rr}
FONT        = {Ff}{Oo}{Nn}{Tt}
H1          = {Hh}1
H2          = {Hh}2
H3          = {Hh}3
H4          = {Hh}4
H5          = {Hh}5
H6          = {Hh}6
P           = {Pp}
HR          = {Hh}{Rr}
BR          = {Bb}{Rr}
SRC         = {Ss}{Rr}{Cc}

%{
    String lexeme;
%}

%%

/* Reguli lexicale */

<YYINITIAL> {
    {WhiteSpace}        {System.out.println("White space");}
    "<"                 {System.out.println("LT");}
    ">"                 {System.out.println("GT");}
    "="                 {System.out.println("EQUAL");}
    "/"                 {System.out.println("SLASH");}

    /* Tag-uri start */
    "<"({HTML})">"      { System.out.println("HTML"); }
    "<"({BODY})">"      { System.out.println("BODY"); }
    "<"({FRAMESET}" ")Dot     { System.out.println("FRAMESET"); }
    "<"({FRAME}" ")Dot"/>"      { System.out.println("FRAME"); }
    "<"({NOFRAME})">"      { System.out.println("NOFRAME"); }
    "<"({FORM}" ")">"      { System.out.println("FORM"); }
    "<"({INPUT}" ")Dot"/>"      { System.out.println("INPUT"); }
    "<"({SELECT}" ")Dot">"      { System.out.println("SELECT"); }
    "<"({OPTION})">"      { System.out.println("OPTION"); }
    "<"({TABLE})">"      { System.out.println("TABLE"); }
    "<"({TR})">"      { System.out.println("TR"); }
    "<"({TD})">"      { System.out.println("TD"); }
    "<"({THEAD})">"      { System.out.println("THEAD"); }
    "<"({TBODY})">"      { System.out.println("TBODY"); }
    "<"({IMG})">"      { System.out.println("IMG"); }
    "<"({A})">"      { System.out.println("A"); }
    "<"({LINK}" ")Dot">"      { System.out.println("LINK"); }
    "<"({UL})">"      { System.out.println("UL"); }
    "<"({OL})">"      { System.out.println("OL"); }
    "<"({LI})">"      { System.out.println("LI"); }
    "<"({B})">"      { System.out.println("B"); }
    "<"({I})">"      { System.out.println("I"); }
    "<"({U})">"      { System.out.println("U"); }
    "<"({SMALL})">"      { System.out.println("SMALL"); }
    "<"({SUP})">"      { System.out.println("SUP"); }
    "<"({SUB})">"      { System.out.println("SUB"); }
    "<"({CENTER})">"      { System.out.println("CENTER"); }
    "<"({FONT}" ")Dot">"      { System.out.println("FONT"); }
    "<"({H1})">"      { System.out.println("H1"); }
    "<"({H2})">"      { System.out.println("H2"); }
    "<"({H3})">"      { System.out.println("H3"); }
    "<"({H4})">"      { System.out.println("H4"); }
    "<"({H5})">"      { System.out.println("H5"); }
    "<"({H6})">"      { System.out.println("H6"); }
    "<"({P})">"      { System.out.println("P"); }
    "<"({HR})">"      { System.out.println("HR"); }
    "<"({BR})">"      { System.out.println("BR"); }
    ({SRC})"="      { System.out.println("SRC"); }

    /* Tag-uri sfarsit */
    "<"({HTML})">"      { System.out.println("HTML"); }
    "</"({BODY})">"      { System.out.println("BODY"); }
    "</"({NOFRAME})">"      { System.out.println("NOFRAME"); }
    "</"({FORM})">"      { System.out.println("FORM"); }
    "</"({INPUT})">"      { System.out.println("INPUT"); }
    "</"({SELECT})">"      { System.out.println("SELECT"); }
    "</"({OPTION})">"      { System.out.println("OPTION"); }
    "<"({TABLE})">"      { System.out.println("TABLE"); }
    "<"({TR})">"      { System.out.println("TR"); }
    "<"({TD})">"      { System.out.println("TD"); }
    "<"({THEAD})">"      { System.out.println("THEAD"); }
    "<"({TBODY})">"      { System.out.println("TBODY"); }
    "<"({IMG})">"      { System.out.println("IMG"); }
    "<"({A})">"      { System.out.println("A"); }
    "<"({UL})">"      { System.out.println("UL"); }
    "<"({OL})">"      { System.out.println("OL"); }
    "<"({LI})">"      { System.out.println("LI"); }
    "<"({B})">"      { System.out.println("B"); }
    "<"({I})">"      { System.out.println("I"); }
    "<"({U})">"      { System.out.println("U"); }
    "<"({SMALL})">"      { System.out.println("SMALL"); }
    "<"({SUP})">"      { System.out.println("SUP"); }
    "<"({SUB})">"      { System.out.println("SUB"); }
    "<"({CENTER})">"      { System.out.println("CENTER"); }
    "</"({FONT})">"      { System.out.println("FONT"); }
    "<"({H1})">"      { System.out.println("H1"); }
    "<"({H2})">"      { System.out.println("H2"); }
    "<"({H3})">"      { System.out.println("H3"); }
    "<"({H4})">"      { System.out.println("H4"); }
    "<"({H5})">"      { System.out.println("H5"); }
    "<"({H6})">"      { System.out.println("H6"); }
    "<"({P})">"      { System.out.println("P"); }
    ({SRC})"="      { System.out.println("SRC"); }
    .           { /*Any character*/}
}








