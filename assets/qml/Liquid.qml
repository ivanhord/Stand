import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    Rectangle {
        anchors.fill: parent
        color: "#333333" // Цвет фона
        z: -1 // Чтобы был за всем контентом
    }

    Column {
        anchors.centerIn: parent

        spacing: 20

        // Температура
        Column {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: rateCtrl.temperature.toFixed(2) + " °C"
                font.pixelSize: 32
                color: "white"
                horizontalAlignment: Text.AlignHCenter
            }
            Text {
                text: "Температура РЖ"
                font.pixelSize: 14
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        // Давление
        Column {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: rateCtrl.pressure.toFixed(2) + " бар"
                font.pixelSize: 32
                color: rateCtrl.pressureColor
                horizontalAlignment: Text.AlignHCenter
            }
            Text {
                text: "Давление подпора"
                font.pixelSize: 14
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
