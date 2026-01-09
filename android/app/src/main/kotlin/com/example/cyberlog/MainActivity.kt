package com.example.cyberlog
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
class MainActivity : FlutterActivity() {
    private val CHANNEL = "device/info"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceInfo") {
                val info = HashMap<String, String>()
                info["model"] = Build.MODEL
                info["version"] = Build.VERSION.RELEASE
                result.success(info)
            } else {
                result.notImplemented()
            }
        }
    }
}