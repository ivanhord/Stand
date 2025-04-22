#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTabWidget>
#include <QQuickWidget>
#include <QQmlContext>
#include <QDateTime>
#include <QTimer>
#include <QDir>
#include <QFile>

#include "controlmanometr.h"

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    ControlManometr *manometrCtrl;
    QTimer *m_updateTimer;
};
#endif // MAINWINDOW_H
