import React, { useState } from "react";
import { StyleSheet, View, TextInput, Button } from "react-native";

export default function AddTodo({ submitHandler }) {
  const [text, setText] = useState("");

  const changeHandler = (val) => {
    setText(val);
  };

  return (
    <View>
      <TextInput
        style={styles.TextInput}
        placeholder="New Todo..."
        onChangeText={changeHandler}
        value={text}
      />
      <Button
        title="Add Todo"
        onPress={() => submitHandler(text)}
        color="coral"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  textInput: {
    marginBottom: 10,
    paddingHorizontal: 8,
    paddingVertical: 6,
    borderBottomWidth: 1,
    borderBottomColor: "#ddd",
  },
});
