/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  Button,
  SafeAreaView,
  ScrollView,
  StatusBar,
  useColorScheme,
  View,
} from 'react-native';

import {NativeModules} from 'react-native';
import {Colors, Header} from 'react-native/Libraries/NewAppScreen';
const {RibbonModule} = NativeModules;

function App(): JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <ScrollView
        contentInsetAdjustmentBehavior="automatic"
        style={backgroundStyle}>
        <Header />
        <View
          style={{
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
          }}>
          {/* add two buttons with padding */}
          <View style={{padding: 10}}>
            <Button
              title="Configure"
              onPress={async () => {
                RibbonModule.setPreview(true);
                // https://www.ribbonapp.com/integration/javascript
                // Copy your Ribbon ID from the integration page
                RibbonModule.configure('RIBBON_ID');
              }}
            />
            {/* divider */}
            <View style={{padding: 10}} />
            <Button
              title="Trigger"
              onPress={async () => {
                RibbonModule.triggerAndShow('global');
              }}
            />
            ∏
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

export default App;
