package com.andrei.exceptions;

public class FileNotExistentException extends RuntimeException {
    public FileNotExistentException(String message, Throwable cause){
        super(message, cause);
    }
}
