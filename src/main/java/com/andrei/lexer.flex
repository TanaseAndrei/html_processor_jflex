package com.andrei;
import java_cup.runtime.*;
import java.util.*;
import com.andrei.tokens.Token;

%%
%class Lexer
%type Token
%line
%column
%char
%unicode
%line
%function nextToken

%{
    private Token token(int type){
        return new Token(type);
    }

    private Token token(int type, Object value){
        return new Token(type, value);
    }
%}

Letters             = [a-zA-Z]
Digit               = [0-9]
LineTerminator      = \r|\n|\r\n
WhiteSpace          = {LineTerminator} | [\t]
OneOrMoreSpaces     = \s
SLASH               = "/"
BEGIN_TAG           = "<"
END_TAG             = ">"
EQUAL               = "="
QUOTE_MARK          = "\""
MULTILINE_END_TAG   = {BEGIN_TAG}{SLASH}
INLINE_END_TAG      = {SLASH}{END_TAG}
ANY_CHARACTER       = .*

/* DECLARE CASE INSENSITIVE ALPHABET */
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

/* DECLARE RESERVED WORDS */
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
HREF        = {Hh}{Rr}{Ee}{Ff}
HEAD        = {Hh}{Ee}{Aa}{Dd}

 /* DECLARE ATTRIBUTES */
ATTRIBUTE       = {SRC} | {HREF}
ATTRIBUTE_TEXT  = ({QUOTE_MARK}{ANY_CHARACTER}{QUOTE_MARK})
CONTENT         = {ANY_CHARACTER}

/* WE CREATE NOW THE TAGS FROM PARTS */
HTML_START          = {BEGIN_TAG}{HTML}{END_TAG}
HEAD_START          = {BEGIN_TAG}{HEAD}{END_TAG}
BODY_START          = {BEGIN_TAG}{BODY}{END_TAG}
FRAMESET_START      = {BEGIN_TAG}{FRAMESET}{END_TAG}
FRAME_START         = {BEGIN_TAG}{FRAME}{END_TAG}
NOFRAME_START       = {BEGIN_TAG}{NOFRAME}{END_TAG}
FORM_START          = {BEGIN_TAG}{FORM}{END_TAG}
INPUT_START         = {BEGIN_TAG}{INPUT}{END_TAG}
SELECT_START        = {BEGIN_TAG}{OPTION}{END_TAG}
OPTION_START        = {BEGIN_TAG}{OPTION}{END_TAG}
TABLE_START         = {BEGIN_TAG}{TABLE}{END_TAG}
TR_START            = {BEGIN_TAG}{TR}{END_TAG}
TD_START            = {BEGIN_TAG}{TD}{END_TAG}
TH_START            = {BEGIN_TAG}{TH}{END_TAG}
THEAD_START         = {BEGIN_TAG}{THEAD}{END_TAG}
TBODY_START         = {BEGIN_TAG}{TBODY}{END_TAG}
IMG_INLINE           = ({BEGIN_TAG}{IMG}{OneOrMoreSpaces}{ATTRIBUTE}{EQUAL}{ATTRIBUTE_TEXT}{END_TAG})
A_START             = {BEGIN_TAG}{A}{END_TAG}
LINK_START          = {BEGIN_TAG}{LINK}{END_TAG}
UL_START            = {BEGIN_TAG}{UL}{END_TAG}
OL_START            = {BEGIN_TAG}{OL}{END_TAG}
LI_START            = {BEGIN_TAG}{LI}{END_TAG}
B_START             = {BEGIN_TAG}{B}{END_TAG}
I_START             = {BEGIN_TAG}{I}{END_TAG}
U_START             = {BEGIN_TAG}{U}{END_TAG}
SMALL_START         = {BEGIN_TAG}{SMALL}{END_TAG}
SUP_START           = {BEGIN_TAG}{SUP}{END_TAG}
SUB_START           = {BEGIN_TAG}{SUB}{END_TAG}
CENTER_START        = {BEGIN_TAG}{CENTER}{END_TAG}
FONT_START          = {BEGIN_TAG}{FONT}{END_TAG}
H1_START            = {BEGIN_TAG}{H1}{END_TAG}
H2_START            = {BEGIN_TAG}{H2}{END_TAG}
H3_START            = {BEGIN_TAG}{H3}{END_TAG}
H4_START            = {BEGIN_TAG}{H4}{END_TAG}
H5_START            = {BEGIN_TAG}{H5}{END_TAG}
H6_START            = {BEGIN_TAG}{H6}{END_TAG}
P_START             = {BEGIN_TAG}{P}{END_TAG}
HR_START            = {BEGIN_TAG}{HR}{END_TAG}
BR_START            = {BEGIN_TAG}{BR}{END_TAG}

