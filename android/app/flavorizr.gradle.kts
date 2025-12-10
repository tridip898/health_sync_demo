import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.healthsync.app"
            resValue(type = "string", name = "app_name", value = "Health Sync")
        }
        create("preprod") {
            dimension = "flavor-type"
            applicationId = "com.healthsync.app.preprod"
            resValue(type = "string", name = "app_name", value = "Health Sync Preprod")
        }
        create("stage") {
            dimension = "flavor-type"
            applicationId = "com.healthsync.app.stage"
            resValue(type = "string", name = "app_name", value = "Health Sync Stage")
        }
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.healthsync.app.dev"
            resValue(type = "string", name = "app_name", value = "Health Sync Dev")
        }
    }
}