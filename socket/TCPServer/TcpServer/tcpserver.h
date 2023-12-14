#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QDebug>
#include <QUuid>
#include <QRandomGenerator>
#include <QScreen>
#include <QPixmap>
#include <QBuffer>
#include <QThread>
#include <QImage>
#include <QPainter>
#include <QGuiApplication>

class TcpServer : public QObject
{
    Q_OBJECT

public:
    explicit TcpServer(QObject *parent = nullptr);

    void sendScreenCaptureToClient();

Q_INVOKABLE QString generateRandomId();
Q_INVOKABLE QString generateRandomPassword();

signals:
    void newMessage(const QByteArray &ba);

public slots:
    void sendMessage(const QString &message);

private slots:
    void onNewConnection();
    void onReadyRead();
    void onClientDisconnected();

private:
    QTcpServer _server;
    QTcpSocket* _clientSocket;
    bool _isClientVerified;
    QString id;
    bool verifyClient(const QString &clientId, const QString &clientPassword);

};

#endif // TCPSERVER_H
