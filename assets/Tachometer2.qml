import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: tachometer
    width: 300
    height: 300
    
    property real value: 0
    property real maxValue: 700
    
    // Прозрачный фон (по ТЗ)
    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }
    
    // Центральный серый круг
    Rectangle {
        id: centerCircle
        anchors.centerIn: parent
        width: parent.width * 0.7
        height: width
        radius: width / 2
        color: "#333"
        opacity: 0.7
    }
    
    // Шкала тахометра
    Repeater {
        model: 71 // 700 / 10 + 1
        
        Item {
            property real angle: -120 + (index * 10 / tachometer.maxValue) * 240
            property bool isMajor: index % 10 === 0
            
            // Длина делений (длиннее для значений, кратных 100)
            property real markLength: isMajor ? 20 : 10
            property real innerRadius: tachometer.width / 2 - markLength
            
            // Цвет делений по ТЗ
            property color markColor: {
                if (index === 0) return "white"
                if (index <= 2) return "gray"      // 10-20
                if (index === 3) return "yellow"   // 30
                return "red"                      // 40-700
            }
            
            Rectangle {
                x: tachometer.width / 2 - width / 2
                y: 0
                width: isMajor ? 3 : 2
                height: markLength
                color: markColor
                
                transform: [
                    Rotation {
                        origin.x: width / 2
                        origin.y: tachometer.height / 2
                        angle: parent.angle
                    }
                ]
            }
            
            // Текст для значений, кратных 100
            Text {
                visible: isMajor
                text: index * 10
                color: "white"
                font.pixelSize: 12
                x: tachometer.width / 2 + Math.sin(angle * Math.PI / 180) * (tachometer.width / 2 - 30) - width / 2
                y: tachometer.height / 2 - Math.cos(angle * Math.PI / 180) * (tachometer.width / 2 - 30) - height / 2
            }
        }
    }
    
    // Стрелка (узкий треугольник с градиентом)
    Canvas {
        id: needle
        anchors.fill: parent
        rotation: -120 + (tachometer.value / tachometer.maxValue) * 240
        transformOrigin: Item.Center
        
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            
            // Градиент для стрелки
            var gradient = ctx.createLinearGradient(0, height/2, 0, 0)
            gradient.addColorStop(0, Qt.rgba(0.8, 0.8, 0.8, 1))  // Серый у основания
            gradient.addColorStop(1, "white")                     // Белый на конце
            
            ctx.fillStyle = gradient
            ctx.strokeStyle = "transparent"
            
            // Рисуем треугольник (стрелку)
            ctx.beginPath()
            ctx.moveTo(width/2, height/2 + 10)  // Основание стрелки (шире)
            ctx.lineTo(width/2 - 3, height/2 - 100)  // Левый край
            ctx.lineTo(width/2 + 3, height/2 - 100)  // Правый край
            ctx.closePath()
            ctx.fill()
        }
        
        // Перерисовываем при изменении значения
        onRotationChanged: requestPaint()
    }
    
    // Центральная точка
    Rectangle {
        anchors.centerIn: parent
        width: 16
        height: width
        radius: width / 2
        color: "#333"
        border.color: "#555"
        border.width: 2
        z: 2
    }
    
    // Анимация изменения значения
    Behavior on value {
        NumberAnimation { duration: 500 }
    }
}