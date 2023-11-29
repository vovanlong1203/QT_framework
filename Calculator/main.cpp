#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "savefile.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Calculator/Main.qml"_qs);


    SaveFile test ;

    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("test",&test);
    engine.load(url);



    return app.exec();
}
