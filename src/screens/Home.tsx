import React, { useState } from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  Text,
  useColorScheme,
  StyleSheet,
  requireNativeComponent,
  TextInput,
} from 'react-native';

const VisionView = requireNativeComponent('VisionImageView');

export const Home = () => {
  const isDarkMode = useColorScheme() === 'dark';
  const [visonImage, setVisonImage] = useState<string>('');
  const [uri, setUri] = useState<string>(
    'https://files.worldwildlife.org/wwfcmsprod/images/Polar_bear_on_ice_in_Svalbard_Norway_WW294883/hero_small/85px6g3dhv_Polar_bear_on_ice_in_Svalbard_Norway_WW294883.jpg',
  );

  return (
    <SafeAreaView>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <ScrollView style={styles.container}>
        {/* <TextInput value={uri} onChangeText={setUri} /> */}
        <Text>Hello World</Text>
        <VisionView imageSource={uri} imageMode="scaleAspectFill" style={{width: 100, height: 100}} />
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    alignContent: 'center',
    height: '100%',
    flexDirection: 'row',
  },
});
