#ifndef CONTROLNEEDLETAP_H
#define CONTROLNEEDLETAP_H

#include <QObject>
#include <QTimer>

class ControlNeedleTap : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal targetValue READ targetValue WRITE setTargetValue NOTIFY targetValueChanged)
    Q_PROPERTY(qreal currentValue READ currentValue WRITE setCurrentValue NOTIFY currentValueChanged)
    Q_PROPERTY(qreal stepSize READ stepSize WRITE setStepSize NOTIFY stepSizeChanged)

public:
    explicit ControlNeedleTap(QObject *parent = nullptr);

    // Геттеры
    qreal targetValue() const;
    qreal currentValue() const;
    qreal stepSize() const;

    // Сеттеры
    void setTargetValue(qreal value);
    void setCurrentValue(qreal value);
    void setStepSize(qreal value);


signals:
    void targetValueChanged();
    void currentValueChanged();
    void stepSizeChanged();

public slots:
    void increase();
    void decrease();
    void openValve();
    void closeValve();
    void setTarget(qreal value);

private:
    qreal m_targetValue = 0.0;
    qreal m_currentValue = 0.0;
    qreal m_stepSize = 1.0;

    void updateCurrentValue(qreal newValue);
};

#endif // CONTROLNEEDLETAP_H
