package com.andrei;

import com.andrei.exceptions.ApplicationException;
import com.andrei.exceptions.FileAnalyzingException;
import com.andrei.exceptions.FlexGenerationException;
import com.andrei.tokens.Tokens;
import jflex.exceptions.SilentExit;

import java.io.*;

public class ApplicationImpl {

    private final String routeToRules;
    private final String routeToInputFile;
    private boolean run;

    public ApplicationImpl(String routeToRules, String routeToInputFile) {
        checkConstructorArguments(routeToRules);
        this.routeToRules = routeToRules;
        this.routeToInputFile = routeToInputFile;
        this.run = true;
    }

    public void run() {
        System.out.println("Press 1 to generate the .flex file" +
                "\nPress 2 to analyze the input html file");
        try {
            while (run) {
                int input = getInput();
                switch (input) {
                    case 1:
                        try {
                            generateFlex();
                            break;
                        } catch (FlexGenerationException flexGenerationException) {
                            throw new ApplicationException("An inner exception has occurred!", flexGenerationException);
                        }
                    case 2:
                        try {
                            analyzeInputFile();
                            break;
                        } catch (FileNotFoundException fileNotFoundException) {
                            throw new ApplicationException("An inner expcetion has occurred!", fileNotFoundException);
                        } catch (IOException ioException) {
                            throw new ApplicationException("An inner expcetion has occurred!", ioException);
                        }
                    default:
                        System.err.println("Introduce a number according to the upper text!");
                }
            }
        } catch (FlexGenerationException flexGenerationException) {
            System.err.println("An error has been occurred while trying to generate the flex file!");
        }
    }

    private void analyzeInputFile() throws FileNotFoundException, IOException {
        Reader reader = new BufferedReader(new FileReader("src/main/resources/input.html"));
        Lexer lexer = new Lexer(reader);
        boolean analyze = true;
        while (analyze) {
            Tokens token = lexer.yylex();
            if (token == null) {
                analyze = false;
                run = false;
                System.exit(1);
            }
            System.out.println("Token " + token + " with code " + token.getValue());
        }
    }

    private void generateFlex() {
        String[] routeToRulesConvertedToArray = {routeToRules};
        File lexer = new File(routeToRules);
        try {
            jflex.Main.generate(routeToRulesConvertedToArray);
        } catch (SilentExit silentExit) {
            throw new FlexGenerationException("The generation of .flex file failed!", silentExit);
        }
    }

    private void checkConstructorArguments(String routeToRules) {
        if (routeToRules == null || routeToRules.isBlank()) {
            throw new IllegalArgumentException("The input string should not be null, empty nor full with whitespaces!");
        }
    }

    private int getInput() {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int input = 0;
        try {
            input = Integer.parseInt(bufferedReader.readLine());
        } catch (NumberFormatException numberFormatException) {
            System.err.println("Enter an integer!");
        } catch (IOException ioException) {
            System.err.println("IOException has been occurred!");
        }
        return input;
    }

}
