#include "controlmanometr.h"
#include <QDebug>


ControlManometr::ControlManometr(QObject *parent): QObject(parent)
{
    m_timer.setInterval(200);  // тик каждые 200 мс
    connect(&m_timer, &QTimer::timeout, this, &ControlManometr::updatePressure);
    m_timer.start();

}


void ControlManometr::setPLimit(double limit)
{
    if (limit < 0) limit = 0;
    if (!qFuzzyCompare(limit, m_pLimit)) {
        m_pLimit = limit;
        emit pLimitChanged();
        // сбрасываем направление, чтобы начать новый цикл с нуля
        m_direction = +1;
        qDebug() << "[Manometr] New pLimit =" << m_pLimit;
    }
}

void ControlManometr::updatePressure()
{
    // верхняя граница = pLimit + 10
    double upper = m_pLimit + 10.0;
    // шаг на тик: (upper − 0) за полный цикл туда–обратно в 2 * (upper/step) секундах
    // но проще: пусть за один тик растёт на фиксированную величину:
    double step =  (upper) / (5000.0 /*мс*/ / m_timer.interval());
    // (например: полный путь 0→upper займёт 5 сек (5000 мс))

    m_pressure += m_direction * step;

    // если вышли за границы — меняем направление и корректируем
    if (m_pressure >= upper) {
        m_pressure = upper;
        m_direction = -1;
    }
    else if (m_pressure <= 0.0) {
        m_pressure = 0.0;
        m_direction = +1;
    }

    // сигнал аварии при > pLimit
    bool nowOver = (m_pressure > m_pLimit);
    if (nowOver && !m_overLimit) {
        m_overLimit = true;
        emit overLimit();
        qDebug() << "[Manometr] Over limit!" << m_pressure;
    }
    else if (!nowOver && m_overLimit) {
        m_overLimit = false;
        // при желании можно сигнализировать об окончании аварии
    }

    emit pressureChanged();
    //qDebug() << "[Manometr] Pressure =" << m_pressure;
}
