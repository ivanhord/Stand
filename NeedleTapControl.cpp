#include "NeedleTapControl.h"
#include <QDebug>

NeedleTapControl::NeedleTapControl(QObject *parent)
    : QObject(parent),
      m_targetValue(80.0),
      m_currentValue(0.0),
      m_stepSize(0.5)
{
}

double NeedleTapControl::targetValue() const { return m_targetValue; }
double NeedleTapControl::currentValue() const { return m_currentValue; }
double NeedleTapControl::stepSize() const { return m_stepSize; }

void NeedleTapControl::setTargetValue(double value)
{
    if (qFuzzyCompare(m_targetValue, value))
        return;
    m_targetValue = value;
    emit targetValueChanged();
}

void NeedleTapControl::setCurrentValue(double value)
{
    if (qFuzzyCompare(m_currentValue, value))
        return;
    m_currentValue = value;
    emit currentValueChanged();
}

void NeedleTapControl::setStepSize(double value)
{
    if (qFuzzyCompare(m_stepSize, value))
        return;
    m_stepSize = value;
    emit stepSizeChanged();
}

void NeedleTapControl::increase()
{
    setCurrentValue(m_currentValue + m_stepSize);
    qDebug() << "Valve increased to" << m_currentValue;
}

void NeedleTapControl::decrease()
{
    setCurrentValue(m_currentValue - m_stepSize);
    qDebug() << "Valve decreased to" << m_currentValue;
}

void NeedleTapControl::openValve()
{
    setCurrentValue(100.0);
    emit valveOpened();
    qDebug() << "Valve opened";
}

void NeedleTapControl::closeValve()
{
    setCurrentValue(0.0);
    emit valveClosed();
    qDebug() << "Valve closed";
}

void NeedleTapControl::setTarget(double value)
{
    setTargetValue(value);
    qDebug() << "Target value set to" << m_targetValue;
}
