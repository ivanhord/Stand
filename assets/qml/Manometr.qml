import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import "qrc:/qml/assets/qml"

Item {
    id: root
    width: 400
    height: 400

    property real pressure: manometrCtrl.pressure
    property real pMax: 1000
    property real pLimit: 700
    property string unit: "бар"
    // Базовый размер для масштабирования
    property real baseSize: Math.min(width, height)
    property bool isSmallScreen: baseSize < 300

    readonly property real delta: (pLimit < 500) ? 0.2 * pLimit : 100
    property real angleStart: 135      // Начало шкалы (по часовой)
    property real angleEnd: 45         // Конец шкалы (по часовой)
    property real angleRange: ((angleEnd + 360) - angleStart) % 360

    //property real newValue: 0
    // Подключаем калькулятор
    Calculator {
        id: calculator
        initialValue: pLimit

        onAccepted: {
            limitInput.text = value.toFixed(2);
            pLimit = value;
        }
        onCanceled: {
            // Действия при отмене, если нужны
        }
    }

    property alias limitInput: limitInput.text  // Привязка к полю limit*/

    Connections {
        target: manometrCtrl
        function onPressureChanged() {
            pressure = manometrCtrl.pressure
        }
    }

    Connections {
        target: root
        function onPLimitChanged() {
            gauge.requestPaint();
            pointer.requestPaint();
        }
    }


    function toAngle(p) {
        let normalized = (p / pMax) * angleRange;
        return (angleStart + normalized) % 360;
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Canvas {
            id: gauge
            anchors {
                fill: parent
                margins: baseSize *0.075
            }
            onPaint: {
                let ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.save();

                let centerX = width / 2;
                let centerY = height / 2;
                let radius = Math.min(centerX, centerY) - baseSize * 0.00001;

                function toAngle(p) {
                    let normalized = (p / pMax) * angleRange;
                    return (angleStart + normalized) % 360;
                }

                function getColorForPressure(p) {
                    if (p < pLimit - delta) return "#aaa";        // серый
                    else if (p < pLimit) return "yellow";         // жёлтый
                    else return "red";                            // красный
                }

                function drawTick(angleDeg, length, value = -1) {
                    let angleRad = angleDeg * Math.PI / 180;
                    let x1 = centerX + (radius - length) * Math.cos(angleRad);
                    let y1 = centerY + (radius - length) * Math.sin(angleRad);
                    let x2 = centerX + radius * Math.cos(angleRad);
                    let y2 = centerY + radius * Math.sin(angleRad);

                    let tickValue = (value >= 0) ? value : ((angleDeg - angleStart + 360) % 360) / angleRange * pMax;
                    let color = getColorForPressure(tickValue);

                    ctx.beginPath();
                    ctx.moveTo(x1, y1);
                    ctx.lineTo(x2, y2);
                    ctx.strokeStyle = color;
                    ctx.lineWidth = baseSize * 0.005;;
                    ctx.stroke();

                    if (value >= 0) {
                        let lx = centerX + (radius - length - baseSize * 0.04) * Math.cos(angleRad);
                        let ly = centerY + (radius - length - baseSize * 0.04) * Math.sin(angleRad);
                        ctx.fillStyle = color;
                        ctx.font = (baseSize * 0.03) + "px sans-serif";
                        ctx.textAlign = "center";
                        ctx.textBaseline = "middle";
                        ctx.fillText(value.toFixed(0), lx, ly);
                    }
                }

                // Рисуем деления
                for (let p = 0; p <= pMax; p += pMax / 100) {
                    let angle = toAngle(p);
                    if (p % 100 === 0) {
                        drawTick(angle, baseSize * 0.05, p);
                    } else {
                        drawTick(angle, baseSize * 0.025);
                    }
                }

                ctx.restore();
            }

        }

        // Надпись сверху
        Text {
            id: gaugeLabel
            text: "Давление\nнагнетания\nбар"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.6
            wrapMode: Text.WordWrap
            font.pixelSize: baseSize * 0.035
            color: "white"
            horizontalAlignment: Text.AlignHCenter

            // Вертикальное размещение между шкалой и кругом
            Component.onCompleted: updateY()
            onWidthChanged: updateY()
            onHeightChanged: updateY()
            onParentChanged: updateY()

            function updateY() {
                let r_outer = baseSize / 2 - baseSize * 0.075;
                let r_inner = baseSize * 0.15;
                let mid = (r_outer + r_inner) / 2;
                let offset = baseSize * 0.03;
                y = root.height / 2 + offset - mid - height / 2;
            }

        }
        // Стрелка
        Canvas {
            id: pointer
            anchors.fill: parent
            onPaint: {
                let ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                let cx = width / 2;
                let cy = height / 2;
                let length = baseSize * 0.4;
                let angle = toAngle(Math.min(pressure, pMax)) * Math.PI / 180;

                let baseWidth = baseSize * 0.03;
                let tipX = cx + length * Math.cos(angle);
                let tipY = cy + length * Math.sin(angle);

                let leftX = cx + baseWidth * Math.cos(angle + Math.PI / 2);
                let leftY = cy + baseWidth * Math.sin(angle + Math.PI / 2);

                let rightX = cx + baseWidth * Math.cos(angle - Math.PI / 2);
                let rightY = cy + baseWidth * Math.sin(angle - Math.PI / 2);

                let gradient = ctx.createLinearGradient(cx, cy, tipX, tipY);
                gradient.addColorStop(0, "#ffffff");
                gradient.addColorStop(1, "#666666");

                ctx.beginPath();
                ctx.moveTo(tipX, tipY);
                ctx.lineTo(leftX, leftY);
                ctx.lineTo(rightX, rightY);
                ctx.closePath();
                ctx.fillStyle = gradient;
                ctx.fill();
            }
        }

        // Центральный круг с текущим значением
        Rectangle {
            anchors.centerIn: parent
            width: baseSize * 0.3
            height: width
            radius: width / 2
            color: "#444"
            border.color: "#888"

            Column {
                anchors.centerIn: parent
                spacing: baseSize * 0.015
                Text {
                    text: pressure.toFixed(2)
                    font.pixelSize: baseSize * 0.06
                    color: (pressure < pLimit - delta) ? "white" :
                           (pressure < pLimit) ? "yellow" : "red"
                    horizontalAlignment: Text.AlignHCenter
                }

            }
        }

        // Поле ввода предельного значения
        Row {
            id: limitControl
            spacing: baseSize * 0.015

            // Вычисляем позицию по центру нижнего участка дуги
            property real radius: baseSize / 2 - baseSize * 0.1
            property real angleDeg: (angleStart + angleEnd + 360) / 2 % 360
            property real angleRad: angleDeg * Math.PI / 180

            x: root.width / 2 + radius * Math.cos(angleRad) - width / 2
            y: root.height / 2 + radius - height / 2 - baseSize * 0.05


            // Цвет прямоугольного индикатора слева
             property color zoneColor: (pressure < pLimit - delta) ? "#aaa" :
                                       (pressure < pLimit) ? "yellow" : "red"



            TextField {
                id: limitInput
                text: pLimit.toFixed(2)
                //elide: Text.ElideNone
                clip: false
                validator: DoubleValidator { bottom: 0; top: pMax }
                width: baseSize * 0.2
                height: baseSize * 0.08
                font.pixelSize: baseSize * 0.035
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftPadding: baseSize * 0.01
                rightPadding: baseSize * 0.01
                topPadding: baseSize * 0.01
                bottomPadding: baseSize * 0.01

                onTextChanged: {
                    updatePLimitTimer.restart()
                }

                onEditingFinished: {
                    // страховка, если пользователь просто нажал Enter
                    updatePLimitTimer.restart()
                }

                background: Rectangle {
                    gradient: LinearGradient {
                        x1: 0; y1: 1
                        x2: 0; y2: 0
                        spread: Gradient.ReflectSpread
                        GradientStop { position: 0.0; color: "#3A3A3A" }
                        GradientStop { position: 0.882927; color: "#656565" }
                    }
                    radius: baseSize * 0.01


                    // Индикатор зоны давления
                    Rectangle {
                        id: zoneIndicator
                        width: baseSize * 0.025
                        height: baseSize * 0.01
                        radius: baseSize * 0.005
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.margins: baseSize * 0.01
                        color: (pressure < pLimit - delta) ? "#aaa" :
                                   (pressure < pLimit) ? "yellow" : "red"
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: showCalculator()
                }
            }

        }
    }
    // Функция для показа калькулятора
    function showCalculator() {
        var component = Qt.createComponent("Calculator.qml")
        if (component.status === Component.Ready) {
            var calc = component.createObject(null, {
                initialValue: ""//,
                //inputField: inputField                                  //parseFloat(limitInput.text)
            })

            calc.accepted.connect(function(value) {
                limitInput.text = Number(value).toFixed(2)
                pLimit = Number(value)
                calc.destroy()
            })

            calc.canceled.connect(function() {
                calc.destroy()
            })

            calc.show()
        }
    }

    // Автообновление
    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            gauge.requestPaint()
            pointer.requestPaint()
        }
    }
    // Таймер для задержки применения pLimit
    Timer {
        id: updatePLimitTimer
        interval: 300
        repeat: false
        onTriggered: {
            let value = parseFloat(limitInput.text)
            if (!isNaN(value)) {
                pLimit = value
            }
        }
    }
}
