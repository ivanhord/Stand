import QtQuick 2.15
import QtQuick.Controls 2.15
import "."

ApplicationWindow {
    visible: true
    width: 600
    height: 600
    title: qsTr("Манометр")

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Manometer {
            anchors.centerIn: parent
        }
    }
}
