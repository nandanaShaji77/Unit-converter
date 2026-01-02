package com.example.converter;

public class ConverterUtil {

    public static double convert(String category, String from, String to, double value) {

        if (category == null) return 0;

        switch (category.toLowerCase()) {
            case "length":
                return length(from, to, value);

            case "weight":
                return weight(from, to, value);

            case "temperature":
                return temperature(from, to, value);

            case "height":
                return height(from, to, value);

            default:
                return 0;
        }
    }

    // LENGTH
    private static double length(String from, String to, double v) {
        double meters;

        switch (from) {
            case "km": meters = v * 1000; break;
            case "cm": meters = v / 100; break;
            default: meters = v;
        }

        switch (to) {
            case "km": return meters / 1000;
            case "cm": return meters * 100;
            default: return meters;
        }
    }

    // WEIGHT
    private static double weight(String from, String to, double v) {
        double kg;

        switch (from) {
            case "g": kg = v / 1000; break;
            case "lb": kg = v * 0.453592; break;
            default: kg = v;
        }

        switch (to) {
            case "g": return kg * 1000;
            case "lb": return kg / 0.453592;
            default: return kg;
        }
    }

    // TEMPERATURE
    private static double temperature(String from, String to, double v) {
        if (from.equals("c") && to.equals("f"))
            return (v * 9 / 5) + 32;

        if (from.equals("f") && to.equals("c"))
            return (v - 32) * 5 / 9;

        return v;
    }

    // HEIGHT
    private static double height(String from, String to, double inches) {

        if (from.equals("cm")) {
            inches = inches / 2.54;
        } else if (from.equals("ft")) {
            inches = inches * 12;
        }

        if (to.equals("cm")) {
            return inches * 2.54;
        } else if (to.equals("ft")) {
            return inches / 12;
        } else {
            return inches;
        }
    }
}
