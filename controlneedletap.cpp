#include "controlneedletap.h"
#include <QtMath>
#include <QDebug>

ControlNeedleTap::ControlNeedleTap(QObject *parent)
    : QObject(parent)
{
    // Раз в 100 мс дергаем onTimerTick()
    m_timer.setInterval(TIMER_INTERVAL_MS);
    connect(&m_timer, &QTimer::timeout, this, &ControlNeedleTap::onTimerTick);
}

// «+» и «–» теперь просто перелаживают цель
void ControlNeedleTap::increase() {
    setTarget(qMin<qreal>(m_targetValue + m_stepSize, 100.0));
}

void ControlNeedleTap::decrease() {
    setTarget(qMax<qreal>(m_targetValue - m_stepSize, 0.0));
}

void ControlNeedleTap::openValve() {
    setTarget(100.0);
}

void ControlNeedleTap::closeValve() {
    setTarget(0.0);
}

void ControlNeedleTap::setTarget(qreal value) {
    value = qBound<qreal>(0.0, value, 100.0);
    if (!qFuzzyCompare(m_targetValue, value)) {
        m_targetValue = value;
        emit targetValueChanged();
        startMoving();    // запускаем/перезапускаем движение
        qDebug() << "[NeedleTap] New target =" << m_targetValue;
    }
}

void ControlNeedleTap::setStepSize(qreal value)
{
    value = qMax<qreal>(0.0, value);
    if (!qFuzzyCompare(m_stepSize, value)) {
        m_stepSize = value;
        emit stepSizeChanged();
        qDebug() << "[NeedleTap] New stepSize =" << m_stepSize;
    }
}

void ControlNeedleTap::startMoving() {
    if (!m_timer.isActive())
        m_timer.start();
}

// Тик таймера: приближаем текущий → целевому
void ControlNeedleTap::onTimerTick() {
    // сколько процентов за один тик?
    qreal percentPerSec = 100.0 / FULL_CYCLE_SECONDS;
    qreal stepPerTick  = percentPerSec * (TIMER_INTERVAL_MS / 1000.0);

    qreal diff = m_targetValue - m_currentValue;
    if (qAbs(diff) <= stepPerTick) {
        // дошли до цели
        m_currentValue = m_targetValue;
        m_timer.stop();
    } else {
        // двигаемся в сторону цели
        m_currentValue += (diff > 0 ? stepPerTick : -stepPerTick);
    }
    emit currentValueChanged();
    qDebug() << "[NeedleTap] Current =" << m_currentValue;
}
