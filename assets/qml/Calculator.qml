import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
//import QtQuick.Window 2.15

Window {
    id: calculator
    width: 240
    height: 400
    flags: Qt.Popup | Qt.WindowStaysOnTopHint
    modality: Qt.ApplicationModal

    // центрирование относительно родителя
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    property string initialValue: ""
    property alias inputField: calculatorInput  // Делаем поле доступным извне
    signal accepted(real value)
    signal canceled()

    onVisibleChanged: {
        if (visible) {
            calculatorInput.text = initialValue
            calculatorInput.forceActiveFocus()
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#222"
        radius: 6
        border.color: "#666"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Rectangle {
                color: "#444"
                radius: 4
                Layout.fillWidth: true
                implicitHeight: 32

                Text {
                    text: "Ввод значения"
                    font.bold: true
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
            }

            TextField {
                id: calculatorInput
                background: Rectangle {
                    color: "#000"
                    border.color: "#aaa"
                    border.width: 1
                    radius: 4
                }
                color: "white"
                font.pixelSize: 18
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                Layout.fillWidth: true
                text: initialValue
                validator: DoubleValidator {
                    bottom: -Infinity
                    top: Infinity
                    decimals: 2
                    notation: DoubleValidator.ScientificNotation
                }
            }

            GridLayout {
                id: grid
                columns: 4
                rowSpacing: 6
                columnSpacing: 6

                // Строка 1
                Button {
                    onClicked: calculatorInput.text += "7"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                    contentItem: Text {
                        text: "7"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                }
                Button {
                    contentItem: Text {
                        text: "8"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "8"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "9"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "9"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "C"
                        color: "white"
                        font.pixelSize: 24
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text = ""
                    Layout.rowSpan: 2
                    Layout.fillWidth: false
                    Layout.fillHeight: true
                    width: 60
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }

                // Строка 2
                Button {
                    contentItem: Text {
                        text: "4"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "4"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "5"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "5"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "6"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "6"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }

                // Строка 3
                Button {
                    contentItem: Text {
                        text: "1"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "1"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "2"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "2"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "3"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "3"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#555" }
                            GradientStop { position: 1.0; color: "#222" }
                        }

                    }
                }
                Button {
                    contentItem: Text {
                        text: "←"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text = calculatorInput.text.slice(0, -1)
                    Layout.rowSpan: 2
                    Layout.fillWidth: false
                    Layout.fillHeight: true
                    width: 60
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }

                // Строка 4
                Button {
                    contentItem: Text {
                        text: "."
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "."
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "0"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "0"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "-"
                        color: "white"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: calculatorInput.text += "-"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }

                // Строка 5: ОК и Закрыть
                Button {
                    contentItem: Text {
                        text: "Ок"
                        color: "white"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        let valueText = calculatorInput.text.trim();

                        // Если поле пустое - закрываем калькулятор
                        if (valueText === "") {
                            close();
                            return;
                        }

                        // Преобразуем в число с заменой запятых
                        let value = Number(valueText.replace(",", "."));

                        // Проверяем валидность числа
                        if (isNaN(value)) {
                            value = 0
                        }
                        accepted(value);
                        close();
                    }
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}

                    }
                }
                Button {
                    contentItem: Text {
                        text: "Закрыть"
                        color: "white"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        calculator.close()
                    }
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        border.color: "#aaa"
                        border.width: 1
                        radius: 6
                        gradient: Gradient {
    GradientStop { position: 0.0; color: "#555" }
    GradientStop { position: 1.0; color: "#222" }
}
}
                    }
                }
            }
        }
    }


