allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

buildscript {
    val kotlinVersion = providers.gradleProperty("kotlinVersion").getOrElse("1.9.0")

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:7.3.0") // Ví dụ version gradle của bạn
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")

        // --- THÊM DÒNG NÀY ---
        classpath("org.jetbrains.kotlin:kotlin-serialization:$kotlinVersion")
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    afterEvaluate {
        if (name.contains("blurhash") || name.contains("flutter_keyboard_visibility") || name.contains(
                "vocsy_epub_viewer"
            )
        ) {
            (extensions.findByName("android") as? com.android.build.gradle.BaseExtension)?.apply {
                compileSdkVersion(36)
            }
        }
    }
}

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
