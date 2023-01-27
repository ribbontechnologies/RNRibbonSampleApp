# React Native Ribbon Sample App

Below is the documentation for integrating the Ribbon SDK into a React Native application for Android and iOS.

If you are running this sample app after cloning the repo, you need to do the following:

1. Open /android in Android Studio and sync the project.
2. Run `pod install` in the /ios directory. 
3. Open `/ios/RNRibbonSampleApp.xcworkspace` in Xcode and run the project.

We recommend opening android studio and Xcode to follow along with the instruction, and building in the IDEs to ensure the project is setup correctly.

## Android

Note that the original Android changes can be found in the commit [c457ac](https://github.com/ribbontechnologies/RNRibbonSampleApp/commit/c457ac10da93bd836fb6905ed964d5b88089f9b3). However some further edits were made in subsequent commits.

Open Android Studio.

First, add Ribbon dependency to your build.gradle file (`located in android/app/build.gradle`) e.g.

```gradle
dependencies {
  implementation("com.ribbonapp:android-sdk:latest_version")
}
```

Modify the files found in this repository in the following places:

### RibbonModule.java

Copy `android/app/src/main/java/com/rnribbonsampleapp/RibbonModule.java` [here](/android/app/src/main/java/com/rnribbonsampleapp/RibbonModule.java) to `android/app/src/main/java/com/YOUR_PROJECT/RibbonModule.java`. 

The first package line should be changed to match your project package name e.g. `package com.YOUR_PROJECT;`

### RibbonPackage.java

Copy `android/app/src/main/java/com/rnribbonsampleapp/RibbonPackage.java` [here](/android/app/src/main/java/com/rnribbonsampleapp/RibbonPackage.java) to `android/app/src/main/java/com/YOUR_PROJECT/RibbonPackage.java`.

The first package line should be changed to match your project package name e.g. `package com.YOUR_PROJECT;`

### MainApplication.java

Note that your `MainApplication.java` file may be named differently.

To your `getPackages` method in `android/app/src/main/java/com/YOUR_PROJECT/MainApplication.java` add the following line:

```java
packages.add(new RibbonPackage());
```

It should look something like:

```java
@Override
protected List<ReactPackage> getPackages() {
    @SuppressWarnings("UnnecessaryLocalVariable")
    List<ReactPackage> packages = new PackageList(this).getPackages();
    // Packages that cannot be autolinked yet can be added manually here, for example:
    // packages.add(new MyReactNativePackage());
    packages.add(new RibbonPackage());
    return packages;
}
```

### Final changes

In order for your Android project to sync, you can either:

1. go to android studio and click on the sync button
2. run `cd android && ./gradlew clean && ./gradlew build` from the root of your project

Note - at time of writing, this setup requires the minSdkVersion to be 24 - as seen [here](https://github.com/ribbontechnologies/RNRibbonSampleApp/commit/c457ac10da93bd836fb6905ed964d5b88089f9b3#diff-197b190e4a3512994d2cebed8aff5479ff88e136b8cc7a4b148ec9c3945bd65aR6). This will change to 21 in the next release of the android SDK (v1.0.2).

More details on our Android SDK can be found [here](https://docs.ribbonapp.com/docs/mobile-android-sdk).

## iOS

Note that the specific iOS changes can be found in the commit [1f0176](https://github.com/ribbontechnologies/RNRibbonSampleApp/commit/1f0176a2f17a595138ca4e6683df99ab5b702a27). However some further edits were made in subsequent commits.

Open your Xcode workspace.

Install the SDK through Swift Package Manager. In Xcode go to the menu 'File -> Add Packages...'. In the search field enter the url https://github.com/ribbontechnologies/ribbon-ios/.

Click 'Add Package' to continue.

We need to create 3 files to integrate the SDK into the React Native app. Note that all of these files need to be created in the Xcode app and not in the text editor.

### RibbonModule.swift

In Xcode, create a new file and select 'Swift File'. Name the file 'RibbonModule'.

If Xcode asks you to create a bridging header, select 'Create Bridging Header'. If not, we will go over this below.

Copy the contents of [RibbonModule.swift](/ios/RibbonModule.swift) into the new file.

### RibbonModule.m

In Xcode, create a new file and select 'Objective-C File'. Name the file 'RibbonModule'.

Copy the contents of [RibbonModule.m](/ios/RibbonModule.m) into the new file.

### YourApp-Bridging-Header.h

If Xcode did not ask you to create a bridging header, create a new file and select 'Objective-C Header File'. Name the file 'YourApp-Bridging-Header.h' where YourApp is the name of your project name.

Copy the contents of [RNRibbonSampleApp-Bridging-Header.h](/ios/RNRibbonSampleApp-Bridging-Header.h) into the new file.

### Further information

More details on our iOS SDK can be found [here](https://docs.ribbonapp.com/docs/mobile-ios-sdk).

## TypeScript

The TypeScript definitions for the Ribbon SDK can be found [here](/index.d.ts).

