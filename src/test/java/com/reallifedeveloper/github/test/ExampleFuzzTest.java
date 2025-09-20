package com.reallifedeveloper.github.test;

import static org.junit.jupiter.api.Assertions.fail;

import java.nio.charset.StandardCharsets;

import com.code_intelligence.jazzer.junit.FuzzTest;

public class ExampleFuzzTest {

    @FuzzTest
    public void test(byte[] data) {
        if (data.length < 1) {
            return;
        }
        if (data[0] % 2 == 0) {
            String s = new String(data, StandardCharsets.UTF_8);
            if (data[0] == 42 && s.length() >= 15 && s.substring(10, 14).equals("aaaaa")) {
                fail();
            }
        }
    }
}
