import QtQuick 2.12
pragma Singleton

ListModel {
    ListElement
    {
        text: "1,1"
        color: "green"
    }
    ListElement
    {
        text: "1,2"
        color: "green"
    }
    ListElement
    {
        text: "1,3"
        color: "green"
    }
    ListElement
    {
        text: "2,1"
        color: "green"
    }
    ListElement
    {
        text: "2,2"
        color: "green"
    }
    ListElement
    {
        text: "2,3"
        color: "green"
    }
    ListElement
    {
        text: "3,1"
        color: "green"
    }
    ListElement
    {
        text: "3,2"
        color: "green"
    }
    ListElement
    {
        text: "3,3"
        color: "green"
    }
    function getOtherCellValue(currentValue) {
        var index = parseInt(currentValue);
        if (index >= 0 && index < count) {
            return get(index).text;
        } else {
            return "";
        }
    }
}
