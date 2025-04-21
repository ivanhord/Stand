/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.9.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtQuickWidgets/QQuickWidget>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFrame>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStackedWidget>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QToolButton>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QVBoxLayout *verticalLayout;
    QFrame *headerFrame;
    QVBoxLayout *verticalHeaderLayout;
    QHBoxLayout *horizontalLayout;
    QTabWidget *tabWidget;
    QWidget *tabStand;
    QWidget *tabSummary;
    QSpacerItem *horizontalSpacer;
    QLabel *alertIconLabel;
    QFrame *recordFrame;
    QHBoxLayout *horizontalLayout_2;
    QLabel *recordIndicator;
    QLabel *recordLabel;
    QLabel *dateTimeLabel;
    QToolButton *menuButton;
    QStackedWidget *stackedWidget;
    QWidget *standPage;
    QHBoxLayout *standLayout;
    QQuickWidget *manometerWidget;
    QQuickWidget *valveWidget;
    QWidget *summaryPage;
    QVBoxLayout *summaryLayout;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(853, 528);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName("centralWidget");
        verticalLayout = new QVBoxLayout(centralWidget);
        verticalLayout->setSpacing(0);
        verticalLayout->setObjectName("verticalLayout");
        headerFrame = new QFrame(centralWidget);
        headerFrame->setObjectName("headerFrame");
        QSizePolicy sizePolicy(QSizePolicy::Policy::Preferred, QSizePolicy::Policy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(headerFrame->sizePolicy().hasHeightForWidth());
        headerFrame->setSizePolicy(sizePolicy);
        headerFrame->setStyleSheet(QString::fromUtf8("background-color: #333333;"));
        headerFrame->setFrameShape(QFrame::Shape::StyledPanel);
        verticalHeaderLayout = new QVBoxLayout(headerFrame);
        verticalHeaderLayout->setObjectName("verticalHeaderLayout");
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName("horizontalLayout");
        tabWidget = new QTabWidget(headerFrame);
        tabWidget->setObjectName("tabWidget");
        tabWidget->setLayoutDirection(Qt::LayoutDirection::LeftToRight);
        tabWidget->setStyleSheet(QString::fromUtf8("QTabWidget::pane {\n"
"    border: none;\n"
"    background: transparent;\n"
"    height: 0px;\n"
"}\n"
"QTabBar::tab { \n"
"	background: rgb(252, 161, 1);\n"
"    color: white; padding: 8px; \n"
"    border: 1px solid #555; \n"
"    border-top-left-radius: 4px; \n"
"    border-top-right-radius: 4px;\n"
"}\n"
"QTabBar::tab:selected { \n"
"	background: rgb(252, 177, 1); \n"
"	border-bottom-color: #0078d7; \n"
"}"));
        tabWidget->setTabPosition(QTabWidget::TabPosition::North);
        tabWidget->setTabShape(QTabWidget::TabShape::Rounded);
        tabWidget->setDocumentMode(true);
        tabWidget->setTabsClosable(false);
        tabWidget->setMovable(false);
        tabStand = new QWidget();
        tabStand->setObjectName("tabStand");
        tabWidget->addTab(tabStand, QString());
        tabSummary = new QWidget();
        tabSummary->setObjectName("tabSummary");
        tabWidget->addTab(tabSummary, QString());

        horizontalLayout->addWidget(tabWidget);

        horizontalSpacer = new QSpacerItem(0, 0, QSizePolicy::Policy::Expanding, QSizePolicy::Policy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        alertIconLabel = new QLabel(headerFrame);
        alertIconLabel->setObjectName("alertIconLabel");
        alertIconLabel->setMaximumSize(QSize(16777215, 44));
        alertIconLabel->setStyleSheet(QString::fromUtf8("border-image: url(:/icons/assets/alert.svg) 0 0 0 0 stretch stretch; min-width: 60px; max-height: 44px;"));

        horizontalLayout->addWidget(alertIconLabel);

        recordFrame = new QFrame(headerFrame);
        recordFrame->setObjectName("recordFrame");
        recordFrame->setStyleSheet(QString::fromUtf8("background-color: transparent;"));
        horizontalLayout_2 = new QHBoxLayout(recordFrame);
        horizontalLayout_2->setObjectName("horizontalLayout_2");
        recordIndicator = new QLabel(recordFrame);
        recordIndicator->setObjectName("recordIndicator");
        recordIndicator->setStyleSheet(QString::fromUtf8("background-color: #00aa00; border: 1px solid #007700; border-radius: 2px; min-width: 16px; max-width: 16px; max-height: 8px;"));

        horizontalLayout_2->addWidget(recordIndicator);

        recordLabel = new QLabel(recordFrame);
        recordLabel->setObjectName("recordLabel");
        recordLabel->setStyleSheet(QString::fromUtf8("color: white;"));

        horizontalLayout_2->addWidget(recordLabel);


        horizontalLayout->addWidget(recordFrame);

        dateTimeLabel = new QLabel(headerFrame);
        dateTimeLabel->setObjectName("dateTimeLabel");
        dateTimeLabel->setStyleSheet(QString::fromUtf8("color: white; font-size: 14px; padding: 0 15px;"));
        dateTimeLabel->setTextFormat(Qt::TextFormat::RichText);
        dateTimeLabel->setAlignment(Qt::AlignmentFlag::AlignCenter);

        horizontalLayout->addWidget(dateTimeLabel);

        menuButton = new QToolButton(headerFrame);
        menuButton->setObjectName("menuButton");
        menuButton->setStyleSheet(QString::fromUtf8("    QToolButton {\n"
"      background-color:qlineargradient(spread:reflect, x1:0, y1:1, x2:0, y2:0, stop:0 rgba(58, 58, 58, 255), stop:0.882927 rgba(101, 101, 101, 255));\n"
"      color: white;\n"
"      border: none;\n"
"      font-size: 14px;\n"
"    }\n"
"  "));
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/icons/assets/hamburger_menu.svg"), QSize(), QIcon::Mode::Normal, QIcon::State::Off);
        menuButton->setIcon(icon);
        menuButton->setIconSize(QSize(64, 20));
        menuButton->setToolButtonStyle(Qt::ToolButtonStyle::ToolButtonTextUnderIcon);

        horizontalLayout->addWidget(menuButton);


        verticalHeaderLayout->addLayout(horizontalLayout);


        verticalLayout->addWidget(headerFrame);

        stackedWidget = new QStackedWidget(centralWidget);
        stackedWidget->setObjectName("stackedWidget");
        QSizePolicy sizePolicy1(QSizePolicy::Policy::Expanding, QSizePolicy::Policy::Expanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(stackedWidget->sizePolicy().hasHeightForWidth());
        stackedWidget->setSizePolicy(sizePolicy1);
        stackedWidget->setStyleSheet(QString::fromUtf8("background-color: #333333;"));
        standPage = new QWidget();
        standPage->setObjectName("standPage");
        standLayout = new QHBoxLayout(standPage);
        standLayout->setObjectName("standLayout");
        manometerWidget = new QQuickWidget(standPage);
        manometerWidget->setObjectName("manometerWidget");
        manometerWidget->setMinimumSize(QSize(150, 150));
        manometerWidget->setStyleSheet(QString::fromUtf8("background: transparent;"));

        standLayout->addWidget(manometerWidget);

        valveWidget = new QQuickWidget(standPage);
        valveWidget->setObjectName("valveWidget");
        valveWidget->setMinimumSize(QSize(120, 120));
        valveWidget->setStyleSheet(QString::fromUtf8("background: transparent;"));

        standLayout->addWidget(valveWidget);

        stackedWidget->addWidget(standPage);
        summaryPage = new QWidget();
        summaryPage->setObjectName("summaryPage");
        summaryLayout = new QVBoxLayout(summaryPage);
        summaryLayout->setObjectName("summaryLayout");
        stackedWidget->addWidget(summaryPage);

        verticalLayout->addWidget(stackedWidget);

        MainWindow->setCentralWidget(centralWidget);

        retranslateUi(MainWindow);

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        tabWidget->setTabText(tabWidget->indexOf(tabStand), QCoreApplication::translate("MainWindow", "\320\241\321\202\320\265\320\275\320\264", nullptr));
        tabWidget->setTabText(tabWidget->indexOf(tabSummary), QCoreApplication::translate("MainWindow", "\320\241\320\262\320\276\320\264\320\272\320\260", nullptr));
        recordLabel->setText(QCoreApplication::translate("MainWindow", "\320\227\320\260\320\277\320\270\321\201\321\214", nullptr));
        dateTimeLabel->setText(QCoreApplication::translate("MainWindow", "<html><head/><body><p align=\"center\">13:37<br/>04.12.2023</p></body></html>", nullptr));
        menuButton->setText(QCoreApplication::translate("MainWindow", "\320\234\320\265\320\275\321\216", nullptr));
        (void)MainWindow;
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
