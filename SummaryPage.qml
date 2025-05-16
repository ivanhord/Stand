import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: 800
    height: 600
    color: "#101010"

    property real pressureOutput: 12.73
    property real pressureInput: 0.11
    property real fluidTemperature: 29.58
    property real totalFlowRate: 98.83
    property int valvePosition: 75  // %
    property bool dumpValveOpen: false

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        SummaryRow {
            label: "Давление нагнетания, бар"
            value: root.pressureOutput
        }

        SummaryRow {
            label: "Давление подпитки, бар"
            value: root.pressureInput
        }

        SummaryRow {
            label: "Температура РЖ, °C"
            value: root.fluidTemperature
        }

        SummaryRow {
            label: "Суммарный расход, л/мин"
            value: root.totalFlowRate
        }

        SummaryRow {
            label: "Положение игольчатого крана, %"
            value: root.valvePosition
        }

        SummaryRow {
            label: "Кран сброса"
            textValue: root.dumpValveOpen ? "Открыт" : "Закрыт"
            color: root.dumpValveOpen ? "red" : "lightgreen"
        }
    }
}
