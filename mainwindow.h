#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTabWidget>
#include <QQuickWidget>
#include <QQmlContext>
#include <QDateTime>
#include <QPixmap>
#include <QTimer>
#include <QDir>
#include <QFile>

#include "controlmanometr.h"
#include "controlneedletap.h"
#include "controlrate.h"
#include "controlsummary.h"

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
    // Вызывать при появлении новой ошибки
    void notifyError();

    // Вызывать, когда оператор квитирует ошибки (переходит на страницу ошибок или нажимает OK)
    void acknowledgeErrors();

private:
    Ui::MainWindow *ui;
    ControlManometr *manometrCtrl;
    ControlNeedleTap *needleTap;
    ControlRate *rateCtrl;
    ControlSummary *summaryCtrl;

    QTimer *m_updateTimer;
    bool    m_hasError       = false;   // есть непросмотренные ошибки?
    bool    m_acknowledged   = true;    // текущие ошибки уже квитированы?
    bool    m_blinkState     = false;   // текущее состояние мигания (цвет)
    QTimer  m_blinkTimer;               // таймер для мигания

    QPixmap m_pixmapGray;
    QPixmap m_pixmapOrange;

private slots:
    void updateDateTime();
    void onBlinkTimeout();

    void showMenuPage();
    void showMainPage();
};
#endif // MAINWINDOW_H
