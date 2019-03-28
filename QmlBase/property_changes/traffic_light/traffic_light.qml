

/*
 state:
        A state is a set of batched changes from the default configuration. Which always work together with PropertyChanges .

PropertyChanges:
        PropertyChanges is used to define the property values or bindings in a State.
        This enables an item's property values to be changed when it changes between states.
        To create a PropertyChanges object, specify the target item whose properties are to be modified, and define the new property values or bindings.

 PropertyAction:
       PropertyAction is used to specify an immediate property change during an animation. The property change is not animated.
       It is useful for setting non-animated property values during an animation.
*/

import QtQuick 2.0

Item {
    id: root
    width: 160
    height: 480

    Column {
        id: col
        spacing: 10
        anchors.centerIn: parent

        Rectangle  {
            id: imgred
            width: 140
            height: 140
            color: "red"
            radius: width/2
        }

        Rectangle {
            id: imgyellow
            width: 140
            height: 140
            color: "red"
            radius: width/2
        }

        Rectangle {
            id: imggreen
            width: 140
            height: 140
            color: "red"
            radius: width/2
        }
    }

    states: [
        State {
            name: "redlight"
            PropertyChanges {target: imgred; color: "red"}
            PropertyChanges {target: imgyellow; color: "white"}
            PropertyChanges {target: imggreen; color: "white"}
        },

        State {
            name: "yellowlight"
            PropertyChanges {target: imgred; color: "white"}
            PropertyChanges {target: imgyellow; color: "yellow"}
            PropertyChanges {target: imggreen; color: "white"}
        },

        State {
            name: "greenlight"
            PropertyChanges {target: imgred; color: "white"}
            PropertyChanges {target: imgyellow; color: "white"}
            PropertyChanges {target: imggreen; color: "green"}
        }
    ]

    SequentialAnimation {
        running: true
        loops: Animation.Infinite
        PropertyAction {target: root; property: "state"; value: "redlight"}
        PropertyAnimation {target: root; from : ""; to: "redlight"; duration:2000}

        PropertyAction {target: root; property: "state"; value: "yellowlight"}
        PropertyAnimation {target: root; from : "redlight"; to: "yellowlight";duration:300}

        PropertyAction {target: root; property: "state"; value: "greenlight"}
        PropertyAnimation {target: root; from : "yellowlight"; to: "greenlight";duration:3000}

        PropertyAction {target: root; property: "state"; value: "yellowlight"}
        PropertyAnimation {target: root; from : "greenlight"; to: "yellowlight";duration:300}
    }
}
