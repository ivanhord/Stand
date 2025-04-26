#include "controlneedletap.h"
#include <QDebug>

ControlNeedleTap::ControlNeedleTap(QObject *parent)
    : QObject(parent)
{
}

// Геттеры
qreal ControlNeedleTap::targetValue() const {
    return m_targetValue;
}

qreal ControlNeedleTap::currentValue() const {
    return m_currentValue;
}

qreal ControlNeedleTap::stepSize() const {
    return m_stepSize;
}

// Сеттеры
void ControlNeedleTap::setTargetValue(qreal value) {
    qDebug() << "[NeedleTap] setCurrentValue:" << value;
    if (!qFuzzyCompare(m_targetValue, value)) {
        m_targetValue = value;
        emit targetValueChanged();
    }
}

void ControlNeedleTap::setCurrentValue(qreal value) {
    if (!qFuzzyCompare(m_currentValue, value)) {
        m_currentValue = value;
        emit currentValueChanged();
    }
}

void ControlNeedleTap::setStepSize(qreal value) {
    qDebug() << "[NeedleTap] setStepSize:" << value;
    if (!qFuzzyCompare(m_stepSize, value)) {
        m_stepSize = value;
        emit stepSizeChanged();
    }
}

// Управление краном
void ControlNeedleTap::increase() {
    qreal newValue = m_currentValue + m_stepSize;
    if (newValue > 100) newValue = 100;
    updateCurrentValue(newValue);
    qDebug() << "[NeedleTap] Increase to" << newValue;
}

void ControlNeedleTap::decrease() {
    qreal newValue = m_currentValue - m_stepSize;
    if (newValue < 0) newValue = 0;
    updateCurrentValue(newValue);
    qDebug() << "[NeedleTap] Decrease to" << newValue;
}

void ControlNeedleTap::openValve() {
    updateCurrentValue(100);
    qDebug() << "[NeedleTap] Open Valve";
}

void ControlNeedleTap::closeValve() {
    updateCurrentValue(0);
    qDebug() << "[NeedleTap] Close Valve";
}

void ControlNeedleTap::setTarget(qreal value) {
    if (value < 0) value = 0;
    if (value > 100) value = 100;
    setTargetValue(value);
    updateCurrentValue(value);
    qDebug() << "[NeedleTap] Set Target to" << value;
}

void ControlNeedleTap::updateCurrentValue(qreal newValue) {
    setCurrentValue(newValue);
}
