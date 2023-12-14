#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QDataStream>
#include <QImage>
#include <QThread>

class TcpClient : public QObject
{
    Q_OBJECT

public:
    explicit TcpClient(QObject *parent = nullptr);
    QString image() const;
    void setImage(const QString &image);

public slots:
    void connectToServer(const QString &clientId, const QString &clientPassword);
    void sendMessage(const QString &message);
    QString receiveImageFromServer();

private slots:
    void onConnected();
    void onReadyRead();
    void onDisconnected();

private:
    QTcpSocket _socket;
    bool _isClientVerified;

signals:
    void newMessage(const QByteArray &ba);
    void clientVerified(bool isVerified);
    void receivedImage();
};

#endif // TCPCLIENT_H
