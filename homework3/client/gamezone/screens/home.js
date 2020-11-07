import React, { useEffect, useState } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, ActivityIndicator } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function Home({ navigation }) {
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);

    // I am getting all of the players in game 4 with this request and displaying the data.
    useEffect(() => {
        fetch('https://ghastly-phantom-40830.herokuapp.com/showgameplayers/4')
            .then((response) => response.json())
            .then((json) => setData(json))
            .catch((error) => console.error(error))
            .finally(() => setLoading(false));
      }, []);

    return (
        <View style={globalStyles.container}>
            {isLoading ? <ActivityIndicator/> : (
                <FlatList
                data={data}
                keyExtractor={({ name }, index) => name}
                renderItem={({ item }) => (
                    <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                        <Card>
                            <Text style={globalStyles.titleText}>{ item.name }</Text>
                        </Card>
                    </TouchableOpacity>
                )} />
            )}
        </View>
    );
}
