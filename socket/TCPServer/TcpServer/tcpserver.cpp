#include "tcpserver.h"

TcpServer::TcpServer(QObject *parent) : QObject(parent), _clientSocket(nullptr), _isClientVerified(false)
{
    connect(&_server, &QTcpServer::newConnection, this, &TcpServer::onNewConnection);
    if(_server.listen(QHostAddress::LocalHost, 8000)) {
        qInfo() << "Server is listening for incoming connection.";
    } else {
        qInfo() << "Failed to start the server.";
    }
}

void TcpServer::sendMessage(const QString &message)
{
    if (_clientSocket && _isClientVerified) {
        _clientSocket->write(("Server: " + message).toUtf8());
        _clientSocket->flush();
    }
}

void TcpServer::onNewConnection()
{
    if (!_clientSocket) {
        _clientSocket = _server.nextPendingConnection();
        connect(_clientSocket, &QTcpSocket::readyRead, this, &TcpServer::onReadyRead);
        connect(_clientSocket, &QTcpSocket::disconnected, this, &TcpServer::onClientDisconnected);
    } else {
        QTcpSocket* nextSocket = _server.nextPendingConnection();
        nextSocket->close();
        nextSocket->deleteLater();
    }
}

void TcpServer::onReadyRead()
{
    if (_clientSocket && !_isClientVerified) {
        QByteArray data = _clientSocket->readAll();
        QString clientData = QString::fromUtf8(data).trimmed();

        QStringList parts = clientData.split(",");
        if (parts.size() == 2) {
            QString clientId = parts[0].trimmed();
            QString clientPassword = parts[1].trimmed();

            if (verifyClient(clientId, clientPassword)) {
                _isClientVerified = true;
                qInfo() << "data:   " << data << "clientdata :" << clientData;
                qInfo() << "Client verified.";
                sendScreenCaptureToClient();
                qInfo() << "fill hinh anh";
            } else {
                qInfo() << "Client authentication failed. Closing the connection.";
                _clientSocket->close();
                _clientSocket->deleteLater();
                _clientSocket = nullptr;
            }
        }
    } else {
        QByteArray message = _clientSocket->readAll();
        emit newMessage(message);
    }
}

void TcpServer::onClientDisconnected()
{
    if (_clientSocket) {
        _clientSocket->deleteLater();
        _clientSocket = nullptr;
        _isClientVerified = false;
    }
}

bool TcpServer::verifyClient(const QString &clientId, const QString &clientPassword)
{
    QString id = "123456";
    qInfo() << id;
    QString pass = "123456";
    qInfo() << pass;
    return (clientId == id && clientPassword == pass);
}

QString TcpServer::generateRandomId() {
    QString id;
    QString chars = "0123456789";

    for (int i = 0; i < 6; ++i) {
        int randomIndex = QRandomGenerator::global()->bounded(chars.length());
        id.append(chars.at(randomIndex));
    }
    return id;
}

QString TcpServer::generateRandomPassword() {
    QString password;
    QString chars = "0123456789";
    for (int i = 0; i < 6; i++) {
        int randomIndex = QRandomGenerator::global()->bounded(chars.length());
        password.append(chars.at(randomIndex));
    }
    return password;
}

void TcpServer::sendScreenCaptureToClient() {
    while(true) {
        QThread::msleep(100);
        QScreen *screen = QGuiApplication::primaryScreen();

        QPixmap screenshot = screen->grabWindow(0);
        QImage screenshotImage = screenshot.toImage();
//        QSize newSize(800, 700);
//        screenshotImage = screenshotImage.scaled(newSize);
        qDebug() << "ScreenshotImage " << screenshotImage.size();
        QByteArray byteArray11;
        QBuffer buffer1(&byteArray11);
        buffer1.open(QIODevice::WriteOnly);
        screenshotImage.save(&buffer1, "PNG"); // Lưu dưới định dạng PNG vào QByteArray
        buffer1.close();

        qDebug() << "byte array : " << byteArray11.size();
//        qDebug() << " ----> " << byteArray11;
        qint64 bytesWritten = _clientSocket->write(byteArray11);
        _clientSocket->flush();

        if (bytesWritten == -1) {
            qInfo() << "Failed to send screen capture to client.";
        } else {
            qInfo() << "Screen capture sent to client successfully.";
        }

////        QImage Format RGB32
//        QImage img(QSize(700, 700),QImage::Format_RGB32);
//        QPainter painter(&img);
//        painter.setBrush(QBrush(Qt::green));
//        painter.fillRect(QRectF(10,10,40,40),Qt::green);
//        painter.fillRect(QRectF(100,100,1000,1000),Qt::red);
////        Chuyển đổi QImage thành QByteArray
//        QByteArray byteArray;
//        QBuffer buffer(&byteArray);
//        buffer.open(QIODevice::WriteOnly);
//        img.save(&buffer, "PNG"); // Lưu dưới định dạng PNG vào QByteArray
//        buffer.close();

//        QImage image;
//        bool loaded = image.load("C:/Users/longvv/Downloads/screen.png");
//        QSize newSize(800, 600);
//        image = image.scaled(newSize);
//        qDebug() << "image laoded " << loaded ;
//        qDebug() << "size imaged loaded : " << image.size();
//        QByteArray byteArray;
//        QBuffer buffer(&byteArray);
//        buffer.open(QIODevice::WriteOnly);
//        image.save(&buffer, "PNG"); // Lưu dưới định dạng PNG vào QByteArray
//        buffer.close();
//        qDebug() << "size bytearray: " << byteArray.size();
//        qint64 bytesWritten = _clientSocket->write(byteArray);
//        _clientSocket->flush();

        }
}



