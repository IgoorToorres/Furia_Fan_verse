package com.shekarmudaliyar.social_share

import android.app.Activity
import android.content.Intent
import android.net.Uri
import androidx.core.content.FileProvider
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

class SocialSharePlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "social_share")
        channel.setMethodCallHandler(this)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "shareInstagramStory") {
            val imagePath = call.argument<String>("imagePath")
            val imageFile = File(imagePath!!)
            val uri = FileProvider.getUriForFile(
                activity!!,
                activity!!.packageName + ".fileprovider",
                imageFile
            )

            val intent = Intent("com.instagram.share.ADD_TO_STORY").apply {
                setDataAndType(uri, "image/*")
                flags = Intent.FLAG_GRANT_READ_URI_PERMISSION
                putExtra("interactive_asset_uri", uri)
            }

            activity!!.grantUriPermission(
                "com.instagram.android",
                uri,
                Intent.FLAG_GRANT_READ_URI_PERMISSION
            )

            activity!!.startActivity(intent)
            result.success("shared")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}
    override fun onDetachedFromActivityForConfigChanges() {}
}
