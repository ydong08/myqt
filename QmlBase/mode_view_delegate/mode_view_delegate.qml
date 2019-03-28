

/*

*/

import QtQuick 2.0

Item {
    id: root
    width: 200
    height: 600

    Column {
        id: col
        anchors.centerIn: parent

        spacing: 8
        Repeater {
            model: 10

            delegate: Rectangle {
                width: 120
                height: 50

                radius: 3
                color: "lightgray"

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: index
                }
            }
        }
    }
}
