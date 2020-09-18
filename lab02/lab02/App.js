import { StatusBar } from "expo-status-bar";
import React, { useState } from "react";
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  Button,
  FlatList,
} from "react-native";

export default function App() {
  const [name, setName] = useState("Ryan");
  const [age, setAge] = useState(0);
  const [birthdays, setBirthdays] = useState([]);

  const inputChange = (val) => {
    setName(val);
  };

  const buttonPress = () => {
    var newAge = age + 1;
    setAge(newAge);
    setBirthdays(birthdays.concat({ key: newAge.toString() }));
  };

  return (
    <View style={styles.container}>
      <Text alignItems="center">Enter name:</Text>
      <TextInput
        style={styles.textInput}
        placeholder="Input Name:"
        onChangeText={inputChange}
      />
      <Text style={styles.textOuput}>
        My name is {name} and I am {age} years old.
      </Text>

      <View styles={styles.buttonContainer}>
        <Button title="BIRTHDAY" onPress={buttonPress} />
      </View>
      <FlatList
        data={birthdays}
        renderItem={({ item }) => <Text>{item.key}</Text>}
      />
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    padding: 30,
    textAlignVertical: "top",
  },

  textInput: {
    width: 135,
    height: 35,
    borderWidth: 2,
    borderColor: "black",
    margin: 8,
    paddingLeft: 2,
  },

  textOuput: {
    textAlign: "center",
  },

  buttonContainer: {
    backgroundColor: "blue",
    borderColor: "black",
    borderWidth: 2,
    color: "black",
  },
});
