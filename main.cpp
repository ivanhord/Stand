#include "mainwindow.h"

#include <QApplication>


int main(int argc, char *argv[])
{
    qputenv("QT_QUICK_CONTROLS_STYLE", "Material");
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
