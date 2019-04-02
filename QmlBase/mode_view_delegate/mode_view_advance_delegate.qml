

import QtQuick 2.0

Rectangle {

    id: root

    width:  300
    height: 480
    color: "white"

    ListModel {
        id: theModel
        ListElement {name: "Mercury"; imageSource: "images/mercury.jpg"; facts: "Mercury is the smallest planet in the Solar System. It is the closest planet to the sun. It makes one trip around the Sun once every 87.969 days." }
        ListElement {name: "Venus"; imageSource: "images/venus.jpg"; facts: "Venus is the second planet from the Sun. It is a terrestrial planet because it has a solid, rocky surface. The other terrestrial planets are Mercury, Earth and Mars. Astronomers have known Venus for thousands of years." }
        ListElement {name: "Earth"; imageSource: "images/earth.jpg"; facts: "The Earth is the third planet from the Sun. It is one of the four terrestrial planets in our Solar System. This means most of its mass is solid. The other three are Mercury, Venus and Mars. The Earth is also called the Blue Planet, 'Planet Earth', and 'Terra'."}
        ListElement {name: "Mars"; imageSource: "images/mars.jpg"; facts: "Mars is the fourth planet from the Sun in the Solar System. Mars is dry, rocky and cold. It is home to the largest volcano in the Solar System. Mars is named after the mythological Roman god of war because it is a red planet, which signifies the colour of blood." }
    }

    ListView {
        id: listview
        anchors.fill: parent
        anchors.margins: 20
        spacing: 8

        model: theModel
        delegate: viewsDelegate
        focus: true
    }

    Component {
        id: viewsDelegate

        Item {
            id: wraper
            width: listview.width
            height: 60

            Rectangle {
                id: viewname
                width: parent.width - 60
                height: 60
                radius: 8
                color: "lightgray"

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 5

                    font {family: "Calibri"; pointSize: 12}
                    text : name
                }
            }

            Rectangle {
                id: viewpicture
                width: 60
                height: 60
                radius: 8
                 anchors.right: parent.right
                 anchors.top: parent.top
                 //anchors.rightMargin: 5
                 //anchors.topMargin: 5

                color: "black"

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: imageSource
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.state = "expand"
            }

            Item {
                id: viewfacts
                anchors.top: viewpicture.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                opacity: 0

                 Rectangle {
                    anchors.fill: parent
                    color: "yellow"
                    Text {
                        anchors.fill: parent
                        anchors.margins: 20
                        clip: true
                        wrapMode: Text.WordWrap
                        font {family: "Calibri"; pointSize: 12}
                        text: facts
                    }
                 }
            }

            Rectangle {
                id: closeButton
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 5
                anchors.topMargin: 5

                width: 10
                height: 10
                opacity: 0
                color: "red"

                Text {
                    anchors.centerIn: parent
                    text: "X"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: wraper.state = ""
                }
            }

            states: [
                State {
                    name: "expand"
                    PropertyChanges {target: wraper; height: listview.height}
                    PropertyChanges {target: viewpicture; width:listview.width; height: listview.width; anchors.topMargin:0; anchors.rightMargin: 0}
                    PropertyChanges {target: viewfacts; opacity: 1}
                    PropertyChanges {target: closeButton; opacity: 1}
                    //PropertyChanges { target: wrapper.ListView.view; contentY: wrapper.y; interactive: false }
                }
            ]

            transitions: [
                Transition {
                    NumberAnimation {
                        duration: 200
                        properties: "height, width,anchors.rightMargin, anchors.topMargin,opacity,contentY"
                    }
                }
            ]

        }
    }
}
