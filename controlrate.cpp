#include "controlrate.h"


ControlRate::ControlRate(QObject *parent)
    : QObject(parent),
      m_flowRate(0.0),
      m_totalVolume(0.0),
      m_temperature(0.0),
      m_pressure(0.0),
      m_valveOpen(false)
{

}

double ControlRate::flowRate() const {return m_flowRate; }
double ControlRate::totalVolume() const {return m_totalVolume; }
double ControlRate::temperature() const {return m_temperature; }
double ControlRate::pressure() const {return m_pressure; }
bool ControlRate::valveOpen() const {return m_valveOpen; }

QString ControlRate::pressureColor() const {
    if (m_pressure < 0.5)
        return "yellow";
    else if (m_pressure >= 3 && m_pressure < 6)
        return "white";
    else
        return "red";
}

void ControlRate::resetFlow() {
    m_totalVolume = 0;
    emit dataChanged();
}

void ControlRate::openValve() {
    m_valveOpen = true;
    emit dataChanged();
}

void ControlRate::closeValve() {
    m_valveOpen = false;
    emit dataChanged();
}
