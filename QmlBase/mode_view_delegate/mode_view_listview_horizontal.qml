
import	QtQuick	2.0

Rectangle	{
    width:	600
    height:	180
    color: "white"

    ListView	{
        // anchors.verticalCenter: parent.verticalCenter  // ListView disappear
        anchors.fill: parent
        anchors.margins: 40
        clip: true
        model: 100
        delegate:	numberDelegate
        spacing: 5
        orientation: ListView.Horizontal  // horizontal ListView
        layoutDirection: Qt.RightToLeft   // element display orientation
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
