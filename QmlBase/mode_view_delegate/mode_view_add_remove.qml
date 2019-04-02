

import QtQuick 2.0

Rectangle {

    id: root

    width:  480
    height: 300
    color: "white"

    ListModel {
        id: theModel
        ListElement {number: 0}
        ListElement {number: 1}
        ListElement {number: 2}
        ListElement {number: 3}
        ListElement {number: 4}
        ListElement {number: 5}
        ListElement {number: 6}
        ListElement {number: 7}
        ListElement {number: 8}
        ListElement {number: 9}
    }

    /* add button */
    Rectangle {
        id: addbutton
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        height: 40

        color: "darkgreen"

        Text {
            anchors.centerIn: parent
            text: "add"
        }

        MouseArea {
            anchors.fill: parent
            onClicked:  {
                // theModel.append({"number": ++parent.count}); // OK
                theModel.append({number: ++parent.count});
            }
        }

        property int count: 9
    }

    /* view */
    GridView {
        anchors.fill: parent
        anchors.margins: 20
        anchors.bottomMargin: 80
        clip: true
        model: theModel
        delegate: modelDelegate

        cellHeight: 45
        cellWidth: 45
    }

    Component {
        id: modelDelegate

        Rectangle {
            id: wraper
            width: 40
            height: 40
            radius: 8
            color: "lightgreen"

            Text {
                anchors.centerIn: parent
                font.pointSize: 12
                text: number
            }

            MouseArea {
                anchors.fill: parent

                onClicked:  {
                    /* GridView.delayRemove 附加属性,位于每一个代理实例中 */
                    if (! wraper.GridView.delayRemove)
                        theModel.remove(index)
                }
            }

            GridView.onAdd: SequentialAnimation {
                NumberAnimation {target: wraper; property: "scale";  from: 0; to: 1; duration: 300; easing.type: Easing.InOutQuad}
            }

            GridView.onRemove:  SequentialAnimation {
                PropertyAction {target: wraper; property: "GridView.delayRemove"; value: true}
                NumberAnimation {target: wraper; property: "scale"; to: 0; duration: 300; easing.type: Easing.InOutQuad}
                PropertyAction {target: wraper; property: "GridView.delayRemove"; value: false}
            }
        }
    }
}
