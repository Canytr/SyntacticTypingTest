#include <iostream>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

//
#include "documenthandler.h"

int main (int argc, char* argv[])
{
    
    //File manipulation
    qputenv("QML_XHR_ALLOW_FILE_READ","1");  
    qputenv("QML_XHR_ALLOW_FILE_WRITE","1");

    //environment variables
    
    QApplication app(argc, argv);
    DocumentHandler document;

    qmlRegisterType<DocumentHandler>("org.sample", 1, 0, "DocumentHandler");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("documentHandler", &document);
    
    engine.load(QStringLiteral("qml/MainWindow.qml"));



    

    return app.exec();

}