package com.andrei;

import java.io.*;

public class App {

    /*
    In fisierul lexer.flex o sa fie o metoda intre %{%}, acea metoda putea fi pusa si dupa Tokens token = lexer.yylex();
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        new ApplicationImpl("E:\\Facultate\\Anul 4\\Sem1\\Proiectarea Translatoarelor\\Laborator\\project3\\src\\main\\java\\com\\andrei\\lexer.flex",
                "src/main/resources/input.html").run();
    }

}
