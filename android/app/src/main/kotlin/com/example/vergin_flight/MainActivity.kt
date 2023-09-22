package com.example.vergin_flight

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.os.BatteryManager
import android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

const val METHOD_BATTERY = "getBatteryLevel"
const val CHANNEL_BATTERY = "android/battery"
const val METHOD_CURRENT_LOCATION = "getCurrentLocation"
const val CHANNEL_LOCATION = "android/location"

class MainActivity: FlutterActivity() {
    private var TAG = "PlatformChannels"
    private lateinit var fusedLocationClient: FusedLocationProviderClient

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        Log.d(TAG, "configureFlutterEngine()");
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // 배터리 확인 채널
        MethodChannel(flutterEngine.dartExecutor, CHANNEL_BATTERY)
            .setMethodCallHandler {
                call, result ->
                    if(call.method == METHOD_BATTERY) {
                        val manager: BatteryManager = getContext().getSystemService(BATTERY_SERVICE) as BatteryManager
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                            val battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY)
                            result.success(battery)
                        }
                    }
                    result.notImplemented()
            }

        // 현재위치 확인 채널
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        MethodChannel(flutterEngine.dartExecutor, CHANNEL_LOCATION)
            .setMethodCallHandler {
                call, result ->
                    Log.d(TAG, "location_channel :: method " + call.method)
                    if(call.method == METHOD_CURRENT_LOCATION) {
                        getCurrentLocation(result)
                    }
            }

    }

    fun getCurrentLocation(result: MethodChannel.Result) {
        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.ACCESS_COARSE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return
        }
        fusedLocationClient.getLastLocation()
            .addOnSuccessListener {
                location ->
                    if(location != null) {
                        val res = "(" + location.latitude + ", " + location.longitude + ")"
                        Log.d(TAG, "location? " + res)
                        result.success(res)
                    }
            }
    }

}
