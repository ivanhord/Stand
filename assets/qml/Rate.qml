import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    color: "#333"
    anchors.fill: parent

    property int buttonWidth: 120
    property int buttonHeight: 40

    RowLayout {
        anchors.fill: parent
        spacing: 40

        // 1 столбец - Серая кнопка Сброс
        ColumnLayout {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Rectangle {
                width: buttonWidth
                height: buttonHeight
                radius: 6
                color: "#555555"

                Text {
                    text: "Сброс"
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: rateCtrl.resetFlow()
                }
            }
        }

        // 2 столбец - Расход и Суммарный объем
        ColumnLayout {
            spacing: 10
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Text {
                text: rateCtrl.flowRate.toFixed(2)
                font.pixelSize: 32
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: "Расход, л/мин"
                font.pixelSize: 14
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
            Text {
                text: rateCtrl.totalVolume.toFixed(2)
                font.pixelSize: 32
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
                topPadding: 20
            }
            Text {
                text: "Суммарный объем, л"
                font.pixelSize: 14
                color: "lightgray"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        // 3 столбец - Клапан сброса
        ColumnLayout {
            spacing: 10
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            Rectangle {
                width: buttonWidth
                height: buttonHeight
                radius: 6
                color: "red"

                Text {
                    text: "Сброс"
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: rateCtrl.openValve()
                }
            }

            Rectangle {
                width: buttonWidth
                height: buttonHeight
                radius: 6
                color: "gray"

                Text {
                    text: "Закрыть"
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: rateCtrl.closeValve()
                }
            }

            Rectangle {
                width: buttonWidth
                height: buttonHeight
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter

                Text {
                    anchors.fill: parent
                    text: "Аварийный клапан сброса"
                    color: "lightgray"
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                }
            }
            Rectangle {
                width: 10
                height: 4
                radius: 0
                color: rateCtrl.valveOpen ? "green" : "red"
                Layout.alignment: Qt.AlignHCenter
            }
        }


    }
}
