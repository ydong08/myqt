
import	QtQuick	2.0

Rectangle	{
    width:	180
    height:	600
    color: "white"

    ListView	{

        anchors.fill: parent
        anchors.margins: 40

        clip: true
        model: 10

        delegate:	numberDelegate
        spacing: 5

        /* 注意:
             高亮代理中使用的是Rectangle
             模型代理中使用的是Item
        */
        highlight: highDelegate
        focus: true

        header: headerDelegate
        footer: footerDelegate
    }

    Component {
        id: headerDelegate

        Rectangle {
            width: ListView.view.width
            height: ListView.view.height/2
            radius: 6
            color: "green"

            Text {
                anchors.centerIn: parent
                font {family: "Carili"; pointSize: 12}
                text: "Header"
            }

        }
    }

    Component {
        id: footerDelegate

        Rectangle {
            width:  ListView.view.width
            height: ListView.view.height/2
            radius: 6
            color: "blue"

            Text {
                anchors.centerIn: parent
                font {family: "Carili"; pointSize: 12}
                text: "Footer"
            }
        }
    }

    Component {
        id: highDelegate

        Rectangle {
            height: ListView.view.width
            radius: 6
            color: "lightgreen"
        }
    }

    Component	{
        id:	numberDelegate

        Item	{
            width: 80
            height:	80

            Text	{
                anchors.centerIn: parent
                font.pointSize: 12
                text: index
            }
        }
    }

}
