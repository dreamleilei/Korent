package com.korent.util;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;

/**
 * Created by lei on 15-9-1.
 */
public class UserExclusionStrategy implements ExclusionStrategy {
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }

    public boolean shouldSkipField(FieldAttributes f) {
        Boolean skip = f.getName().equals("order") ||
                f.getName().equals("follow") ||
                f.getName().equals("send") ||
                f.getName().equals("password") ||
                f.getName().equals("id")||
                f.getName().equals("otherInformation");
        return skip;
    }
}
