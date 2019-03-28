

/*

*/

import QtQuick 2.0

Item {
    id: root
    width: 200
    height: 600

    Column {
        id: col
        anchors.verticalCenter: parent.verticalCenter

        spacing: 8
        Repeater {
            model: ListModel {
                ListElement {abbr: "京"; name: "北京"; colortype: "red"}
                ListElement {abbr: "津"; name: "天津"; colortype: "orange"}
                ListElement {abbr: "冀"; name: "河北"; colortype: "yellow"}
                ListElement {abbr: "豫"; name: "河南"; colortype: "green"}
                ListElement {abbr: "皖"; name: "安徽"; colortype: "cyan"}
                ListElement {abbr: "苏"; name: "江苏"; colortype: "blue"}
                ListElement {abbr: "闽"; name: "福建"; colortype: "purple"}
                ListElement {abbr: "浙"; name: "浙江"; colortype: "lightgray"}
            }

            Rectangle {
                width: 160
                height: 60
                opacity: 1

                Rectangle {
                    width: 40
                    height: 40
                    antialiasing: true

                    radius: width/2
                    color: colortype

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10

                    Text {
                        anchors.centerIn: parent
                        font {family: "Calibri"; pointSize: 10; bold: true}
                        text: abbr
                    }
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    font {family: "Calibri"; pointSize: 12; bold: true}
                    text:  name
                }
            }
        }
    }
}


