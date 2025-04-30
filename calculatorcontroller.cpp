#include "calculatorcontroller.h"
#include <QQmlEngine>
#include <QQuickView>
#include <QWidget>

CalculatorController::CalculatorController(QObject *parent) : QObject(parent) {}

void CalculatorController::openCalculator()
{
    if (!calculatorView) {
        calculatorView = new QQuickView();
        calculatorView->setSource(QUrl("qrc:/qml/assets/qml/Calculator.qml"));
        calculatorView->setResizeMode(QQuickView::SizeRootObjectToView);
        calculatorView->setColor(Qt::transparent);

        // Создаем контейнер для QQuickView (иначе окно не будет отображаться)
        calculatorContainer = QWidget::createWindowContainer(calculatorView);
        calculatorContainer->setWindowFlags(Qt::Window | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint);
        calculatorContainer->setAttribute(Qt::WA_TranslucentBackground);
        calculatorContainer->resize(240, 400);
    }
    calculatorContainer->show();
}
