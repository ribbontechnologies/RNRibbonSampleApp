package com.rnribbonsampleapp;

import com.facebook.react.bridge.ReactMethod;
import com.ribbon.sdk.Ribbon;
import com.ribbon.sdk.model.StudyState;

public class RibbonModule extends com.facebook.react.bridge.ReactContextBaseJavaModule {

    Ribbon ribbon = new Ribbon();

    RibbonModule(com.facebook.react.bridge.ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "RibbonModule";
    }

    @ReactMethod
    public void configure(String ribbonId) {
        ribbon.configure(ribbonId, getReactApplicationContext());
    }

    @ReactMethod
    public void trigger(String trigger, com.facebook.react.bridge.Promise promise) {
        ribbon.trigger(trigger, studyState -> {
            if (studyState instanceof StudyState.StudyReady) {
                promise.resolve("StudyReady");
            } else if (studyState instanceof StudyState.Failure) {
                promise.reject("error", "Failure");
            } else {
                promise.reject("error", "NoStudy");
            }
        });
    }

    @ReactMethod
    public void triggerAndShow(String trigger) {
        getCurrentActivity().runOnUiThread(() -> ribbon.triggerAndShow(trigger, (androidx.fragment.app.FragmentActivity) getCurrentActivity()));
    }

    @ReactMethod
    public void showDialog() {
        ribbon.showDialog(((androidx.fragment.app.FragmentActivity) getCurrentActivity()).getSupportFragmentManager());
    }

    @ReactMethod
    public void getAttributes(com.facebook.react.bridge.Promise promise) {
        java.util.Map<String, ?> map = ribbon.getAttributes();

        if (map == null) {
            promise.reject("GetAttributes", "null");
        } else {
            com.facebook.react.bridge.WritableMap readableMap = com.facebook.react.bridge.Arguments.makeNativeMap((java.util.Map<String, Object>) map);
            promise.resolve(readableMap);
        }
    }

    @ReactMethod
    public void setAttributes(com.facebook.react.bridge.ReadableMap attributes) {
        java.util.HashMap<String, Object> hashMap = attributes.toHashMap();
        hashMap.forEach((s, o) -> {
            if (o instanceof Double) {
                hashMap.replace(s, ((Double) o).floatValue());
            }
        });

        ribbon.setAttributes(hashMap);
    }

    @ReactMethod
    public void setAttribute(String key, String value) {
        ribbon.setAttribute(key, value);
    }

    @ReactMethod
    public void removeAttributes(String key) {
        ribbon.removeAttribute(key);
    }

    @ReactMethod
    public void removeAllAttributes() {
        ribbon.removeAllAttributes();
    }

    @ReactMethod
    public void setIdentity(String userId) {
        ribbon.setIdentity(userId);
    }

    @ReactMethod
    public void setPreview(Boolean preview) {
        ribbon.setPreview(preview);
    }

    @ReactMethod
    public void clearSession() {
        ribbon.clearSession();
    }

    @ReactMethod
    public void setDarkMode(Boolean darkModeEnabled) {
        ribbon.setDarkMode(darkModeEnabled);
    }
}
