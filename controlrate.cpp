// controlrate.cpp
#include <QDebug>
#include "controlrate.h"

ControlRate::ControlRate(QObject *parent)
    : QObject(parent)
{
    // Единый таймер: тик раз в секунду
    m_timer.setInterval(1000);
    connect(&m_timer, &QTimer::timeout, this, &ControlRate::updateAll);
    m_timer.start();

    // Таймер для клапана: одноразовый, 1 секунда
    m_valveTimer.setSingleShot(true);
    connect(&m_valveTimer, &QTimer::timeout, this, &ControlRate::finishValveAction);
}

void ControlRate::updateAll()
{
    // 1) Расход (flowRate) циклично 0…500 л/мин
    m_flowRate += m_flowDir * 1.0;
    if (m_flowRate >= 500.0) {
        m_flowRate = 500.0;
        m_flowDir = -1;
    } else if (m_flowRate <= 0.0) {
        m_flowRate = 0.0;
        m_flowDir = +1;
    }
    emit flowRateChanged();

    //  Суммарный объём (л): flowRate (л/мин) → л/сек = flowRate / 60
    m_totalVolume += m_flowRate / 60.0;
    emit totalVolumeChanged();

    // 2) Температура РЖ циклично –20…+20 °C со скоростью 1 °C/мин → 1/60 °C/с
    m_temperature += m_tempDir * (1.0/60.0);
    if (m_temperature >= 20.0) {
        m_temperature = 20.0;
        m_tempDir = -1;
    } else if (m_temperature <= -20.0) {
        m_temperature = -20.0;
        m_tempDir = +1;
    }
    emit temperatureChanged();

    // 3) Давление подпора циклично 0…7 бар со скоростью 0.1 бар/с
    m_backPressure += m_backDir * 0.1;
    if (m_backPressure >= 7.0) {
        m_backPressure = 7.0;
        m_backDir = -1;
    } else if (m_backPressure <= 0.0) {
        m_backPressure = 0.0;
        m_backDir = +1;
    }
    emit backPressureChanged();
}

void ControlRate::resetFlow()
{
    qDebug() << "[ControlRate] resetFlow() called";
    m_totalVolume = 0.0;
    emit totalVolumeChanged();
}

void ControlRate::openValve()
{
    // Запускаем таймер открытия/закрытия на 1 с
    m_valveTimer.start(1000);
    // Меняем флаг сразу, чтобы UI мгновенно обновился
    m_valveOpen = false;
    emit valveOpenChanged();
}

void ControlRate::closeValve()
{
    m_valveTimer.start(1000);
    m_valveOpen = true;
    emit valveOpenChanged();
}

void ControlRate::finishValveAction()
{
    // По завершении инвертируем состояние клапана
    m_valveOpen = !m_valveOpen;
    emit valveOpenChanged();
}

QString ControlRate::pressureColor() const
{
    // Цвет текста давления в зависимости от величины
    if (m_backPressure < 0.5)
        return "yellow";
    else if (m_backPressure < 6.0)
        return "white";
    else
        return "red";
}
