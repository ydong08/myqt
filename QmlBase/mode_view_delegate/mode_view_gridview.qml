

import QtQuick 2.0

Rectangle {

    id: root

    width:  240
    height: 300
    color: "white"

    GridView {
        anchors.fill: parent
        anchors.margins: 20

        model: 12

        delegate: numberDelegate

        cellHeight: 45
        cellWidth:  45

    }

    Component {
        id: numberDelegate

        Rectangle {
            width: 40
            height: 40
            color: "green"

            Text {
                anchors.centerIn: parent
                font.pointSize: 12
                text: index
            }
        }
    }
}
