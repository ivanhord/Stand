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
    ui->stackedWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);

    // Переключение страниц при смене вкладок
    connect(ui->tabWidget, &QTabWidget::currentChanged, this, [this](int index) {
        ui->stackedWidget->setCurrentIndex(index);
    });
    // Установить начальную страницу
    ui->stackedWidget->setCurrentIndex(ui->tabWidget->currentIndex());

    // === Создаем объект контроллера давления ===
    manometrCtrl = new ControlManometr(this); 
    
    // Манометр
    QQuickWidget *manometerWidget = ui->manometerWidget;
    // Передаем объект в контекст
    QQmlContext *context = manometerWidget->rootContext();
    context->setContextProperty("manometrCtrl", manometrCtrl);
    
    manometerWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    manometerWidget->setSource(QUrl("qrc:/qml/assets/qml/Manometr.qml"));
    manometerWidget->setClearColor(Qt::transparent); //
    manometerWidget->setAttribute(Qt::WA_AlwaysStackOnTop);
    // Игольчатый экран
    QQuickWidget *valveWidget = ui->valveWidget;
    valveWidget->setSource(QUrl(QStringLiteral("qrc:/qml/assets/qml/NeedleTap.qml")));
    valveWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    valveWidget->setClearColor(Qt::transparent);  // Прозрачный фон

}




MainWindow::~MainWindow()
{
    delete ui;
}
