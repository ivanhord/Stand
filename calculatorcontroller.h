#ifndef CALCULATORCONTROLLER_H
#define CALCULATORCONTROLLER_H

#include <QObject>
#include <QQuickView>
#include <QWidget>

class CalculatorController : public QObject
{
    Q_OBJECT
public:
    explicit CalculatorController(QObject *parent = nullptr);
    Q_INVOKABLE void openCalculator();

private:
    QQuickView *calculatorView = nullptr;
    QWidget *calculatorContainer = nullptr;
};

#endif // CALCULATORCONTROLLER_H
