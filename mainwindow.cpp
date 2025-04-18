#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    // Настройка адаптивности
    setMinimumSize(800, 600);
    // Настройка политик изменения размеров
    ui->centralWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
    ui->headerFrame->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
    ui->mainFrame->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);

    // Создание QQuickWidget для отображения QML
    QQuickWidget *manometerWidget = new QQuickWidget;
    manometerWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    manometerWidget->setSource(QUrl("qrc:/qml/assets/qml/Manometr.qml"));
    manometerWidget->setClearColor(Qt::transparent); //

    // Вставка в первую вкладку tabWidget
    QVBoxLayout *layout = qobject_cast<QVBoxLayout *>(ui->standTab->layout());
    if (layout) {
        layout->addWidget(manometerWidget);
    }
}




MainWindow::~MainWindow()
{
    delete ui;
}
