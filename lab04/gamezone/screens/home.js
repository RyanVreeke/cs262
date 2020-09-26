import React, { useState } from "react";
import {
  StyleSheet,
  View,
  Text,
  TouchableOpacity,
  FlatList,
} from "react-native";
import { globalStyles } from "../styles/global";

export default function Home({ navigation }) {
  const [reviews, setReviews] = useState([
    {
      title: "Vainglory",
      rating: 10,
      body:
        "This is an amazing MOBA built for mobile gaming! The visuals and controls are amazing, and the game keeps growing with great developers!",
      key: "1",
    },
    {
      title: "Apex",
      rating: 9,
      body:
        "The best Battle Royal out there! A mixture of realistic and game-like visuals bring out amazing graphics! Lots of heroes and abilities along with guns to try out and have a blast with!",
      key: "2",
    },
    {
      title: "Pokemon: Soul-Silver",
      rating: 8,
      body:
        "The best Pokemon game to play and enjoy fully! A great region to explore and then yet another one to take on after where there are 16 gym leaders to battle! You can explore more, catch more pokemon, and level up even higher than before!",
      key: "3",
    },
  ]);

  return (
    <View style={globalStyles.container}>
      <FlatList
        data={reviews}
        renderItem={({ item }) => (
          <TouchableOpacity
            onPress={() => navigation.navigate("ReviewDetails", item)}
          >
            <Text style={globalStyles.titleText}>{item.title}</Text>
          </TouchableOpacity>
        )}
      />
    </View>
  );
}
