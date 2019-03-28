import QtQuick 2.0

Item {
    id: root
    width: 800
    height: 800

    Image {
        id: img
        anchors.centerIn: parent
        source: "./assets/call.png"
    }

    SequentialAnimation {
        running: true
        PropertyAction {
            target: img
            property: "opacity"
            value: .5
        }

        ParallelAnimation {
            NumberAnimation {
                target: img
                property: "width"
                to: 300
                duration: 1000
            }
            NumberAnimation {
                target: img
                property: "height"
                to: 300
                duration: 1000
            }
        }

        PropertyAction {
            target: img
            property: "opacity"
            value: 1
        }
    }
}
