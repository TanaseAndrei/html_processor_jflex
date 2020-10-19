package com.andrei;

import com.andrei.tokens.Tokens;
import jflex.exceptions.SilentExit;

import java.io.*;

/**
 * Hello world!
 */
public class App {
//    private static final String routeToRules = "E:\\Facultate\\Anul 4\\Sem1\\Proiectarea Translatoarelor\\Laborator\\project3\\src\\main\\java\\com\\andrei\\lexer.flex";

    /*
    In fisierul lexer.flex o sa fie o metoda intre %{%}, acea metoda putea fi pusa si dupa Tokens token = lexer.yylex();
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        new ApplicationImpl("E:\\Facultate\\Anul 4\\Sem1\\Proiectarea Translatoarelor\\Laborator\\project3\\src\\main\\java\\com\\andrei\\lexer.flex",
                "src/main/resources/input.html").run();
        //cod initial
//        boolean run = true;
//        String[] argz = {routeToRules};
//        generateLexer(argz);

//        Reader reader = new BufferedReader(new FileReader("src/main/resources/input.html"));
//        Lexer lexer = new Lexer(reader);
//        while (run) {
//            Tokens token = lexer.yylex();
//            if (token == null) {
//                run = false;
//                System.exit(1);
//            }
//            System.out.println("Token " + token + " with code " + token.getValue());
//        }
    }

//    public static void generateLexer(String[] argv) {
//        File lexer = new File(routeToRules);
//        try {
//            jflex.Main.generate(argv);
//        } catch (SilentExit silentExit) {
//            silentExit.printStackTrace();
//        }
//
//    }

}
