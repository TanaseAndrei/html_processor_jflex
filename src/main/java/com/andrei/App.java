package com.andrei;

import com.andrei.tokens.Token;

import java.io.*;

public class App {

    public static void main(String[] args) throws FileNotFoundException, IOException {
        String filePath;

        if(args.length == 0){
            System.out.println("Enter a file path to process");
            filePath = new BufferedReader(new InputStreamReader(System.in)).readLine();
            System.out.println(filePath);
        } else {
            filePath = args[0];
        }

        try{
            Lexer lexer = new Lexer(new FileReader(filePath));

            Token token;
            while((token = lexer.nextToken()) != null){
                System.out.println(token);
            }
        } catch(IOException ioException){
            System.out.println(ioException);
        }
    }

}
