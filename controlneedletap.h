#ifndef CONTROLNEEDLETAP_H
#define CONTROLNEEDLETAP_H

#include <QObject>
#include <QTimer>

// controlneedletap.h

class ControlNeedleTap : public QObject
{
    Q_OBJECT
    // Задаём запись только через setTarget()
    Q_PROPERTY(qreal targetValue
                   READ targetValue
                       WRITE setTarget
                           NOTIFY targetValueChanged)

    // Только чтение: текущее значение меняется внутри класса
    Q_PROPERTY(qreal currentValue
                   READ currentValue
                       NOTIFY currentValueChanged)

    // Шаг можно менять через setStepSize()
    Q_PROPERTY(qreal stepSize
                   READ stepSize
                       WRITE setStepSize
                           NOTIFY stepSizeChanged)

public:
    explicit ControlNeedleTap(QObject *parent = nullptr);

    qreal targetValue() const { return m_targetValue; }
    qreal currentValue() const { return m_currentValue; }
    qreal stepSize()   const { return m_stepSize; }

public slots:
    void setTarget(qreal value);
    void setStepSize(qreal value);
    void increase();
    void decrease();
    void openValve();
    void closeValve();

signals:
    void targetValueChanged();
    void currentValueChanged();
    void stepSizeChanged();

private slots:
    void onTimerTick();

private:
    QTimer  m_timer;
    qreal   m_targetValue  = 0.0;
    qreal   m_currentValue = 0.0;
    qreal   m_stepSize     = 1.0;

    static constexpr qreal FULL_CYCLE_SECONDS = 30.0;
    static constexpr int   TIMER_INTERVAL_MS   = 100;

    void startMoving();
};


#endif // CONTROLNEEDLETAP_H
