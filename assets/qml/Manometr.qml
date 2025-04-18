import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15

Item {
    id: root
    width: 400
    height: 400

    property real pressure: 516.89
    property real pMax: 1000
    property real pLimit: 700
    property string unit: "бар"

    readonly property real delta: (pLimit < 500) ? 0.2 * pLimit : 100
    property real angleStart: 135      // Начало шкалы (по часовой)
    property real angleEnd: 45         // Конец шкалы (по часовой)
    property real angleRange: ((angleEnd + 360) - angleStart) % 360


    function toAngle(p) {
        let normalized = (p / pMax) * angleRange;
        return (angleStart + normalized) % 360;
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Canvas {
            id: gauge
            anchors.fill: parent
            onPaint: {
                let ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.save();

                let centerX = width / 2;
                let centerY = height / 2;
                let radius = Math.min(centerX, centerY) - 30;

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
                    ctx.lineWidth = 2;
                    ctx.stroke();

                    if (value >= 0) {
                        let lx = centerX + (radius - length - 15) * Math.cos(angleRad);
                        let ly = centerY + (radius - length - 15) * Math.sin(angleRad);
                        ctx.fillStyle = color;
                        ctx.font = "11px sans-serif";
                        ctx.textAlign = "center";
                        ctx.textBaseline = "middle";
                        ctx.fillText(value.toFixed(0), lx, ly);
                    }
                }

                // Рисуем деления
                for (let p = 0; p <= pMax; p += pMax / 100) {
                    let angle = toAngle(p);
                    if (p % 100 === 0) {
                        drawTick(angle, 20, p);
                    } else {
                        drawTick(angle, 10);
                    }
                }

                ctx.restore();
            }

        }

        // Надпись сверху
        Text {
            text: "Давление\nнагнетания\nбар"
            anchors.top: gauge.top
            anchors.topMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            padding: 4
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
                let length = Math.min(cx, cy) - 40;
                let angle = toAngle(Math.min(pressure, pMax)) * Math.PI / 180;

                let baseWidth = 12;
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
            width: 120
            height: 120
            radius: 60
            color: "#444"
            border.color: "#888"

            Column {
                anchors.centerIn: parent
                spacing: 6
                Text {
                    text: pressure.toFixed(2)
                    font.pixelSize: 24
                    color: (pressure < pLimit - delta) ? "white" :
                           (pressure < pLimit) ? "yellow" : "red"
                    horizontalAlignment: Text.AlignHCenter
                }
                /*Text {
                    text: unit
                    font.pixelSize: 12
                    color: "lightgray"
                    horizontalAlignment: Text.AlignHCenter
                }*/
            }
        }

        // Поле ввода Pз
        Row {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 6
            Text {
                text: "Pз:"
                font.pixelSize: 14
                color: "white"
            }
            TextField {
                id: limitInput
                text: pLimit.toString()
                validator: DoubleValidator { bottom: 0; top: pMax }
                onEditingFinished: pLimit = parseFloat(text)
                width: 80
            }
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
}
