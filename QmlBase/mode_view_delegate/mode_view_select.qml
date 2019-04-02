

import QtQuick 2.0

Rectangle {

    id: root

    width:  240
    height: 300
    color: "white"

    ListView {
        anchors.fill: parent
        anchors.margins: 40
        model: 10
        delegate: numberDelegate
        spacing: 8
        focus: true
    }

    Component {
        id: numberDelegate

        Rectangle {
            width: 80
            height: 80
            radius: 8
            color: ListView.isCurrentItem ? "green" : "lightgreen"

            Text {
                anchors.centerIn: parent
                font.pointSize: 12
                text: index
            }
        }
    }
}
