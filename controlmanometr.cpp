#include "controlmanometr.h"

ControlManometr::ControlManometr(QObject *parent): QObject(parent)
{
    connect(&m_timer, &QTimer::timeout,this,&ControlManometr::updatePressure);
    m_timer.start(200);

}

double ControlManometr::pressure() const
{
    return m_pressure;
}

void ControlManometr::setPressure(double value)
{
    if (qFuzzyCompare(m_pressure, value))
        return;
    m_pressure = value;
    emit pressureChanged();

}

void ControlManometr::updatePressure()
{
    static int direction = 1;
    m_pressure += direction * 25;

    if (m_pressure >= 1000)
    {
        m_pressure = 1000;
        direction = -1;
    }
    else if (m_pressure <= 0)
    {
        m_pressure = 0;
        direction = 1;
    }

    emit pressureChanged();
}
