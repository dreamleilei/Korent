package com.korent.util;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by lei on 15-9-8.
 */



public class TestGson {
    static class RentGoodsTestExclusionStrategy implements ExclusionStrategy {
        public boolean shouldSkipClass(Class<?> clazz) {
            return false;
        }

        public boolean shouldSkipField(FieldAttributes f)
        {
            System.out.println(f.getName());
            Boolean skip = f.getName().equals("owner") ||
                    f.getName().equals("orderUser") ||
                    f.getName().equals("follower") || f.getName().equals("id");
            return !skip;
        }
    }

    static class UserTestExclusionStrategy implements ExclusionStrategy {
        public boolean shouldSkipClass(Class<?> clazz) {
            return false;
        }

        public boolean shouldSkipField(FieldAttributes f) {
            Boolean skip = f.getName().equals("order") ||
                    f.getName().equals("follow") ||
                    f.getName().equals("send") ||
                    f.getName().equals("password") ||
              /*  f.getName().equals("id")||*/
                    f.getName().equals("otherInformation");
            return skip;
        }
    }
    public static Gson getGson() {
        Gson gson = new GsonBuilder().setExclusionStrategies(new RentGoodsTestExclusionStrategy())/*.setExclusionStrategies(new UserTestExclusionStrategy()).*/.create();
        return gson;

    }
}
