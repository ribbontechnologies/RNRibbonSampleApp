// Methods declared here map directly to the methods available in the Ribbon SDKs
// https://docs.ribbonapp.com/docs/mobile-android-sdk
// https://docs.ribbonapp.com/docs/mobile-ios-sdk

import 'react-native';

type AttributeValue = string | number | boolean;

type Attributes = {
  [key: string]: AttributeValue;
};

interface RibbonModule {
  configure(ribbonId: string): void;
  trigger(trigger: string): Promise<string>;
  triggerAndShow(trigger: string): void;
  showDialog(): void;
  getAttributes(): Promise<Attributes>;
  setAttributes(attributes: Attributes): void;
  removeAttribute(key: string): void;
  removeAttributes(key: string[]): void;
  removeAllAttributes(): void;
  setIdentity(userId: string): void;
  setPreview(preview: boolean): void;
  clearSession(): void;
  // This method is not available on iOS
  setDarkMode(darkModeEnabled: boolean): void;
}

// extend NativeModules with the module we defined in the native code
declare module 'react-native' {
  interface NativeModulesStatic {
    RibbonModule: RibbonModule;
  }
}
