

import QtQuick 2.0

Rectangle {

    id: root

    width:  120
    height: 300
    color: "white"

    ListView {
        anchors.fill: parent
        anchors.margins: 20
        model: 10
        delegate: numberDelegate
        spacing: 5
        focus: true
    }

    Component {
        id: numberDelegate

        Rectangle {
            width: ListView.view.width
            height: 40
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
