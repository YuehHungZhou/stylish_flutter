package com.example.stylish_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    //頻道名稱
    private val CHANNEL = "com.example.randomNumber"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            //頻道底下的func
            if (call.method == "generateRandomNumber") {
                val randomNumber = (1..100).random()
                result.success(randomNumber)
            } else {
                result.notImplemented()
            }
        }
    }
}
