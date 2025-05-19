import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: row

    property alias label: labelText.text
    property real value: 0
    property string textValue: ""
    property color color: value < 0 ? "red" : "white"

    property real fontScale: Math.max(12,Math.min((width / 400)*14,24))
    Layout.preferredHeight: fontScale + 8
    Layout.preferredWidth: parent ? parent.width*0.5 : 400


    RowLayout {
        anchors.fill: parent
        spacing: 8

        Text {
            id: labelText
            text: ""
            font.pixelSize: row.fontScale
            color: "white"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            text: row.textValue !== "" ? row.textValue : Number(row.value).toFixed(2)
            font.pixelSize: row.fontScale
            color: row.color
            Layout.alignment: Qt.AlignRight
            verticalAlignment: Text.AlignVCenter
        }
    }
}
