package org.javatraining.util;

// 値の検証を行うクラス
public class Validator {

    // 文字列が正の整数値であるかどうかを判定する
    public static boolean isInteger(String strNum) {
        try {
            Integer.parseUnsignedInt(strNum);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}