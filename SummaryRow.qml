import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: row
    width: parent.width
    height: 32

    property string label: ""
    property real value: 0
    property string textValue: ""
    property color color: value < 0 ? "red" : "white"

    Row {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20

        Text {
            text: row.label
            font.pixelSize: 16
            color: "white"
            width: 350
            elide: Text.ElideRight
        }

        Text {
            text: row.textValue !== "" ? row.textValue : Number(row.value).toFixed(2)
            font.pixelSize: 16
            color: row.color
        }
    }
}
