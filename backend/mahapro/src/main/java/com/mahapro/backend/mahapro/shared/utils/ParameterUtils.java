package com.mahapro.backend.mahapro.shared.utils;

import java.util.HashMap;
import java.util.Map;

public class ParameterUtils {
    private static final Map<String, String> parameters = new HashMap<>();

    // Function to add parameter key-value pairs to the map
    public static void addParameter(String key, String value) {
        parameters.put(key, value);
    }

    // Function to retrieve the parameter value based on the key
    public static String getParameterValue(String key) {
        return parameters.get(key);
    }
}
