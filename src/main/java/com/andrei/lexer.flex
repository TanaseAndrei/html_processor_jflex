package com.andrei;
import java_cup.runtime.*;
import java.util.*;
import com.andrei.tokens.Tokens;
%%

%class Lexer
%type Tokens
%unicode
%cup
%line
%column

Letter          = [a-z]
Digit           = [0-9]
WhiteSpace      = [\t\n]+

%{
    public String lexeme;
%}
%%

{WhiteSpace} {/*ignore*/}
"<body>" { lexeme = yytext(); return Tokens.body;}







