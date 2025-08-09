package com.reallifedeveloper.github.test;

import lombok.experimental.UtilityClass;

/**
 * A class used for testing.
 *
 * @author RealLifeDeveloper
 */
@UtilityClass
public class Foo {

    /**
     * Prints a friendly message on {@code stdout}.
     *
     * @param args command-line arguments, ignored
     */
    @SuppressWarnings({ "checkstyle:noSystemOut", "PMD.SystemPrintln" })
    public static void main(String... args) {
        System.out.println("Hello, World!");
    }
}
