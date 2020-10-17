package com.andrei.tokens;

public enum Tokens {
    body(0),
    frameset(1),
    frame(2),
    noframe(3),
    form(4),
    input(5),
    select(6),
    option(7),
    table(8),
    tr(9),
    td(10),
    th(11),
    thead(12),
    tbody(13),
    img(14),
    a(15),
    link(16),
    ul(17),
    ol(18),
    li(19),
    b(20),
    i(21),
    u(22),
    small(23),
    sup(24),
    sub(25),
    center(26),
    font(27),
    h1(28),
    h2(29),
    h3(30),
    h4(31),
    h5(32),
    h6(32),
    p(33),
    hr(34),
    br(35),
    lt(36),
    rt(37);
    private final int value;
    Tokens(int value){
        this.value = value;
    }
}
