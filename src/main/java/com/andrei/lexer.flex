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

Letters             = [a-zA-Z]
Digit               = [0-9]
LineTerminator      = \r|\n|\r\n
WhiteSpace          = {LineTerminator} | [\t]
OneOrMoreSpaces     = \s+
ZeroOrMoreLetters   = [a-zA-z]*
SLASH               = "/"
BEGIN_TAG           = "<"
END_TAG             = ">"
EQUAL               = "="
MULTILINE_END_TAG   = {BEGIN_TAG}{SLASH}
INLINE_END_TAG      = {SLASH}{END_TAG}

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

    /* Tag-uri start */
    {BEGIN_TAG}{HTML}{END_TAG}              { return Tokens.HTML; }
    {BEGIN_TAG}{BODY}{END_TAG}              { return Tokens.BODY; }
    {BEGIN_TAG}{FRAMESET}{END_TAG}          { return Tokens.FRAMESET; }
    {BEGIN_TAG}{FRAME}{END_TAG}             { return Tokens.FRAME; }
    {BEGIN_TAG}{NOFRAME}{END_TAG}           { return Tokens.NOFRAME; }
    {BEGIN_TAG}{FORM}{END_TAG}              { return Tokens.FORM; }
    {BEGIN_TAG}{INPUT}{END_TAG}             { return Tokens.INPUT; }
    {BEGIN_TAG}{SELECT}{END_TAG}            { return Tokens.SELECT; }
    {BEGIN_TAG}{OPTION}{END_TAG}            { return Tokens.OPTION; }
    {BEGIN_TAG}{TABLE}{END_TAG}             { return Tokens.TABLE; }
    {BEGIN_TAG}{TR}{END_TAG}                { return Tokens.TR; }
    {BEGIN_TAG}{TD}{END_TAG}                { return Tokens.TD; }
    {BEGIN_TAG}{TH}{END_TAG}                { return Tokens.TH; }
    {BEGIN_TAG}{THEAD}{END_TAG}             { return Tokens.THEAD; }
    {BEGIN_TAG}{TBODY}{END_TAG}             { return Tokens.TBODY; }
    {BEGIN_TAG}{IMG}{OneOrMoreSpaces}{SRC}  { return Tokens.IMG; }
    {BEGIN_TAG}{A}{END_TAG}                 { return Tokens.A; }
    {BEGIN_TAG}{LINK}{END_TAG}              { return Tokens.LINK; }
    {BEGIN_TAG}{UL}{END_TAG}                { return Tokens.UL; }
    {BEGIN_TAG}{OL}{END_TAG}                { return Tokens.OL; }
    {BEGIN_TAG}{LI}{END_TAG}                { return Tokens.LI; }
    {BEGIN_TAG}{B}{END_TAG}                 { return Tokens.B; }
    {BEGIN_TAG}{I}{END_TAG}                 { return Tokens.I; }
    {BEGIN_TAG}{U}{END_TAG}                 { return Tokens.U; }
    {BEGIN_TAG}{SMALL}{END_TAG}             { return Tokens.SMALL; }
    {BEGIN_TAG}{SUP}{END_TAG}               { return Tokens.SUP; }
    {BEGIN_TAG}{SUB}{END_TAG}               { return Tokens.SUB; }
    {BEGIN_TAG}{CENTER}{END_TAG}            { return Tokens.CENTER; }
    {BEGIN_TAG}{FONT}{END_TAG}              { return Tokens.FONT; }
    {BEGIN_TAG}{H1}{END_TAG}                { return Tokens.H1;}
    {BEGIN_TAG}{H2}{END_TAG}                { return Tokens.H2;}
    {BEGIN_TAG}{H3}{END_TAG}                { return Tokens.H3;}
    {BEGIN_TAG}{H4}{END_TAG}                { return Tokens.H4;}
    {BEGIN_TAG}{H5}{END_TAG}                { return Tokens.H5;}
    {BEGIN_TAG}{H6}{END_TAG}                { return Tokens.H6;}
    {BEGIN_TAG}{P}{END_TAG}                 { return Tokens.P;}
    {BEGIN_TAG}{HR}{END_TAG}                { return Tokens.HR;}
    {BEGIN_TAG}{BR}{END_TAG}                { return Tokens.BR;}
    {SRC}{EQUAL}{ZeroOrMoreLetters}{END_TAG} { return Tokens.SRC; }

    /* Tag-uri sfarsit */
    {MULTILINE_END_TAG}{HTML}{END_TAG}      { return Tokens.HTML; }
    {MULTILINE_END_TAG}{BODY}{END_TAG}      { return Tokens.BODY; }
    {MULTILINE_END_TAG}{FRAMESET}{END_TAG}  { return Tokens.FRAMESET; }
    {MULTILINE_END_TAG}{NOFRAME}{END_TAG}   { return Tokens.NOFRAME; }
    {MULTILINE_END_TAG}{FORM}{END_TAG}      { return Tokens.FORM; }
    {MULTILINE_END_TAG}{SELECT}{END_TAG}    { return Tokens.SELECT; }
    {MULTILINE_END_TAG}{OPTION}{END_TAG}    { return Tokens.OPTION; }
    {MULTILINE_END_TAG}{TABLE}{END_TAG}     { return Tokens.TABLE; }
    {MULTILINE_END_TAG}{TR}{END_TAG}        { return Tokens.TR; }
    {MULTILINE_END_TAG}{TD}{END_TAG}        { return Tokens.TD; }
    {MULTILINE_END_TAG}{TH}{END_TAG}        { return Tokens.TH; }
    {MULTILINE_END_TAG}{THEAD}{END_TAG}     { return Tokens.THEAD; }
    {MULTILINE_END_TAG}{TBODY}{END_TAG}     { return Tokens.TBODY; }
    {MULTILINE_END_TAG}{A}{END_TAG}         { return Tokens.A; }
    {MULTILINE_END_TAG}{UL}{END_TAG}        { return Tokens.UL; }
    {MULTILINE_END_TAG}{OL}{END_TAG}        { return Tokens.OL; }
    {MULTILINE_END_TAG}{LI}{END_TAG}        { return Tokens.LI; }
    {MULTILINE_END_TAG}{B}{END_TAG}         { return Tokens.B; }
    {MULTILINE_END_TAG}{I}{END_TAG}         { return Tokens.I; }
    {MULTILINE_END_TAG}{U}{END_TAG}         { return Tokens.U; }
    {MULTILINE_END_TAG}{SMALL}{END_TAG}     { return Tokens.SMALL; }
    {MULTILINE_END_TAG}{SUP}{END_TAG}       { return Tokens.SUP; }
    {MULTILINE_END_TAG}{SUB}{END_TAG}       { return Tokens.SUB; }
    {MULTILINE_END_TAG}{CENTER}{END_TAG}    { return Tokens.CENTER; }
    {MULTILINE_END_TAG}{FONT}{END_TAG}      { return Tokens.FONT; }
    {MULTILINE_END_TAG}{H1}{END_TAG}        { return Tokens.H1; }
    {MULTILINE_END_TAG}{H2}{END_TAG}        { return Tokens.H2; }
    {MULTILINE_END_TAG}{H3}{END_TAG}        { return Tokens.H3; }
    {MULTILINE_END_TAG}{H4}{END_TAG}        { return Tokens.H4; }
    {MULTILINE_END_TAG}{H5}{END_TAG}        { return Tokens.H5; }
    {MULTILINE_END_TAG}{H6}{END_TAG}        { return Tokens.H6; }
    {MULTILINE_END_TAG}{P}{END_TAG}         { return Tokens.P; }
    .                                       {/*ANY CHARACTER*/}
}








