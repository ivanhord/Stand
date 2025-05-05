#include <QQmlContext>
#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    setMinimumSize(850, 650);
    qmlRegisterType<QWindow>("QtQuick.Window", 2, 0, "Window");
    // Изменения размеров
    ui->centralWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
    ui->headerFrame->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
    ui->stackedWidget->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);

    // Таймер мигания — 500 мс
    m_blinkTimer.setInterval(500);
    connect(&m_blinkTimer, &QTimer::timeout, this, &MainWindow::onBlinkTimeout);

    // Изначально иконка в сером цвете (нет ошибок)
    ui->alertIconLabel->setFixedSize(46, 30);
    ui->alertIconLabel->setScaledContents(true);

    m_pixmapGray   = QPixmap(":/icons/assets/alert_gray.svg");
    m_pixmapOrange = QPixmap(":/icons/assets/alert_orange.svg");
    // начальный серый
    ui->alertIconLabel->setPixmap(m_pixmapGray);

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

    this->resize(1024, 768);

    // Задаём веса для вертикали
    ui->standLayout->setStretch(0, 2);
    ui->standLayout->setStretch(1, 1);
    // Задаём веса для горизонтали
    ui->upperLayout->setStretch(0, 2);
    ui->upperLayout->setStretch(1, 1);
    ui->downLayout->setStretch(0, 2);
    ui->downLayout->setStretch(1, 1);

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

    notifyError();

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

void MainWindow::notifyError()
{
    // Появилась новая необработанная ошибка
    m_hasError     = true;
    m_acknowledged = false;
    m_blinkState   = false;    // начнём с серого
    m_blinkTimer.start();

  }

void MainWindow::acknowledgeErrors()
{
    if (!m_hasError) return;

    m_acknowledged = true;
    m_blinkTimer.stop();

    // Иконка горит оранжевым
    ui->alertIconLabel->setPixmap(m_pixmapOrange);

}

void MainWindow::onBlinkTimeout()
{
    if (!m_hasError || m_acknowledged) {
        // Если ошибок нет или они квитированы — останавливаем мигание
        m_blinkTimer.stop();
        return;
    }

    // Переключаем цвет
    m_blinkState = !m_blinkState;
    ui->alertIconLabel->setPixmap(m_blinkState
                                      ? m_pixmapOrange
                                      : m_pixmapGray);
}

MainWindow::~MainWindow()
{
    m_updateTimer->stop();
    delete m_updateTimer;
    delete ui;
}
