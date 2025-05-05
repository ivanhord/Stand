// controlrate.h
#ifndef CONTROLRATE_H
#define CONTROLRATE_H

#include <QObject>
#include <QTimer>

class ControlRate : public QObject
{
    Q_OBJECT

    // Расход и суммарный объём
    Q_PROPERTY(double flowRate     READ flowRate    NOTIFY flowRateChanged)
    Q_PROPERTY(double totalVolume  READ totalVolume NOTIFY totalVolumeChanged)

    // Клапан сброса
    Q_PROPERTY(bool   valveOpen    READ valveOpen   NOTIFY valveOpenChanged)

    // Температура РЖ
    Q_PROPERTY(double temperature   READ temperature   NOTIFY temperatureChanged)

    // Давление подпора (alias backPressure)
    Q_PROPERTY(double backPressure READ backPressure NOTIFY backPressureChanged)

    // Для QML‑компонента Liquid.qml
    Q_PROPERTY(double pressure       READ pressure       NOTIFY backPressureChanged)
    Q_PROPERTY(QString pressureColor READ pressureColor NOTIFY backPressureChanged)

public:
    explicit ControlRate(QObject *parent = nullptr);

    // Геттеры
    double flowRate()    const { return m_flowRate; }
    double totalVolume() const { return m_totalVolume; }
    bool   valveOpen()   const { return m_valveOpen; }

    double temperature()   const { return m_temperature; }
    double backPressure()  const { return m_backPressure; }

    // Псевдоним для QML: pressure ≡ backPressure
    double pressure()      const { return m_backPressure; }
    QString pressureColor() const;

public slots:
    void resetFlow();
    void openValve();
    void closeValve();

signals:
    void flowRateChanged();
    void totalVolumeChanged();
    void valveOpenChanged();
    void temperatureChanged();
    void backPressureChanged();

private slots:
    void updateAll();           // единый тик: flow, volume, temp, pressure
    void finishValveAction();   // завершение открытия/закрытия клапана

private:
    QTimer  m_timer;            // тик каждую секунду
    QTimer  m_valveTimer;       // таймер 1 с для клапана

    // Поток и объём
    double  m_flowRate    = 0.0;
    double  m_totalVolume = 0.0;
    int     m_flowDir     = +1;    // направление изменения потока

    // Клапан сброса
    bool    m_valveOpen   = false;

    // Температура РЖ
    double  m_temperature = -20.0;  // стартовое значение
    int     m_tempDir     = +1;     // направление изменения температуры

    // Давление подпора
    double  m_backPressure = 0.0;
    int     m_backDir      = +1;    // направление изменения подпора
};

#endif // CONTROLRATE_H
