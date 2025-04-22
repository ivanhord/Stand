#ifndef CONTROLMANOMETR_H
#define CONTROLMANOMETR_H

#include <QObject>
#include <QTimer>


class ControlManometr : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double pressure READ pressure WRITE setPressure NOTIFY pressureChanged)

public:
    explicit ControlManometr(QObject *parent = nullptr);

    double pressure() const;
    void setPressure(double value);

signals:
    void pressureChanged();

private slots:
    void updatePressure();

private:
    double m_pressure = 0.0;
    QTimer m_timer;
};

#endif
