package com.korent.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by lei on 15-9-2.
 */
public class UserGson {
    private static Gson gson = null;
    private UserGson() {

    }
    public static  Gson getGson() {
        if(gson == null) {
            gson = new GsonBuilder().setExclusionStrategies(new UserExclusionStrategy()).create();
        }
        return gson;

    }
}
