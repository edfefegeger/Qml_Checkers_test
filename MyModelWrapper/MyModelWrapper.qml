import QtQuick 2.12
import QtQml.Models 2.15

QtObject {
    property MyModel myModel: MyModel {}

    function getOtherCellValue(currentValue) {
        return myModel.getOtherCellValue(currentValue);
    }
}
