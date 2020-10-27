package com.andrei.tokens;

public enum Tokens {
    BODY(0),
    FRAMESET(1),
    FRAME(2),
    NOFRAME(3),
    FORM(4),
    INPUT(5),
    SELECT(6),
    OPTION(7),
    TABLE(8),
    TR(9),
    TD(10),
    TH(11),
    THEAD(12),
    TBODY(13),
    IMG(14),
    A(15),
    LINK(16),
    UL(17),
    OL(18),
    LI(19),
    B(20),
    I(21),
    U(22),
    SMALL(23),
    SUP(24),
    SUB(25),
    CENTER(26),
    FONT(27),
    H1(28),
    H2(29),
    H3(30),
    H4(31),
    H5(32),
    H6(33),
    P(34),
    HR(35),
    BR(36),
    LT(37),
    GT(38),
    HTML(39),
    SLASH(40),
    EQUAL(41),
    SRC(42);
    private final int value;
    Tokens(int value){
        this.value = value;
    }
    public int getValue(){
        return value;
    }
}
