import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "/home/pc450/Downloads/QMLProject/Components/MyModel.qml" as MyListModel
//import Components 1.0
import CPP 1.0
import MyTypes 1.0

ApplicationWindow
{
    id: root
    visible: true
    width: 970
    height: 870
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
            margins: 80 + (root.width + root.height) / 50
        }

//        flickableDirection: Flickable.AutoFlickIfNeeded

        cellWidth: width / _table.model.width
        cellHeight: height / _table.model.height

        property int count: 0

        MyModel {
            id: myModel
                property int count: 0
            function getOtherCellValue(currentValue) {
                var index = parseInt(currentValue);
                if (index >= 0 && index < count) {
                    return myModel.get(index).text;
                } else {
                    return "";
                }
            }


                onCountChanged: {
                        count = myModel.count;
                    }
        }


        model: MyModel {}
        delegate: Rectangle
        {
            id: _delegate
            property string displayText: display

            width: _table.cellWidth
            height: _table.cellHeight
            anchors.margins: 2
            Rectangle {

                property var rectangles: []
                function getRectByIndex(index) {
                    return _table.rectangles[index];
                }

                id: own
                Component.onCompleted: {
                   own.rectangles.push(own);
                    if ((_delegate.displayText % 2 === 0 && Math.floor(_delegate.displayText / 8) % 2 === 0) & (_delegate.displayText <= 23) || (_delegate.displayText % 2 === 1 && Math.floor(_delegate.displayText / 8) % 2 === 1) & (_delegate.displayText <= 23)) {

                        ckecker.visible = false;
                    }
                    if (_delegate.displayText >= 24 && _delegate.displayText <= 39) {
                        ckecker.visible = false;
                    }
                    if (_delegate.displayText <= 23)
                    {
                        ckecker.color = "transparent"
                    }
                    if (_delegate.displayText >= 48 && _delegate.displayText <= 55) {
                        pic.source = "qrc:/pawn-chess-piece-outline-svgrepo-com.svg"
                    }
                    if (_delegate.displayText >= 8 && _delegate.displayText <= 15) {
                        pic.source = "qrc:/pawn-chess-piece-svgrepo-com.svg"
                    }
                    if (_delegate.displayText == 1) {
                        pic.source = "qrc:/chess-svgrepo-com (2).svg"
                    }
                    if ( _delegate.displayText == 6) {
                        pic.source = "qrc:/chess-svgrepo-com (2).svg"
                    }
                    if ( _delegate.displayText == 57) {
                        pic.source = "qrc:/chess-svgrepo-com (1).svg"
                    }
                    if ( _delegate.displayText == 62) {
                        pic.source = "qrc:/chess-svgrepo-com (1).svg"
                    }
                    if ( _delegate.displayText == 0) {
                        pic.source = "qrc:/chess-3-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 7) {
                        pic.source = "qrc:/chess-3-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 56) {
                        pic.source = "qrc:/chess-4-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 63) {
                        pic.source = "qrc:/chess-4-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 2) {
                        pic.source = "qrc:/chess-9-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 5) {
                        pic.source = "qrc:/chess-9-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 58) {
                        pic.source = "qrc:/chess-illustration-10-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 61) {
                        pic.source = "qrc:/chess-illustration-10-svgrepo-com.svg"
                    }

                    if ( _delegate.displayText == 4) {
                        pic.source = "qrc:/chess-king-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 60) {
                        pic.source = "qrc:/chess-king-svgrepo-com (1).svg"
                    }
                    if ( _delegate.displayText == 58) {
                        pic.source = "qrc:/chess-illustration-10-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 61) {
                        pic.source = "qrc:/chess-illustration-10-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 3) {
                        pic.source = "qrc:/queen-crown-svgrepo-com.svg"
                    }
                    if ( _delegate.displayText == 59) {
                        pic.source = "qrc:/royal-crown-of-a-king-svgrepo-com.svg"
                    }


                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var otherRightText1 = myModel.getOtherCellValue(_delegate.displayText - 7);
                        var otherLeftText1 = myModel.getOtherCellValue(_delegate.displayText - 9);


                        if (ckecker.visible === true) {
                            if (otherLeftText1 >= 0 && otherLeftText1 < _table.model.width * _table.model.height )
                            {
                                ckecker.color = "yellow"

                                console.log("да");
                            }

                            if (otherRightText1 >= 0 && otherRightText1 < _table.model.width * _table.model.height ) {
                               ckecker.color = "yellow"

                                console.log("да");
                            }
                            else
                            {
                                console.log("нет")
                            }
                        }

                    }
                }

                color: (_delegate.displayText % 2 === 0 && Math.floor(_delegate.displayText / 8) % 2 === 0) || (_delegate.displayText % 2 === 1 && Math.floor(_delegate.displayText / 8) % 2 === 1) ? "white" : "#423001"






                Rectangle {
                    id: ckecker
                    width: _table.cellWidth / 1.3
                    height: _table.cellHeight / 1.2
                    color: "transparent"
                    anchors.centerIn: own
                    visible: true

                }
                Image {
                    id: pic

                    anchors.centerIn: ckecker
                    width: _table.cellWidth / 1.3 / 1.3
                    height: _table.cellHeight / 1.2 / 1.3
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

}
