#include "tcpclient.h"
#include <QPixmap>
#include <QPainter>

TcpClient::TcpClient(QObject *parent) : QObject(parent), _isClientVerified(false)
{
    connect(&_socket, &QTcpSocket::connected, this, &TcpClient::onConnected);
    connect(&_socket, &QTcpSocket::readyRead, this, &TcpClient::onReadyRead);
}

void TcpClient::connectToServer(const QString &clientId, const QString &clientPassword)
{
    if (!_socket.isOpen()) {
        _socket.connectToHost(QHostAddress::LocalHost, 8000);
        if (_socket.waitForConnected()) {
            qDebug() << "Connected to server.";
            QString data = clientId + "," + clientPassword;
            _socket.write(data.toUtf8());
            _socket.flush();
        } else {
            qInfo() << "Failed to connect to server.";
        }
    }
}

void TcpClient::sendMessage(const QString &message)
{
    if (_socket.isOpen() && _isClientVerified) {
        _socket.write(message.toUtf8());
        _socket.flush();
    }
}

void TcpClient::onConnected()
{
    qInfo() << "Connection established.";
}

void TcpClient::onReadyRead()
{
    emit clientVerified(true);
    qDebug() << "onReady";
}

void TcpClient::onDisconnected()
{
    qInfo() << "Disconnected from server.";
    _isClientVerified = false;
}

QString TcpClient::receiveImageFromServer() {
//    QThread::msleep(100);
    if (_socket.isOpen() && !_isClientVerified) {
        _socket.waitForReadyRead(1);
        QDataStream socketStream(&_socket);

        QByteArray imageData;
        imageData =_socket.readAll();       
        QString image("data:image/png;base64,");
        image.append(QString::fromLatin1(imageData.toBase64()));
        emit receivedImage();
        return image;
    }
    return "";

}

