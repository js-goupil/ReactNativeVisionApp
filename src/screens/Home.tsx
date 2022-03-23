import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  Text,
  useColorScheme,
  StyleSheet,
  requireNativeComponent,
} from 'react-native';

const VisionView = React.memo(requireNativeComponent('VisionImageView'));

export const Home = () => {
  const isDarkMode = useColorScheme() === 'dark';

  return (
    <SafeAreaView>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <ScrollView style={styles.container}>
        <Text>Original image</Text>
        <VisionView
          imageMode="scaleAspectFill"
          cropForSaliency={false}
          style={{width: 123, height: 100}}
        />
        <Text>Cropped for saliency</Text>
        <VisionView
          imageMode="scaleAspectFill"
          cropForSaliency={true}
          style={{width: 123, height: 100}}
        />
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
