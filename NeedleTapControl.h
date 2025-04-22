#ifndef NEEDLETAPCONTROL_H
#define NEEDLETAPCONTROL_H

#include <QObject>

class NeedleTapControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double targetValue READ targetValue WRITE setTargetValue NOTIFY targetValueChanged)
    Q_PROPERTY(double currentValue READ currentValue WRITE setCurrentValue NOTIFY currentValueChanged)
    Q_PROPERTY(double stepSize READ stepSize WRITE setStepSize NOTIFY stepSizeChanged)

public:
    explicit NeedleTapControl(QObject *parent = nullptr);

    double targetValue() const;
    double currentValue() const;
    double stepSize() const;

public slots:
    void increase();
    void decrease();
    void openValve();
    void closeValve();
    void setTarget(double value);

    void setTargetValue(double value);
    void setCurrentValue(double value);
    void setStepSize(double value);

signals:
    void targetValueChanged();
    void currentValueChanged();
    void stepSizeChanged();

    void valveOpened();
    void valveClosed();

private:
    double m_targetValue;
    double m_currentValue;
    double m_stepSize;
};

#endif // NEEDLETAPCONTROL_H
