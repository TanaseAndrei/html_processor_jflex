package com.andrei.interfaces.impl;

import com.andrei.exceptions.CannotReadLineException;
import com.andrei.exceptions.FileNotExistentException;
import com.andrei.interfaces.FReader;

import java.io.*;

public class FReaderImpl implements FReader {

    private File file = null;
    private FileReader fileReader = null;
    private BufferedReader bufferedReader = null;

    public FReaderImpl(String fileName){
        file = new File("src/main/resources/" + fileName);
    }

    @Override
    public String getFileContent(){

        try {
            fileReader = new FileReader(file);
            bufferedReader = new BufferedReader(fileReader);
            String line = null;
            try {
                while ((line = bufferedReader.readLine()) != null) {
                    System.out.println(line);
                }
            } catch (IOException e) {
                throw new CannotReadLineException("Cannot read the next line!", e);
            }
        } catch (FileNotFoundException e) {
            throw new FileNotExistentException("The file does not exist!", e);
        }

        return null;
    }
}
