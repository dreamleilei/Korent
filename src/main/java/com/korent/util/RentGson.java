package com.korent.util;

/**
 * Created by lei on 15-9-2.
 */
public class RentGson {
    private static RentGson ourInstance = new RentGson();

    public static RentGson getInstance() {
        return ourInstance;
    }

    private RentGson() {
    }
}
