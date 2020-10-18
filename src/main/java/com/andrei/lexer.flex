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
HeaderLimit     = [1-6]
Digit           = [0-9]
LineTerminator  =  \r|\n|\r\n
InputCharacter = (\t\r\n|\r|\n)
WhiteSpace     = {LineTerminator} | [ \t\f]

%{
    String lexeme;
%}

%%

/* reguli de identificare ale token-urilor, cuvinte cheie din limbaj */
"body"      { return Tokens.BODY;}
"frameset"  { return Tokens.FRAMESET; }
"frame"     { return Tokens.FRAME; }
"noframe"   { return Tokens.NOFRAME; }
"form"      { return Tokens.FORM; }
"input"     { return Tokens.INPUT; }
"select"    { return Tokens.SELECT; }
"option"    { return Tokens.OPTION; }
"table"     { return Tokens.TABLE; }
"tr"        { return Tokens.TR; }
"td"        { return Tokens.TD; }
"th"        { return Tokens.TH; }
"thead"     { return Tokens.THEAD; }
"tbody"     { return Tokens.TBODY; }
"img"       { return Tokens.IMG; }
"a"         { return Tokens.A; }
"link"      { return Tokens.LINK; }
"ul"        { return Tokens.UL; }
"ol"        { return Tokens.OL; }
"li"        { return Tokens.LI; }
"b"         { return Tokens.B; }
"i"         { return Tokens.I; }
"u"         { return Tokens.U; }
"small"     { return Tokens.SMALL; }
"sup"       { return Tokens.SUP; }
"sub"       { return Tokens.SUB; }
"center"    { return Tokens.CENTER; }
"font"      { return Tokens.FONT; }
"h1"        { return Tokens.H1; }
"h2"        { return Tokens.H2; }
"h3"        { return Tokens.H3; }
"h4"        { return Tokens.H4; }
"h5"        { return Tokens.H5; }
"h6"        { return Tokens.H6; }
"p"         { return Tokens.P; }
"hr"        { return Tokens.HR; }
"br"        { return Tokens.BR; }
"<"         { return Tokens.LT; }
">"         { return Tokens.GT; }
"html"      { return Tokens.HTML; }
"/"         { return Tokens.SLASH; }
.           { /*skip*/}

{WhiteSpace} {/*skip*/}








