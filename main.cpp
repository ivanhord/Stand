#include "mainwindow.h"

#include <QApplication>


int main(int argc, char *argv[])
{
    qputenv("QT_QUICK_CONTROLS_STYLE", "Fusion");
    qDebug() << "QT_QUICK_CONTROLS_STYLE" << qgetenv("QT_QUICK_CONTROLS_STYLE");
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
