#include <QQmlContext>
#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    // Настройка адаптивности
    setMinimumSize(800, 600);
    qmlRegisterType<QWindow>("QtQuick.Window", 2, 0, "Window");
    // Настройка политик изменения размеров
    ui->centralWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
    ui->headerFrame->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
    ui->stackedWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);    

    // Инициализация таймера для обновления времени
    m_updateTimer = new QTimer(this);
    connect(m_updateTimer, &QTimer::timeout, this, &MainWindow::updateDateTime);
    m_updateTimer->start(1000); // Обновление каждую секунду
    updateDateTime(); // Первоначальное обновление

    // Переключение страниц при смене вкладок
    connect(ui->tabWidget, &QTabWidget::currentChanged, this, [this](int index) {
        ui->stackedWidget->setCurrentIndex(index);
    });
    // Установить начальную страницу
    ui->stackedWidget->setCurrentIndex(ui->tabWidget->currentIndex());

    // Манометр
    // === Создаем объект контроллера давления ===
    manometrCtrl = new ControlManometr(this);
    QQuickWidget *manometerWidget = ui->manometerWidget;
    // Передаем объект в контекст
    QQmlContext *contextM = manometerWidget->rootContext();
    contextM->setContextProperty("manometrCtrl", manometrCtrl);
    manometerWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    manometerWidget->setSource(QUrl("qrc:/qml/assets/qml/Manometr.qml"));
    manometerWidget->setClearColor(Qt::transparent); //
    manometerWidget->setAttribute(Qt::WA_AlwaysStackOnTop);

    // Игольчатый экран
    // === Создаем объект контроллера положения заслонки ===
    needleTap = new ControlNeedleTap(this);
    QQuickWidget *valveWidget = ui->valveWidget;
    QQmlContext *contextN = valveWidget->rootContext();
    contextN->setContextProperty("needleCtrl", needleTap);
    //contextN->setContextProperty("calculatorCtrl", calculatorCtrl);
    valveWidget->setSource(QUrl(QStringLiteral("qrc:/qml/assets/qml/NeedleTap.qml")));
    valveWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    valveWidget->setClearColor(Qt::transparent);  // Прозрачный фон

    // Текущий расход
    // === Создаем объект контроллера  ===
    rateCtrl = new ControlRate(this);
    QQuickWidget *rateWidget = ui->rateWidget;
    QQmlContext *contextR = rateWidget->rootContext();
    contextR->setContextProperty("rateCtrl", rateCtrl);
    rateWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    rateWidget->setClearColor(Qt::transparent);
    rateWidget->setSource(QUrl("qrc:/qml/assets/qml/Rate.qml"));

    // Access the QQuickWidget for liquidWidget
    QQuickWidget *liquidWidget = ui->liquidWidget;
    QQmlContext *contextL = liquidWidget->rootContext();
    contextL->setContextProperty("rateCtrl", rateCtrl);
    liquidWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    liquidWidget->setClearColor(Qt::transparent);
    liquidWidget->setSource(QUrl("qrc:/qml/assets/qml/Liquid.qml"));

}

void MainWindow::updateDateTime()
{
    QDateTime currentDateTime = QDateTime::currentDateTime();
    ui->dateTimeLabel->setText(
        QStringLiteral("<html><head/><body><p align=\"center\">%1<br/>%2</p></body></html>")
            .arg(currentDateTime.toString("HH:mm"),
                 currentDateTime.toString("dd.MM.yyyy"))
        );
}

MainWindow::~MainWindow()
{
    m_updateTimer->stop();
    delete m_updateTimer;
    delete ui;
}
