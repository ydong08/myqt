
import	QtQuick	2.0

Rectangle	{
    width:	180
    height:	600
    color: "white"

    ListView	{
        // anchors.verticalCenter: parent.verticalCenter  // ??
        anchors.fill: parent
        anchors.margins: 40
        clip: true
        model: 100
        delegate:	numberDelegate
        spacing: 5
    }

    Component	{
        id:	numberDelegate

        Rectangle	{
            width: 80
            height:	80
            radius: 6
            color: "green"

            Text	{
                anchors.centerIn: parent
                font.pointSize: 12
                text: index
            }
        }
    }
}
