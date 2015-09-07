package com.korent.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by lei on 15-9-2.
 */
public class RentGson {
    private static Gson gson = null;
    public RentGson() {

    }
    public static  Gson getGson() {
        if(gson == null) {
            gson = new GsonBuilder().setExclusionStrategies(new RentGoodsExclusionStrategy()).setDateFormat("yyyy-MM-dd").create();
        }
        return gson;

    }
}
