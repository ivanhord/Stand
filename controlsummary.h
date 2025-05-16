// controlsummary.h
#ifndef CONTROLSUMMARY_H
#define CONTROLSUMMARY_H


#include <QObject>


class ControlSummary : public QObject
{
    Q_OBJECT
    public:
        explicit ControlSummary(QObject *parent = nullptr);

};

#endif // CONTROLSUMMARY_H
