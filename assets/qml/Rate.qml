import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    color: "transparent"
    anchors.fill: parent

    RowLayout {
        anchors.fill: parent
        spacing: 20

        // Блок Расход
        ColumnLayout {
            spacing: 10
            Text {
                text: rateCtrl.flowRate.toFixed(2)
                font.pixelSize: 32
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: "Расход, л/мин"
                font.pixelSize: 16
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Button {
                contentItem:  Text {
                text: "Сброс"
                color: "white"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.centerIn: parent
                }
                background: Rectangle {
                    radius: 6
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#555" }
                        GradientStop { position: 1.0; color: "#222" }
                }

                }
                onClicked: rateCtrl.resetFlow()
            }
        }

        // Блок Суммарный объём
        ColumnLayout {
            spacing: 10
            Text {
                text: rateCtrl.totalVolume.toFixed(2)
                font.pixelSize: 32
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: "Суммарный объем, л"
                font.pixelSize: 16
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        // Клапан сброса
        ColumnLayout {
            spacing: 10
            Button {
                text: "Сброс"
                background: Rectangle { color: "red"; radius: 6 }
                onClicked: rateCtrl.openValve()
            }
            Button {
                text: "Закрыть"
                background: Rectangle { color: "gray"; radius: 6 }
                onClicked: rateCtrl.closeValve()
            }
            Rectangle {
                width: 10
                height: 4
                radius: 2
                color: rateCtrl.valveOpen ? "green" : "red"
                border.color: "black"
                border.width: 1
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: "Аварийный клапан сброса"
                font.pixelSize: 14
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        // Блок Температура
        ColumnLayout {
            spacing: 10
            Text {
                text: rateCtrl.temperature.toFixed(2)
                font.pixelSize: 32
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: "Температура РЖ, °C"
                font.pixelSize: 16
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        // Блок Давление подпора
        ColumnLayout {
            spacing: 10
            Text {
                text: rateCtrl.pressure.toFixed(2)
                font.pixelSize: 32
                color: rateCtrl.pressureColor
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: "Давление подпора, бар"
                font.pixelSize: 16
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}
