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
#include <QtWidgets/QApplication>
#include <QtWidgets/QFrame>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QVBoxLayout *verticalLayout;
    QFrame *headerFrame;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QLabel *alertIconLabel;
    QFrame *recordFrame;
    QHBoxLayout *horizontalLayout_2;
    QLabel *recordIndicator;
    QLabel *recordLabel;
    QLabel *dateTimeLabel;
    QPushButton *menuButton;
    QFrame *mainFrame;
    QHBoxLayout *horizontalLayout_3;
    QTabWidget *tabWidget;
    QWidget *standTab;
    QVBoxLayout *verticalLayout1;
    QWidget *summaryTab;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(853, 528);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName("centralWidget");
        verticalLayout = new QVBoxLayout(centralWidget);
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
        horizontalLayout = new QHBoxLayout(headerFrame);
        horizontalLayout->setObjectName("horizontalLayout");
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Policy::Expanding, QSizePolicy::Policy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        alertIconLabel = new QLabel(headerFrame);
        alertIconLabel->setObjectName("alertIconLabel");
        alertIconLabel->setMaximumSize(QSize(16777215, 44));
        alertIconLabel->setStyleSheet(QString::fromUtf8("border-image: url(:/icons/assets/alert.svg) 0 0 0 0 stretch stretch;\n"
"min-width: 60px;\n"
"max-height: 44px;"));

        horizontalLayout->addWidget(alertIconLabel);

        recordFrame = new QFrame(headerFrame);
        recordFrame->setObjectName("recordFrame");
        recordFrame->setStyleSheet(QString::fromUtf8("background-color: transparent;"));
        recordFrame->setFrameShape(QFrame::Shape::NoFrame);
        horizontalLayout_2 = new QHBoxLayout(recordFrame);
        horizontalLayout_2->setObjectName("horizontalLayout_2");
        recordIndicator = new QLabel(recordFrame);
        recordIndicator->setObjectName("recordIndicator");
        recordIndicator->setStyleSheet(QString::fromUtf8("\n"
"            background-color: #00aa00;\n"
"            border: 1px solid #007700;\n"
"            border-radius: 2px;\n"
"            min-width: 16px;\n"
"            max-width: 16px;\n"
"            max-height: 8px;\n"
"          "));

        horizontalLayout_2->addWidget(recordIndicator);

        recordLabel = new QLabel(recordFrame);
        recordLabel->setObjectName("recordLabel");
        recordLabel->setStyleSheet(QString::fromUtf8("color: white;"));

        horizontalLayout_2->addWidget(recordLabel);


        horizontalLayout->addWidget(recordFrame);

        dateTimeLabel = new QLabel(headerFrame);
        dateTimeLabel->setObjectName("dateTimeLabel");
        dateTimeLabel->setStyleSheet(QString::fromUtf8("color: white;\n"
"font-size: 14px;\n"
"padding: 0 15px;"));
        dateTimeLabel->setTextFormat(Qt::TextFormat::RichText);
        dateTimeLabel->setAlignment(Qt::AlignmentFlag::AlignCenter);
        dateTimeLabel->setWordWrap(true);

        horizontalLayout->addWidget(dateTimeLabel);

        menuButton = new QPushButton(headerFrame);
        menuButton->setObjectName("menuButton");
        menuButton->setStyleSheet(QString::fromUtf8("QPushButton {\n"
"    background-color: #444444;\n"
"    color: white;\n"
"    border: 1px solid #555;\n"
"    border-radius: 4px;\n"
"    padding: 6px 12px;\n"
"}\n"
"QPushButton:hover {\n"
"    background-color: #555555;\n"
"}"));

        horizontalLayout->addWidget(menuButton);


        verticalLayout->addWidget(headerFrame);

        mainFrame = new QFrame(centralWidget);
        mainFrame->setObjectName("mainFrame");
        mainFrame->setFrameShape(QFrame::Shape::StyledPanel);
        mainFrame->setFrameShadow(QFrame::Shadow::Raised);
        horizontalLayout_3 = new QHBoxLayout(mainFrame);
        horizontalLayout_3->setObjectName("horizontalLayout_3");
        tabWidget = new QTabWidget(mainFrame);
        tabWidget->setObjectName("tabWidget");
        QSizePolicy sizePolicy1(QSizePolicy::Policy::Expanding, QSizePolicy::Policy::Minimum);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(tabWidget->sizePolicy().hasHeightForWidth());
        tabWidget->setSizePolicy(sizePolicy1);
        tabWidget->setStyleSheet(QString::fromUtf8("QTabBar::tab {\n"
"    background: #444444;\n"
"    color: white;\n"
"    padding: 8px;\n"
"    border: 1px solid #555;\n"
"    border-top-left-radius: 4px;\n"
"    border-top-right-radius: 4px;\n"
"}\n"
"QTabBar::tab:selected {\n"
"    background: #555555;\n"
"    border-bottom-color: #0078d7;\n"
"}"));
        standTab = new QWidget();
        standTab->setObjectName("standTab");
        QSizePolicy sizePolicy2(QSizePolicy::Policy::Preferred, QSizePolicy::Policy::Minimum);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(standTab->sizePolicy().hasHeightForWidth());
        standTab->setSizePolicy(sizePolicy2);
        verticalLayout1 = new QVBoxLayout(standTab);
        verticalLayout1->setObjectName("verticalLayout1");
        tabWidget->addTab(standTab, QString());
        summaryTab = new QWidget();
        summaryTab->setObjectName("summaryTab");
        sizePolicy2.setHeightForWidth(summaryTab->sizePolicy().hasHeightForWidth());
        summaryTab->setSizePolicy(sizePolicy2);
        tabWidget->addTab(summaryTab, QString());

        horizontalLayout_3->addWidget(tabWidget);


        verticalLayout->addWidget(mainFrame);

        MainWindow->setCentralWidget(centralWidget);

        retranslateUi(MainWindow);

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        alertIconLabel->setText(QString());
        recordLabel->setText(QCoreApplication::translate("MainWindow", "\320\227\320\260\320\277\320\270\321\201\321\214", nullptr));
        dateTimeLabel->setText(QCoreApplication::translate("MainWindow", "13:37 04.12.2023", nullptr));
        menuButton->setText(QCoreApplication::translate("MainWindow", "\320\234\320\265\320\275\321\216", nullptr));
        tabWidget->setTabText(tabWidget->indexOf(standTab), QCoreApplication::translate("MainWindow", "\320\241\321\202\320\265\320\275\320\264", nullptr));
        tabWidget->setTabText(tabWidget->indexOf(summaryTab), QCoreApplication::translate("MainWindow", "\320\241\320\262\320\276\320\264\320\272\320\260", nullptr));
        (void)MainWindow;
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
