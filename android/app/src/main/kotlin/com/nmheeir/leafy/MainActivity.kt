package com.nmheeir.leafy

import com.example.leafy.epub.EpubMapper
import com.example.leafy.epub.EpubParser
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.leafy/epub_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "parseEpub") {
                val filePath = call.argument<String>("filePath")
                if (filePath != null) {
                    // Chạy parse trong Background Thread để không chặn UI
                    CoroutineScope(Dispatchers.IO).launch {
                        try {
                            // Khởi tạo Parser
                            val parser = EpubParser(context)
                            // Gọi hàm parse (dựa trên EpubParser.kt đã có)
                            val book = parser.createEpubBook(filePath, shouldUseToc = true)

                            // Convert sang Map
                            val response = EpubMapper.toMap(book)

                            // Trả kết quả về Main Thread
                            withContext(Dispatchers.Main) {
                                result.success(response)
                            }
                        } catch (e: Exception) {
                            withContext(Dispatchers.Main) {
                                result.error("PARSE_ERROR", e.message, null)
                            }
                        }
                    }
                } else {
                    result.error("INVALID_ARGUMENT", "Path is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