HTML_END            = {MULTILINE_END_TAG}{HTML}{END_TAG}
HEAD_END            = {MULTILINE_END_TAG}{HEAD}{END_TAG}
BODY_END            = {MULTILINE_END_TAG}{BODY}{END_TAG}
FRAMESET_END        = {MULTILINE_END_TAG}{FRAMESET}{END_TAG}
NOFRAME_END         = {MULTILINE_END_TAG}{NOFRAME}{END_TAG}
FORM_END            = {MULTILINE_END_TAG}{FORM}{END_TAG}
SELECT_END          = {MULTILINE_END_TAG}{SELECT}{END_TAG}
OPTION_END          = {MULTILINE_END_TAG}{OPTION}{END_TAG}
TABLE_END           = {MULTILINE_END_TAG}{TABLE}{END_TAG}
TR_END              = {MULTILINE_END_TAG}{TR}{END_TAG}
TD_END              = {MULTILINE_END_TAG}{TD}{END_TAG}
TH_END              = {MULTILINE_END_TAG}{TH}{END_TAG}
THEAD_END           = {MULTILINE_END_TAG}{THEAD}{END_TAG}
TBODY_END           = {MULTILINE_END_TAG}{TBODY}{END_TAG}
A_END               = {MULTILINE_END_TAG}{A}{END_TAG}
UL_END              = {MULTILINE_END_TAG}{UL}{END_TAG}
OL_END              = {MULTILINE_END_TAG}{OL}{END_TAG}
LI_END              = {MULTILINE_END_TAG}{LI}{END_TAG}
B_END               = {MULTILINE_END_TAG}{B}{END_TAG}
I_END               = {MULTILINE_END_TAG}{I}{END_TAG}
U_END               = {MULTILINE_END_TAG}{U}{END_TAG}
SMALL_END           = {MULTILINE_END_TAG}{SMALL}{END_TAG}
SUP_END             = {MULTILINE_END_TAG}{SUP}{END_TAG}
SUB_END             = {MULTILINE_END_TAG}{SUB}{END_TAG}
CENTER_END          = {MULTILINE_END_TAG}{CENTER}{END_TAG}
FONT_END            = {MULTILINE_END_TAG}{FONT}{END_TAG}
H1_END              = {MULTILINE_END_TAG}{H1}{END_TAG}
H2_END              = {MULTILINE_END_TAG}{H2}{END_TAG}
H3_END              = {MULTILINE_END_TAG}{H3}{END_TAG}
H4_END              = {MULTILINE_END_TAG}{H4}{END_TAG}
H5_END              = {MULTILINE_END_TAG}{H5}{END_TAG}
H6_END              = {MULTILINE_END_TAG}{H6}{END_TAG}
P_END               = {MULTILINE_END_TAG}{P}{END_TAG}
%%

