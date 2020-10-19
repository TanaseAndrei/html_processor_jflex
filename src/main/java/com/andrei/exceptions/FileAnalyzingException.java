package com.andrei.exceptions;

public class FileAnalyzingException extends RuntimeException {
    public FileAnalyzingException(String message, Throwable cause){
        super(message, cause);
    }
}
