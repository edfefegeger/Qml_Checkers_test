import QtQuick 2.12

Item
{
    id: root

    property alias caseColor: backgroundRect.color
    property string textCell: "1"


    Rectangle
    {
        id: backgroundRect
        anchors.fill: root
        color: "green"

        border
        {
            width: 2
            color: "black"
        }
        radius: 15

        Text
        {
            id: frontText
            text: root.textCell

            font
            {
                pixelSize: backgroundRect.width / 2
                bold: true
            }
            anchors.centerIn: backgroundRect
        }
    }

//    Component.onCompleted: console.log(frontText.font.pointSize)
}
