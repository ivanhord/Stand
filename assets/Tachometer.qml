import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: tachometer
    width: 300
    height: 300
    
    property real value: 0
    property real maxValue: 700
    
    Rectangle {
        id: dial
        anchors.fill: parent
        radius: width / 2
        color: Qt.rgba(0.4, 0.4, 0.4, 0.7)
        border.color: "gray"
        border.width: 2
    }
    
    Repeater {
        model: 71 // 700 / 10 + 1
        delegate: Rectangle {
            property real angle: -120 + (index * 10 / tachometer.maxValue) * 240
            x: tachometer.width / 2 - width / 2
            y: 0
            width: index % 10 === 0 ? 3 : 2
            height: index % 10 === 0 ? 20 : 10
            color: {
                if (index * 10 <= 20) return "yellow"
                if (index * 10 <= 40) return "orange"
                return "red"
            }
            transform: [
                Rotation {
                    origin.x: width / 2
                    origin.y: tachometer.height / 2
                    angle: parent.angle
                }
            ]
        }
    }
    
    Repeater {
        model: 8 // 700 / 100 + 1
        delegate: Text {
            text: index * 100
            color: "white"
            font.pixelSize: 12
            x: tachometer.width / 2 + Math.sin((-120 + (index * 100 / tachometer.maxValue) * 240) * Math.PI / 180) * 110 - width / 2
            y: tachometer.height / 2 - Math.cos((-120 + (index * 100 / tachometer.maxValue) * 240) * Math.PI / 180) * 110 - height / 2
        }
    }
    
    Item {
        id: needle
        anchors.centerIn: parent
        rotation: -120 + (tachometer.value / tachometer.maxValue) * 240
        transformOrigin: Item.Bottom
        
        Rectangle {
            x: -2
            y: -120
            width: 4
            height: 120
            color: "white"
            antialiasing: true
        }
        
        Rectangle {
            x: -1
            y: -1
            width: 2
            height: 2
            radius: 1
            color: "white"
        }
    }
    
    Rectangle {
        id: center
        anchors.centerIn: parent
        width: 20
        height: 20
        radius: 10
        color: "#333"
        z: 2
    }
    
    Behavior on value {
        NumberAnimation { duration: 500 }
    }
}