package com.andrei.tokens;

import java_cup.runtime.Symbol;

public class Token extends Symbol {

    public Token(int id){
        super(id);
    }

    public Token(int id, Object o){
        super(id, o);
    }

    @Override
    public String toString(){

            return "Token{"
                    + "Type = " + com.andrei.sym.terminalNames[this.sym] + "}";

    }
}
