#include <iostream>
#include <QApplication>
#include <QQmlApplicationEngine>

int main (int argc, char* argv[])
{
    // std::cout<< "1" << std::endl;
    // std::cout<< "2" << std::endl;
    // std::cout<< "3" << std::endl;
    // std::cout<< "4" << std::endl;

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QStringLiteral("qml/MainWindow.qml"));


    return app.exec();

}