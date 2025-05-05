#ifndef CONTROLMANOMETR_H
#define CONTROLMANOMETR_H

#include <QObject>
#include <QTimer>


class ControlManometr : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double pressure READ pressure NOTIFY pressureChanged)
    Q_PROPERTY(double pLimit      READ pLimit      WRITE setPLimit      NOTIFY pLimitChanged)
    Q_PROPERTY(bool   overLimit   READ isOverLimit  NOTIFY overLimit)

public:
    explicit ControlManometr(QObject *parent = nullptr);

    double pressure() const            { return m_pressure; }
    double pLimit() const              { return m_pLimit; }
    bool   isOverLimit() const         { return m_overLimit; }

public slots:
    void setPLimit(double limit);      // установить pLimit из QML

signals:
    void pressureChanged();
    void pLimitChanged();
    void overLimit();                  // генерируется, когда pressure > pLimit

private slots:
    void updatePressure();             // вызывается таймером

private:
    QTimer  m_timer;
    double  m_pressure  = 0.0;
    double  m_pLimit    = 700.0;       // начальное значение
    bool    m_overLimit = false;
    int     m_direction = +1;          // +1 — растёт, −1 — падает
};

#endif
