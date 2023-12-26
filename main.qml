import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
//import Components 1.0
import CPP 1.0

ApplicationWindow
{
    id: root
    visible: true
    width: 800
    height: 700
    minimumWidth: 400

    x: 2170
    y: 250

    // Control
    GridView
    {
        id: _table
        anchors
        {
            fill: parent
            centerIn: parent
            margins: 80 + (root.width + root.height) / 30
        }

//        flickableDirection: Flickable.AutoFlickIfNeeded

        cellWidth: width / _table.model.width
        cellHeight: height / _table.model.height

        property int count: 0

        model: MyModel {}
        delegate: Rectangle
        {
            id: _delegate
            property string displayText: display

            width: _table.cellWidth
            height: _table.cellHeight
            anchors.margins: 2
            Rectangle {
                id: own
                color: (_delegate.displayText % 2 === 0 && Math.floor(_delegate.displayText / 8) % 2 === 0) || (_delegate.displayText % 2 === 1 && Math.floor(_delegate.displayText / 8) % 2 === 1) ? "white" : "black"

                Component.onCompleted: {
                    if ((_delegate.displayText % 2 === 0 && Math.floor(_delegate.displayText / 8) % 2 === 0) & (_delegate.displayText <= 23) || (_delegate.displayText % 2 === 1 && Math.floor(_delegate.displayText / 8) % 2 === 1) & (_delegate.displayText <= 23)) {

                        ckecker.visible = false;
                    }
                    if (_delegate.displayText >= 24 && _delegate.displayText <= 39) {
                        ckecker.visible = false;
                    }
                }

                Rectangle {
                    id: ckecker
                    radius: 100
                    width: _table.cellWidth / 1.3
                    height: _table.cellHeight / 1.2
                    color: "white"
                    anchors.centerIn: own
                    visible: true // начальное состояние
                }

                anchors.centerIn: parent
                Text {
                    id: name
                    text: _delegate.displayText
                }
                height: root.height / 10
                width: root.width / 10
                border {
                    color: "black"
                    width: 2
                }
            }


        }

    }

//    PathView
//    TableView
//    StackView

}
