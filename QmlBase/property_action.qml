import QtQuick 2.0

Item {
    id: root
    width: 160
    height: 160

    Image {
        id: img
        source: "./assets/call.png"
    }

    SequentialAnimation {
        PropertyAction {
            target: img
            property: "opacity"
            value: .5
        }
        NumberAnimation {
            target: img
            property: "width"
            to: 300
            duration: 1000
        }
        PropertyAction {
            target: img
            property: "opacity"
            value: 1
        }
    }
}
