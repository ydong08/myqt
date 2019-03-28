

/*
   A Transition defines the animations to be applied when a State change occurs.

*/

import QtQuick 2.0

Item {
    id: root
    width: 800
    height: 800

    Rectangle {
        id: rect
        width: 400
        height: 400
        color: "red"

        MouseArea {
            id: mouse
            anchors.fill: parent
        }

        states: [
            State {
                name: "moved"
                when: mouse.pressed
                PropertyChanges {target: rect; x: 50; y: 50}
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {properties: "x,y"; easing.type: Easing.InOutQuad}
            }
        ]
    }
}
