#include <iostream>
#include <QApplication>
#include <QQmlApplicationEngine>

int main (int argc, char* argv[])
{
    
    //File manipulation
    qputenv("QML_XHR_ALLOW_FILE_READ","1");  
    qputenv("QML_XHR_ALLOW_FILE_WRITE","1");

    //environment variables
    
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QStringLiteral("qml/MainWindow.qml"));

    

    return app.exec();

}