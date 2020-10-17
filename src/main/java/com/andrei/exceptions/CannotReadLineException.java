package com.andrei.exceptions;

public class CannotReadLineException extends RuntimeException {
    public CannotReadLineException(String message, Throwable cause){
        super(message, cause);
    }
}