/* Reguli lexicale */
<YYINITIAL> {
    {WhiteSpace}                            {System.out.println("White space");}
    .                                       {/*ANY CHARACTER*/}

    /* Tag-uri start */
    {HTML_START}              { return token(sym.HTML); }
    {HEAD_START}             { return token(sym.HEAD); }
    {BODY_START}              { return token(sym.BODY); }
    {FRAMESET_START}         { return token(sym.FRAMESET); }
    {FRAME_START}             { return token(sym.FRAME); }
    {NOFRAME_START}           { return token(sym.NOFRAME); }
    {FORM_START}              { return token(sym.FORM); }
    {INPUT_START}             { return token(sym.INPUT); }
    {SELECT_START}           { return token(sym.SELECT); }
    {OPTION_START}            { return token(sym.OPTION); }
    {TABLE_START}             { return token(sym.TABLE); }
    {TR_START}                { return token(sym.TR); }
    {TD_START}                { return token(sym.TD); }
    {TH_START}                { return token(sym.TH); }
    {THEAD_START}             { return token(sym.THEAD); }
    {TBODY_START}             { return token(sym.TBODY); }
    {IMG_INLINE}      { return token(sym.IMG); }
    {A_START}                 { return token(sym.A); }
    {LINK_START}             { return token(sym.LINK); }
    {UL_START}                { return token(sym.UL); }
    {OL_START}                { return token(sym.OL); }
    {LI_START}                { return token(sym.LI); }
    {B_START}                { return token(sym.B); }
    {I_START}}                 { return token(sym.I); }
    {U_START}                { return token(sym.U); }
    {SMALL_START}             { return token(sym.SMALL); }
    {SUP_START}               { return token(sym.SUP); }
    {SUB_START}               { return token(sym.SUB); }
    {CENTER_START}            { return token(sym.CENTER); }
    {FONT_START}              { return token(sym.FONT); }
    {H1_START}                { return token(sym.H1); }
    {H2_START}                { return token(sym.H2); }
    {H3_START}                { return token(sym.H3); }
    {H4_START}                { return token(sym.H4); }
    {H5_START}                { return token(sym.H5); }
    {H6_START}                { return token(sym.H6); }
    {P_START}                 { return token(sym.P); }
    {HR_START}                { return token(sym.HR); }
    {BR_START}                { return token(sym.BR); }

    /* Tag-uri sfarsit */
    {HTML_END} { return token(sym.HTML); }
    {HEAD_END} { return token(sym.HEAD); }
    {BODY_END} { return token(sym.BODY); }
    {FRAMESET_END} { return token(sym.FRAMESET); }
    {NOFRAME_END} { return token(sym.NOFRAME); }
    {FORM_END} { return token(sym.FORM); }
    {SELECT_END} { return token(sym.SELECT); }
    {OPTION_END} { return token(sym.OPTION); }
    {TABLE_END} { return token(sym.TABLE); }
    {TR_END} { return token(sym.TR); }
    {TD_END} { return token(sym.TD); }
    {TH_END} { return token(sym.TH); }
    {THEAD_END} { return token(sym.THEAD); }
    {TBODY_END} { return token(sym.TBODY); }
    {A_END} { return token(sym.A); }
    {UL_END} { return token(sym.UL); }
    {OL_END} { return token(sym.OL); }
    {LI_END} { return token(sym.LI); }
    {B_END} { return token(sym.B); }
    {I_END} { return token(sym.I); }
    {U_END} { return token(sym.U); }
    {SMALL_END} { return token(sym.SMALL); }
    {SUP_END} { return token(sym.SUP); }
    {SUB_END} { return token(sym.SUB); }
    {CENTER_END} { return token(sym.CENTER); }
    {FONT_END} { return token(sym.FONT); }
    {H1_END} { return token(sym.H1); }
    {H2_END} { return token(sym.H2); }
    {H3_END} { return token(sym.H3); }
    {H4_END} { return token(sym.H4); }
    {H5_END} { return token(sym.H5); }
    {H6_END} { return token(sym.H6); }
    {P_END} { return token(sym.P); }

}








