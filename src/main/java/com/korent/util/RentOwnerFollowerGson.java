package com.korent.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by lei on 15-9-8.
 */
public class RentOwnerFollowerGson {
    private static Gson gson = null;
    private RentOwnerFollowerGson() {

    }
    public static  Gson getGson() {
        if(gson == null) {
            gson = new GsonBuilder().setExclusionStrategies(new RentInclusion()).create();
        }
        return gson;

    }
}
