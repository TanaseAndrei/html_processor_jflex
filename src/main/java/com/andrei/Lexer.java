package com.andrei;

import com.andrei.tokens.Tokens;

import java.io.Reader;

public class Lexer {

    private boolean hasBeenReplaced = false;

    public Lexer(Reader reader) {

    }

    public Tokens yylex() {
        return null;
    }

    public void setHasBeenReplaced(boolean hasBeenReplaced) {
        this.hasBeenReplaced = hasBeenReplaced;
    }

    public boolean getHasBeenReplaced() {
        return hasBeenReplaced;
    }
}