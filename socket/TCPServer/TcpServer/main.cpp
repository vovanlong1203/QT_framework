#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "tcpserver.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/TcpServer/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    TcpServer server;

    engine.rootContext()->setContextProperty("server", &server);
    engine.load(url);

    return app.exec();
}
