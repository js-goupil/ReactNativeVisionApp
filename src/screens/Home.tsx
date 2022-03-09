import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  Text,
  useColorScheme,
  StyleSheet,
} from 'react-native';

import {NativeModules} from 'react-native'

export const Home = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const { NativeModule } = NativeModules;

  NativeModule.sumTwoNumbers(5, 10);

  return (
    <SafeAreaView>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <ScrollView style={styles.container}>
        <Text>Hello World</Text>
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