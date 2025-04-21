import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15

Item {
    id: root
    anchors.fill: parent

    property real targetValue: 80
    property real currentValue: 93.81
    property real stepSize: 0.5

    signal increase()
    signal decrease()
    signal openValve()
    signal closeValve()
    signal setTarget(real value)

    Rectangle {
        id: mainPanel
        width: 250
        height: 200

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#333"
        radius: 10
        border.color: "#666"

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Rectangle {
                height: 24
                width: parent.width
                color: "orange"
                radius: 2
                Text {
                    anchors.centerIn: parent
                    text: "Игольчатый кран"
                    color: "black"
                    font.bold: true
                }
            }

            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                TextField {
                    id: targetInput
                    width: 80
                    height: 40
                    text: root.targetValue.toFixed(2)
                    validator: DoubleValidator { bottom: 0; top: 100 }
                    font.pixelSize: 16
                    horizontalAlignment: TextInput.AlignHCenter
                    onEditingFinished: {
                        root.targetValue = parseFloat(text)
                        root.setTarget(root.targetValue)
                    }
                    background: Rectangle {
                        gradient: LinearGradient {
                            x1: 0; y1: 1; x2: 0; y2: 0
                            GradientStop { position: 0.0; color: "#3a3a3a" }
                            GradientStop { position: 0.88; color: "#656565" }
                        }
                        radius: 2
                        border.color: "#999"
                    }
                }

                Column {
                    spacing: 2
                    Text {
                        text: root.currentValue.toFixed(2)
                        font.pixelSize: 20
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Text {
                        text: "Положение, %"
                        font.pixelSize: 12
                        color: "#ccc"
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Rectangle {
                    width: 8
                    height: 8
                    radius: 2
                    color: root.currentValue > 0 ? "green" : "red"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row {
                spacing: 6
                anchors.horizontalCenter: parent.horizontalCenter

                TextField {
                    id: stepInput
                    width: 60
                    height: 34
                    text: stepSize.toString()
                    validator: DoubleValidator { bottom: 0; top: 100 }
                    font.pixelSize: 14
                    onEditingFinished: root.stepSize = parseFloat(text)
                    background: Rectangle {
                        gradient: LinearGradient {
                            x1: 0; y1: 1; x2: 0; y2: 0
                            GradientStop { position: 0.0; color: "#3a3a3a" }
                            GradientStop { position: 0.88; color: "#656565" }
                        }
                        radius: 2
                        border.color: "#999"
                    }
                }

                Button {
                    text: "-"
                    background: Rectangle {
                           radius: 2
                       }
                    onClicked: root.decrease()
                }

                Button {
                    text: "+"
                    background: Rectangle {
                           radius: 2
                       }
                    onClicked: root.increase()
                }
            }

            Text {
                text: "Шаг"
                font.pixelSize: 12
                color: "#ccc"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "Открыть"
                    background: Rectangle {
                           radius: 2
                       }
                    onClicked: root.openValve()
                }

                Button {
                    text: "Закрыть"
                    background: Rectangle {
                           radius: 2
                       }
                    onClicked: root.closeValve()
                }
            }
        }
    }
}
