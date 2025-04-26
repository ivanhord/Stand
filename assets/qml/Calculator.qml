import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Popup {
    id: calculator
    width: Math.min(Screen.width * 0.8, 240)
    height: 400
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape
    background: null

    //property alias calculatorInput: calculatorInput
    property var inputField: null

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
                text: "0"
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
                        // Если поле пустое, не изменяем значение
                        if (calculatorInput.text.trim() === "") {
                            // Просто закрываем калькулятор, не меняя значения
                            calculator.close();
                            return;
                        }

                        // Убираем несколько точек подряд
                        let validText = calculatorInput.text.replace(/\.+/g, ".");

                        // Преобразуем в число
                        let parsedValue = parseFloat(validText);

                        // Проверяем, является ли введенное значение числом
                        if (isNaN(parsedValue)) {
                            newValue = 0.00; // Если введено что-то нечисловое, ставим нулевое значение
                        } else {
                            // Если значение больше максимального, ставим максимальное значение
                            if (typeof pMax !== "undefined" && parsedValue > pMax)
                            {
                                    newValue = pMax;
                                } else {
                                    newValue = parsedValue;
                                }
                            }


                        // Возвращаем значение в соответствующее поле
                        // Если калькулятор получил ссылку на поле, обновляем его
                        if (inputField) {
                            inputField.text = newValue.toFixed(2);  // Обновляем соответствующее поле
                        }

                        // Закрываем калькулятор после обновления значения
                        calculator.close();
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
                        // Если поле пустое, не изменяем значение
                        if (calculatorInput.text.trim() === "") {
                            // Просто закрываем калькулятор, не меняя значения
                            calculator.close();
                            return;
                        }
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
