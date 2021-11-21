package com.example.mc_demo;


import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class SecondActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FlutterEngine engine = new FlutterEngine(this);
        GeneratedPluginRegistrant.registerWith(engine);
        SampleViewFactory playerViewFactory = new SampleViewFactory(engine.getDartExecutor().getBinaryMessenger());
        engine.getPlatformViewsController().getRegistry().registerViewFactory("SampleView", playerViewFactory);
    }


    class SampleViewFactory extends PlatformViewFactory {
        private final BinaryMessenger messenger;

        public SampleViewFactory(BinaryMessenger msger) {
            super(StandardMessageCodec.INSTANCE);
            messenger = msger;
        }

        @Override
        public PlatformView create(Context context, int id, Object obj) {
            return new SimpleViewControl(context, id, messenger);
        }
    }

    class SimpleViewControl implements PlatformView, MethodChannel.MethodCallHandler {
        private final MethodChannel methodChannel;
        private final View view;

        public SimpleViewControl(Context context, int id, BinaryMessenger messenger) {
            view = new View(context);
            view.setBackgroundColor(Color.rgb(255, 0, 0));

            methodChannel = new MethodChannel(messenger, "samples.chaoyue/native_views_" + id);
            methodChannel.setMethodCallHandler(this);

        }

        @Override
        public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
            if (methodCall.method.equals("changeBackgroundColor")) {
                view.setBackgroundColor(Color.rgb(0, 0, 255));
                result.success(0);
            } else {
                result.notImplemented();
            }

        }


        @Override
        public View getView() {
            return view;
        }

        @Override
        public void dispose() {

        }
    }
}



