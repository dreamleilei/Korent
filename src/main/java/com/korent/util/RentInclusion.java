package com.korent.util;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;

/**
 * Created by lei on 15-9-8.
 */
public class RentInclusion implements ExclusionStrategy {
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }
    public boolean shouldSkipField(FieldAttributes f) {
        Boolean skip = f.getName().equals("owner") ||
                f.getName().equals("orderUser") ||
                f.getName().equals("follower") || f.getName().equals("id");
        return !skip;
    }
}