package com.example.mc_demo;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;


import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));

        new MethodChannel(getFlutterView(), "samples.chaoyue/navigation").setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        // Note: this method is invoked on the main thread.
                        if (call.method.equals("openAppStore")) {
                            try {
                                Uri uri = Uri.parse("market://details?id=com.tencent.mm");
                                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                startActivity(intent);
                            } catch (Exception e) {
                                result.error("UNAVAILABLE", "没有安装应用市场", null);
                            }
                        } else {
                            result.notImplemented();
                        }
                    }


                });
    }

    private BinaryMessenger getFlutterView() {
        return getFlutterEngine().getDartExecutor().getBinaryMessenger();
    }
}

