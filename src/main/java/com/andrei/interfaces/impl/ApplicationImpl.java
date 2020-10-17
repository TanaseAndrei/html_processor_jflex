package com.andrei.interfaces.impl;

import com.andrei.interfaces.Application;
import jflex.exceptions.SilentExit;

import java.io.File;

public class ApplicationImpl implements Application {

    private String fileName;
    private static final String EXTENSION = ".html";

    public ApplicationImpl(String fileName){
        checkConstructorArguments(fileName);
        this.fileName = fileName;
    }

    private void checkConstructorArguments(String fileName){
        if(fileName == null || fileName.isBlank()){
            throw new IllegalArgumentException("The name of the file should not be null or empty!");
        }
    }

    @Override
    public void execute(){
        generateLexer();
        analyseLexic();
    }

    private void generateLexer(){
        File file = new File("src/main/resources/lexer.flex");
        String[] argv = {file.getAbsolutePath()};
        try {
            jflex.Main.generate(argv);
        }catch(SilentExit silentExit){
            silentExit.printStackTrace();
        }
    }

    private void analyseLexic(){

    }



}
