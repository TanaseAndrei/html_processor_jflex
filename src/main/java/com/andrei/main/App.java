package com.andrei.main;

import com.andrei.interfaces.Application;
import com.andrei.interfaces.impl.ApplicationImpl;
import jflex.exceptions.SilentExit;

import java.io.File;

/**
 * Hello world!
 *
 */
public class App
{
    private static final String routeToRules = "E:\\Facultate\\Anul 4\\Sem1\\Proiectarea Translatoarelor\\Laborator\\project3\\src\\main\\java\\com\\andrei\\lexer.flex";

    public static void main( String[] args )
    {
        args[0] = new String(routeToRules);
//        Application application = new ApplicationImpl(args[0]);
//        application.execute();
        generateLexer(args);
    }

    public static void generateLexer(String[] argv){
        File lexer = new File(routeToRules);
        try {
            jflex.Main.generate(argv);
        }catch (SilentExit silentExit){
            silentExit.printStackTrace();
        }

    }

}
