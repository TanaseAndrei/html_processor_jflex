package com.andrei;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ApplicationImpl {

    private final String routeToRules;
    private final String routeToInputFile;
    private boolean run;

    public ApplicationImpl(String routeToRules, String routeToInputFile){
        checkConstructorArguments(routeToRules);
        this.routeToRules = routeToRules;
        this.routeToInputFile = routeToInputFile;
        this.run = true;
    }



    public void run(){

        System.out.println("Press 1 to generate the .flex file" +
                    "\nPress 2 to analyze the input html file");
        while(run){
            int input = getInput();
            switch(input){
                case 1:
                    break;
                case 2:
                    break;
                default: System.err.println("Introduce a number according to the upper text!");
            }
        }
    }

    private void prepareFiles(){
        String[] jflexArguments = {routeToRules};

    }

    private void checkConstructorArguments(String routeToRules){
        if(routeToRules == null || routeToRules.isBlank()){
            throw new IllegalArgumentException("The input string should not be null, empty nor full with whitespaces!");
        }
    }

    private int getInput(){
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int input = 0;
        try{
            input = Integer.parseInt(bufferedReader.readLine());
        } catch(NumberFormatException numberFormatException){
            System.err.println("Enter an integer!");
        } catch(IOException ioException){
           System.err.println("IOException has been occurred!");
        }
        return input;
    }

}
