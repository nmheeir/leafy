package com.example.leafy.epub


import android.graphics.Bitmap
import com.example.leafy.epub.models.EpubBook
import java.io.ByteArrayOutputStream

object EpubMapper {
    fun toMap(book: EpubBook): Map<String, Any?> {
        return mapOf(
            "fileName" to book.fileName,
            "title" to book.title,
            "author" to book.author,
            "language" to book.language,
            "coverImage" to bitmapToBytes(book.coverImage),
            "chapters" to book.chapters.map { chapter ->
                mapOf(
                    "title" to chapter.title,
                    "body" to chapter.body,
                    "chapterId" to chapter.chapterId
                )
            },
            "images" to book.images.map { img ->
                mapOf(
                    "absPath" to img.absPath,
                    "image" to img.image // ByteArray
                )
            }
        )
    }

    private fun bitmapToBytes(bitmap: Bitmap?): ByteArray? {
        if (bitmap == null) return null
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
        return stream.toByteArray()
    }
}