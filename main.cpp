#include <iostream>
#include <QApplication>
#include <QQmlApplicationEngine>

int main (int argc, char* argv[])
{
    //environment variables
    
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QStringLiteral("qml/MainWindow.qml"));

    //File manipulation
    qputenv("QML_XHR_ALLOW_FILE_READ","1");  
    qputenv("QML_XHR_ALLOW_FILE_WRITE","1");


    return app.exec();

}