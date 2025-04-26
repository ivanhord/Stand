import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/assets/qml"


Item {
    id: root
    anchors.fill: parent
    function processInput() {
        let sanitizedText = targetInput.text.replace(",", ".");
        let val = parseFloat(sanitizedText);
        if (!isNaN(val)) {
            needleCtrl.setTarget(val);
            targetInput.text = val.toFixed(2);  // Стабилизируем отображение
        } else {
            console.log("Ошибка парсера числа:", sanitizedText);
        }
    }
    Component.onCompleted: {
        console.log("QML запущен, currentValue:", needleCtrl.currentValue)
    }
    Connections {
        target: needleCtrl
        onCurrentValueChanged: {
            console.log("currentValue changed:", needleCtrl.currentValue)
        }
    }

    Rectangle {
           anchors.fill: parent
           color: "#333333"
           z: -1 // обязательно, чтобы он был на заднем плане
       }

    property real targetValue: 80
    property real currentValue: 93.81
    property real stepSize: 0.5
    property string currentField: ""

    property real newValue: 0


    property alias targetInput: targetInput .text  // Привязка к полю target
    property alias stepInput: stepInput.text      // Привязка к полю step

    // Подключаем калькулятор
    Calculator {
        id: calculator
        onClosed: {
            if (targetInput.text === "") {
                targetInput.text = newValue.toFixed(2);  // Обновляем поле target
            } else if (stepInput.text === "") {
                stepInput.text = newValue.toFixed(2);    // Обновляем поле step
            }
        }
        onOpened: {
            // При открытии калькулятора очищаем поле ввода
            calculator.inputField.text = "";
        }

    }

    Rectangle {
        id: groupBox
        width: 270
        height: 230
        anchors.centerIn: parent
        radius: 8
        border.color: "#888"
        color : "#333333"
        anchors.margins: 12

        Rectangle {
            id: groupTitleBackground
            width: 140
            height: 24
            radius: 2
            color: "orange"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 12
            anchors.topMargin: -12
            z: 2

            Text {
                anchors.centerIn: parent
                text: "Игольчатый кран"
                color: "white"
                font.bold: true
                font.pixelSize: 14
            }
        }

        Column {
            anchors.fill: parent
            anchors.topMargin: 32
            anchors.bottomMargin: 16
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            spacing: 16

            // --- Целевая величина и текущее положение ---
            Row {
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    width: 80
                    height: 34
                    radius: 2
                    border.width: 0
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#3a3a3a" }
                        GradientStop { position: 0.882927; color: "#656565" }
                    }

                    TextField {
                        id: targetInput
                        anchors.fill: parent
                        anchors.margins: 0
                        color: "white"
                        font.pixelSize: 14
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                        background: null
                        text: Number(needleCtrl.targetValue).toFixed(2)
                        validator: DoubleValidator { bottom: 0; top: 100 }
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                        MouseArea {
                            anchors.fill: parent
                        onClicked: {
                            calculator.inputField = targetInput;  // Передаем ссылку на поле targetField
                            calculator.open();

                        }}
                    }
                }

                Column {
                    spacing: 2
                    Text {
                        text: Number(needleCtrl.currentValue).toFixed(2)

                        font.pixelSize: 18
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: "Положение, %"
                        font.pixelSize: 12
                        color: "#bbb"
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Rectangle {
                    width: 10
                    height: 4
                    radius: 0
                    color: needleCtrl.currentValue > 0 ? "green" : "red"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // --- Шаг и кнопки + - ---
            Column {
                spacing: 4
                anchors.horizontalCenter: parent.horizontalCenter

                Row {
                    spacing: 6

                    // Шаговое поле
                    Rectangle {
                        width: 80
                        height: 34
                        radius: 2
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#656565" }
                            GradientStop { position: 0.882927; color: "#3a3a3a" }
                        }

                        TextField {
                            id: stepInput
                            anchors.fill: parent
                            anchors.margins: 0
                            background: null
                            color: "white"
                            font.pixelSize: 14
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            text: needleCtrl.stepSize.toString()
                            validator: DoubleValidator {
                                bottom: 0.0
                                top: 100.0
                                decimals: 3
                                notation: DoubleValidator.StandardNotation
                            }
                            inputMethodHints: Qt.ImhFormattedNumbersOnly
                            onPressed: {
                                calculator.inputField = stepInput;
                                calculator.open()
                            }
                        }
                                            }

                    // Группа кнопок + и - с подписью
                    Column {
                        id: stepButtonGroup
                        spacing: 2
                        //anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenter: parent.verticalCenter

                        Row {
                            id: stepButtons
                            spacing: 6

                            Button {
                                width: 60
                                height: 34
                                text: "+"
                                padding: 0
                                background: Rectangle {
                                    anchors.fill: parent
                                    radius: 2
                                    border.width: 0
                                    gradient: Gradient {
                                        GradientStop { position: 0.0; color: "#656565" }
                                        GradientStop { position: 1.0; color: "#3a3a3a" }
                                    }
                                }
                                contentItem: Text {
                                    text: parent.text
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 32
                                    color: "white"
                                }
                                onClicked: {
                                    needleCtrl.stepSize = parseFloat(stepInput.text.replace(",", "."));
                                    needleCtrl.increase();
                                }
                            }

                            Button {
                                width: 60
                                height: 34
                                text: "-"
                                padding: 0
                                background: Rectangle {
                                    anchors.fill: parent
                                    radius: 2
                                    border.width: 0
                                    gradient: Gradient {
                                        GradientStop { position: 0.0; color: "#656565" }
                                        GradientStop { position: 1.0; color: "#3a3a3a" }
                                    }
                                }
                                contentItem: Text {
                                    text: parent.text
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 32
                                    color: "white"
                                }
                                onClicked: {
                                    needleCtrl.stepSize = parseFloat(stepInput.text.replace(",", "."));
                                    needleCtrl.decrease();
                                }
                            }
                        }

                        Text {
                            text: "Шаг"
                            font.pixelSize: 12
                            color: "#bbb"
                            anchors.horizontalCenter: stepButtons.horizontalCenter
                        }
                    }
                }
            }

            // --- Кнопки управления ---
            Row {
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "Открыть"
                    font.pixelSize: 14
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        anchors.centerIn: parent
                    }
                    background: Rectangle {
                        radius: 2
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#656565" }
                            GradientStop { position: 1.0; color: "#3a3a3a" }
                        }
                    }
                    onClicked: needleCtrl.openValve()
                }

                Button {
                    text: "Закрыть"
                    font.pixelSize: 14
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        anchors.centerIn: parent
                    }
                    background: Rectangle {
                        radius: 2
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#656565" }
                            GradientStop { position: 1.0; color: "#3a3a3a" }
                        }
                    }
                    onClicked: needleCtrl.closeValve()
                }
            }
        }
    }
}
