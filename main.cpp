#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Models/mymodel.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyModel>("CPP", 1, 0, "MyModel");

    qmlRegisterType<MyModel>("MyTypes", 1, 0, "MyModel");

    QQmlApplicationEngine engine;

    engine.addImportPath(":/qml");

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
