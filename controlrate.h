#ifndef CONTROLRATE_H
#define CONTROLRATE_H

#include <QObject>

class ControlRate : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double flowRate READ flowRate NOTIFY dataChanged)
    Q_PROPERTY(double totalVolume READ totalVolume NOTIFY dataChanged)
    Q_PROPERTY(double temperature READ temperature NOTIFY dataChanged)
    Q_PROPERTY(double pressure READ pressure NOTIFY dataChanged)
    Q_PROPERTY(bool valveOpen READ valveOpen NOTIFY dataChanged)
    Q_PROPERTY(QString pressureColor READ pressureColor NOTIFY dataChanged)

public:
    explicit ControlRate(QObject *parent = nullptr);

    double flowRate() const;
    double totalVolume() const;
    double temperature() const;
    double pressure() const;
    bool valveOpen() const;
    QString pressureColor() const;

public slots:
    void resetFlow();
    void openValve();
    void closeValve();

signals:
    void dataChanged();

private:
    double m_flowRate;
    double m_totalVolume;
    double m_temperature;
    double m_pressure;
    bool m_valveOpen;
};

#endif // CONTROLRATE_H
